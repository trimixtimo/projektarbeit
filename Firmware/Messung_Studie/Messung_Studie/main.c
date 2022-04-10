/*
 * SD_Messung.c
 *
 * Created: 01.04.2022 22:42:57
 * Author : Timo
 */ 

/*
 * A0 TX
 * A1 RX
 * A3 CS
 * A4 MOSI
 * A5 MISO
 * A6 SCK
 * A7 !SS
 * C0 Button
 * PD1 RAW_IN
 * PD2 HULL_IN
 * PD5 LED1 Grün
 * PD6 LED2 Blau
 * PD7 VSENSE
 */

#define F_CPU 16000000UL	//Takt 16MHz
#define periodendauer_us 100	//Abtastrate ADC in µs
#define baudrate_reg(baudrate) ((float)(F_CPU * 64 / (16 * (float)baudrate)))
#define baudrate 500000UL
#define uart0_maxstrlen 3
#define hull_cmd "hul"
#define raw_cmd "raw"
#define stop_cmd "stp"

#include <avr/io.h>
#include <util/delay.h>
#include <avr/cpufunc.h>
#include <avr/interrupt.h>
#include <stdbool.h>
#include <string.h>
#include <stdlib.h>
#include <stdint.h>

volatile uint16_t messwert = 0;	//globale, nicht von Optimierung erfasste Variable
volatile uint8_t uart0_str_count = 0;
char uart0_string[uart0_maxstrlen + 1] = "";

bool neuer_messwert = false;	//ungespeicherter Messwert vorhanden
bool messung_laeuft = 0;		//laufende Messung
bool cmd = 0;
uint16_t mode;
uint8_t hull;

void setup_io(void)
{
	PORTA_DIR = 0b01011001;	//SPI Interface Input/Output
	PORTC_DIR = 0b00000000;	//Alles Eingänge, Button an C0
	PORTD_DIR = 0b01100000;	//LED Outputs 5,6
	PORTC_PIN0CTRL = (1 << 3);	//Pullup für Button an C0
	PORTD_OUTSET = 0b01100000;	//beide LEDs an
}
void setup_vref(void)
{
	VREF_ADC0REF = VREF_ALWAYSON_bm | VREF_REFSEL_VREFA_gc;	//Referenzspannung immer an, externe Referenzspannung VREFA
}
void setup_adc(void)
{
	ADC0_CTRLA = (ADC_RUNSTBY_bm | ADC_FREERUN_bm);	//Freerunning Modus, Single Ended 12bit, kein Leftadjust, Runstandby	
	ADC0_CTRLC = ADC_PRESC_DIV32_gc;	//niedriger Takt für maximale Auflösung: 16 MHz / 32 = 500 kHz ADC Takt
	ADC0_MUXNEG = 0x40; //überflüssig, weil single-ended, nur zur Sicherheit
	ADC0_DBGCTRL = ADC_DBGRUN_bm;	//ADC debugging
	ADC0_SAMPCTRL = 0x10;		//Sample Dauer um 16 Takte verlängern -> geringere Belastung der Signalquelle
}
void setup_timer(void)
{
	TCA0_SINGLE_PER = periodendauer_us;
	TCA0_SINGLE_CTRLA = (TCA_SINGLE_RUNSTDBY_bm | (0x04 << 1) | TCA_SINGLE_ENABLE_bm);	//Prescaler 16: 16 MHz / 16 = 1 MHz
	TCA0_SINGLE_DBGCTRL = 0x01;	//debugging
	TCA0_SINGLE_INTCTRL = TCA_SINGLE_OVF_bm;	//Überlauf-Interrupt aktiviert	
}
void setup_uart(void)
{
	USART0.BAUD = (uint16_t) baudrate_reg(baudrate);	//set Baud rate
	USART0.CTRLC = USART_CMODE_ASYNCHRONOUS_gc | USART_PMODE_DISABLED_gc | USART_SBMODE_1BIT_gc | USART_CHSIZE_8BIT_gc;	//asynchron | no parity | 1 stop bit | 8 data bits
	USART0.CTRLA = USART_RXCIE_bm;	//enable receive interrupt
	USART0.DBGCTRL = USART_DBGRUN_bm;	//debugging mode
	USART0.CTRLB = USART_RXEN_bm |USART_TXEN_bm;	//uart rx und tx aktivieren
}

void uart0_sendChar(char c)
{
	while (!(USART0.STATUS & USART_DREIF_bm)){;}
	USART0.TXDATAL = c;
}
void uart0_sendString(char *str)
{
	for (uint8_t i = 0; i < strlen(str); i++)
	{
		uart0_sendChar(str[i]);
	}
}
void timer_start(void)
{
	TCA0_SINGLE_CTRLA |= TCA_SINGLE_ENABLE_bm;	//Timer starten
}
void timer_stop(void)
{
	cli();	//Interrupts unterdrücken
	TCA0_SINGLE_CTRLA &= ~TCA_SINGLE_ENABLE_bm;	//Timer stoppen
	TCA0_SINGLE_CNT = 0x00;	//Timer zurücksetzen
	sei();	//Interrupts wieder zulassen
}
void timer_reset (void)
{
	TCA0_SINGLE_CNT = 0x00;	//Timer zurücksetzen
}
void adc_channel_selection(void){
	ADC0_COMMAND = ADC_SPCONV_bm;	//Messung stoppen
	if (hull == 1)
	{
		ADC0_MUXPOS = 0x02; //für HULL-Input
	}
	else
	{
		ADC0_MUXPOS = 0x01; //für RAW-Input
	}
	_delay_ms(1);
	ADC0_CTRLA |= ADC_ENABLE_bm;	//ADC einschalten
	_delay_ms(1);
	ADC0_COMMAND = ADC_STCONV_bm;	//erste Messung starten
}
uint16_t adc_read(void)
{
	return ADC0_RES;
}
void wert_senden(uint16_t wert)
{
	char buffer[3];
	itoa(wert, buffer, 16);
	uart0_sendString(buffer);
	uart0_sendString("\n");
}

int main(void)
{
	CCP = CCP_IOREG_gc;	//geschützes Register entsperren
	CLKCTRL.OSCHFCTRLA = 0b10011101; //HF Clock Runstandby, 16 MHz CLK_Main, Autotune, CLK_PER = CLK_Main
	
	setup_io();
	setup_vref();
	setup_adc();
	setup_timer();
	timer_stop();
	setup_uart();
	adc_channel_selection();
	
	sei();

	
	while(1)
	{}
}

ISR(TCA0_OVF_vect)
{
	TCA0_SINGLE_INTFLAGS = 1; //löscht das Interrupt-Flag
	timer_reset();	//Timer wieder auf 0
	wert_senden(adc_read());
	neuer_messwert = 1;
}

ISR(USART0_RXC_vect)
{
	unsigned char nextChar;
	nextChar = USART0.RXDATAL;	//8 data bis, only use low register
	if (1 == 1) //if latest string got precessed completely
	{
		if (nextChar != '\n' && nextChar != '\r' && uart0_str_count < uart0_maxstrlen)	//save char if not end of line or max
		{
			uart0_string[uart0_str_count] = nextChar;
			uart0_str_count++;
		}
		else	//end of line or max length reached
		{
			uart0_str_count = 0;
			
			if (strcmp(uart0_string, hull_cmd) == 0)
			{
				hull = 1;
				adc_channel_selection();
				timer_start();	//Messung starten
				messung_laeuft = true;
				PORTD_OUTSET = 0b00100000;	//grün
				PORTD_OUTCLR = 0b01000000;	//blau aus
			}
			if(strcmp(uart0_string, raw_cmd) == 0)
			{
				hull = 0;
				adc_channel_selection();
				timer_start();	//Messung starten
				messung_laeuft = true;
				PORTD_OUTSET = 0b01000000;	//blau
				PORTD_OUTCLR = 0b00100000;	//grün aus
			}
			if(strcmp(uart0_string, stop_cmd) == 0)
			{
				neuer_messwert = 0;
				timer_stop();	//Messung stoppen
				messung_laeuft = false;
				PORTD_OUTSET = 0b01100000;	//beide LEDs
			}			
		}
	}
}
