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
 * PD5 LED1 Gr?n
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
	PORTC_PIN0CTRL = (1 << 3);	//Pullup f?r Button
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

