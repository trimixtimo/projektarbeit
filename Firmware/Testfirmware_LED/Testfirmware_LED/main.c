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

#include <avr/io.h>
#include <avr/delay.h>

void setup_cpu(void)
{
	CCP = CCP_IOREG_gc;	//Schreibschutz aufheben
	CLKCTRL_MCLKCTRLA |= 0b00000000;	//Disable Clock-Out, interne Clock
	CLKCTRL_MCLKCTRLB |= (0x8 <<1) | (0x01);	//Prescaler 6x, Prescaler an -> 4MHz CLK Main
}
void setup_io(void)
{
	PORTA_DIR |= 0b01011001;	//SPI Interface Input/Output
	PORTC_DIR |= 0b00000000;
	PORTD_DIR |= 0b01100000;	//LED Outputs
	PORTC_PIN0CTRL |= 1 << 3;	//Pullup für Button
}
void setup_vref(void)
{
	VREF_ADC0REF = VREF_ALWAYSON_bm | VREF_REFSEL_VREFA_gc;	//Referenzspannung immer an, externe Referenzspannung
}


int main(void)
{
	void setup_cpu();
	void setup_io();
	
    while (1) 
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
}

