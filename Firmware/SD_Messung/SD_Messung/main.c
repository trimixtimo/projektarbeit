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
 * PD5 LED1 Gr�n
 * PD6 LED2 Blau
 * PD7 VSENSE
 */

#define F_CPU 4000000UL	//Takt 4MHz
#define periodendauer_us 1000UL	//Abtastrate ADC

#include <avr/io.h>
#include <avr/delay.h>
#include <avr/cpufunc.h>
#include <avr/interrupt.h>

void setup_io(void)
{
	PORTA_DIR = 0b01011001;	//SPI Interface Input/Output
	PORTC_DIR = 0b00000000;	//Alles Eing�nge, Button an C0
	PORTD_DIR = 0b01100000;	//LED Outputs 5,6
	PORTC_PIN0CTRL = (1 << 3);	//Pullup f�r Button an C0
}
void setup_vref(void)
{
	VREF_ADC0REF = VREF_ALWAYSON_bm | VREF_REFSEL_VREFA_gc;	//Referenzspannung immer an, externe Referenzspannung VREFA
}
void setup_adc(void)
{
	ADC0_CTRLA = (ADC_RUNSTBY_bm | ADC_FREERUN_bm);	//Freerunning Modus, Single Ended 12bit, kein Leftadjust, Runstandby	
	ADC0_CTRLC = ADC_PRESC_DIV256_gc;	//niedriger Takt f�r maximale Aufl�sung: 4 MHz / 256 = 15 kHz ADC Takt
	ADC0_MUXPOS = 0x01; //f�r RAW-Input
	//ADC0_MUXPOS = 0x02; //f�r HULL-Input
	ADC0_MUXNEG = 0x40; //�berfl�ssig weil Single Ended, zur Sicherheit
	
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
	TCA0_SINGLE_INTCTRL = TCA_SINGLE_OVF_bm;	//�berlauf-Interrupt aktiviert
	
	//TCA0_SINGLE_INTFLAGS = 1; muss in der ISR aufgerufen werden
	
}
void timer_start(void)
{
	TCA0_SINGLE_CTRLA |= TCA_SINGLE_ENABLE_bm;	//Timer starten
}
void timer_stop(void)
{
	cli();	//Interrupts unterdr�cken
	TCA0_SINGLE_CTRLA &= ~TCA_SINGLE_ENABLE_bm;	//Timer stoppen
	TCA0_SINGLE_CNT = 0x00;	//Timer zur�cksetzen
	sei();	//Interrupts wieder zulassen
}
uint16_t adc_read(void)
{
	return ADC0_RES;
}

int main(void)
{
	ccp_write_io((void *) & (CLKCTRL.OSCHFCTRLA), (0b10001101)); //HF Clock Runstandby, 4 MHz CLK_Main, Autotune
	setup_io();
	setup_vref();
	setup_adc();
	setup_timer();
	
	while(1)
	{
		timer_start();
		_delay_ms(500);
		timer_stop();
		_delay_ms(500);
	}
}
