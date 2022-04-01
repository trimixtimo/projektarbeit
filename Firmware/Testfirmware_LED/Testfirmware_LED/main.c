/*
 * Testfirmware_LED.c
 *
 * Created: 30.03.2022 11:53:45
 * Author : Timo Klaas
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

#include <avr/io.h>
#include <avr/delay.h>
#include <avr/cpufunc.h>

void setup_io(void)
{
	PORTA_DIR = 0b01011001;	//SPI Interface Input/Output
	PORTC_DIR = 0b00000000;
	PORTD_DIR = 0b01100000;	//LED Outputs
	PORTC_PIN0CTRL = (1 << 3);	//Pullup für Button
}
void setup_vref(void)
{
	VREF_ADC0REF = VREF_ALWAYSON_bm | VREF_REFSEL_VREFA_gc;	//Referenzspannung immer an, externe Referenzspannung
}
void setup_adc(void)
{
	ADC0_CTRLA |= (ADC_RUNSTBY_bm | ADC_FREERUN_bm);
	ADC0_CTRLC |= ADC_PRESC_DIV256_gc;	//niedriger Takt für maximale Auflösung: 4 MHz / 256 = 15 kHz
	ADC0_MUXPOS = 0x01; //für RAW-Input
	//ADC0_MUXPOS = 0x02; //für HULL-Input
	ADC0_DBGCTRL |= ADC_DBGRUN_bm;	//ADC debugging
	ADC0_CTRLA |= ADC_ENABLE_bm;	//ADC einschalten
	_delay_ms(1);
	ADC0_COMMAND |= ADC_STCONV_bm;	//erste Messung starten
}
void setup_timer(void)
{
	TCA0_SINGLE_PER = periodendauer_us;
	TCA0_SINGLE_CTRLA = (TCA_SINGLE_RUNSTDBY_bm | (0x02 << 1) | TCA_SINGLE_ENABLE_bm);	//Prescaler 4: 4 MHz / 4 = 1 MHz
	TCA0_SINGLE_DBGCTRL = 0x01;	//debugging
	TCA0_SINGLE_INTCTRL = TCA_SINGLE_OVF_bm;	//Überlauf-Interrupt aktiviert
	
	//TCA0_SINGLE_INTFLAGS = 1; muss in der ISR aufgerufen werden
	
}
uint16_t adc_read(void)
{
	return ADC0_RES;
}

int main(void)
{
	ccp_write_io((void *) & (CLKCTRL.OSCHFCTRLA), (0b10001101)); //HF Clock Runstandby, 4 MHz CLK_Main, Autotune
	setup_io();
	
	while(1)
	{	
		if(!(PORTC_IN & 0x01))
		{
			PORTD_OUTSET = 0b00100000;
			_delay_ms(500);
			PORTD_OUTCLR = 0b00100000;
			_delay_ms(500);
			PORTD_OUTSET = 0b01000000;
			_delay_ms(500);
			PORTD_OUTCLR = 0b01000000;
			_delay_ms(500);
		}
		else
		{
			PORTD_OUTSET = 0b00100000;
			PORTD_OUTSET = 0b01000000;
			_delay_ms(100);
			PORTD_OUTCLR = 0b00100000;
			PORTD_OUTCLR = 0b01000000;
			_delay_ms(100);
		}
	}
}

