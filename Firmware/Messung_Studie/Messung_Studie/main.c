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

#define F_CPU 4000000UL	//Takt 4MHz
#define periodendauer_us 1000UL	//Abtastrate ADC
#define baudrate_reg(baudrate) ((float)(F_CPU * 64 / (16 * (float)baudrate)))
#define baudrate 57600

#include <avr/io.h>
#include <util/delay.h>
#include <avr/cpufunc.h>
#include <avr/interrupt.h>
#include <stdbool.h>
#include <string.h>
#include <stdlib.h>

volatile uint16_t messwert = 0;	//globale, nicht von Optimierung erfasste Variable
bool neuer_messwert = 0;	//ungespeicherter Messwert vorhanden
bool messung_laeuft = 0;		//laufende Messung

void setup_io(void)
{
	PORTA_DIR = 0b01011001;	//SPI Interface Input/Output
	PORTC_DIR = 0b00000000;	//Alles Eingänge, Button an C0
	PORTD_DIR = 0b01100000;	//LED Outputs 5,6
	PORTC_PIN0CTRL = (1 << 3);	//Pullup für Button an C0
}
void setup_vref(void)
{
	VREF_ADC0REF = VREF_ALWAYSON_bm | VREF_REFSEL_VREFA_gc;	//Referenzspannung immer an, externe Referenzspannung VREFA
}
void setup_adc(void)
{
	ADC0_CTRLA = (ADC_RUNSTBY_bm | ADC_FREERUN_bm);	//Freerunning Modus, Single Ended 12bit, kein Leftadjust, Runstandby	
	ADC0_CTRLC = ADC_PRESC_DIV256_gc;	//niedriger Takt für maximale Auflösung: 4 MHz / 256 = 15 kHz ADC Takt
	ADC0_MUXPOS = 0x01; //für RAW-Input
	//ADC0_MUXPOS = 0x02; //für HULL-Input
	ADC0_MUXNEG = 0x40; //Überflüssig weil Single Ended, zur Sicherheit
	
	ADC0_DBGCTRL = ADC_DBGRUN_bm;	//ADC debugging
	ADC0_CTRLA |= ADC_ENABLE_bm;	//ADC einschalten
	_delay_ms(1);
	ADC0_COMMAND = ADC_STCONV_bm;	//erste Messung starten
}
void setup_timer(void)
{
	TCA0_SINGLE_PER = periodendauer_us;
	TCA0_SINGLE_CTRLA = (TCA_SINGLE_RUNSTDBY_bm | (0x02 << 1) | TCA_SINGLE_ENABLE_bm);	//Prescaler 4: 4 MHz / 4 = 1 MHz
	TCA0_SINGLE_DBGCTRL = 0x01;	//debugging
	TCA0_SINGLE_INTCTRL = TCA_SINGLE_OVF_bm;	//Überlauf-Interrupt aktiviert	
}
void setup_uart(void)
{
	USART0.BAUD = (uint16_t) baudrate_reg(baudrate);	//set Baud rate for FME
	USART0.CTRLC = USART_CMODE_ASYNCHRONOUS_gc | USART_PMODE_DISABLED_gc | USART_SBMODE_1BIT_gc | USART_CHSIZE_8BIT_gc;	//asynchron | no parity | 1 stop bit | 8 data bits
	//USART0.CTRLA = USART_RXCIE_bm;	//enable receive interrupt
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
uint16_t adc_read(void)
{
	return ADC0_RES;
}
void wert_senden(uint16_t wert)
{
	char buffer[3];
	itoa(wert, buffer, 10);
	uart0_sendString(buffer);
}

int main(void)
{
	ccp_write_io((void *) & (CLKCTRL.OSCHFCTRLA), (0b10001101)); //HF Clock Runstandby, 4 MHz CLK_Main, Autotune, CLK_PER = CLK_Main
	setup_io();
	setup_vref();
	setup_adc();
	setup_timer();
	setup_uart();
	sei();
	while(1)
	{
		/*
		if(!(PORTC_IN & 0x01))	//Schalter ein
		{
			if (messung_laeuft)	//Messung läuft bereits
			{
				if (neuer_messwert)	//Neuer Messwert vorhanden
				{
					wert_senden(messwert);
					neuer_messwert = false;
				}
			} 
			else //Messung läuft noch nicht
			{
				timer_start();	//Messung starten
			}
		} 
		else//Schalter aus
		{
			timer_stop();	//Messung stoppen
		}*/
		wert_senden(messwert);
		_delay_ms(500);
	}
}

ISR(TCA0_OVF_vect)
{
	TCA0_SINGLE_INTFLAGS = 1; //Löscht das Interrupt-Flag
	timer_reset();	//Timer wieder auf 0
	messwert = adc_read();
	neuer_messwert = true;
	
}