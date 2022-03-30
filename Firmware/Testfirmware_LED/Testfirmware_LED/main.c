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

int setup_cpu(void)
{
	//CCP setzen!
	CLKCTRL_MCLKCTRLA = 0b00000000;	//Disable Clock-Out, interne Clock
	CLKCTRL_MCLKCTRLB = (0x8 <<1) | (0x01);	//Prescaler 6x, Prescaler an -> 4MHz CLK Main
}
int setup_io(void)
{
	PORTA_DIR = 01011001;	//SPI Interface Input/Output
	PORTC_DIR = 00000000;
	PORTD_DIR = 01100000;	//LED Outputs
	PORTC_PIN0CTRL = 1 << 3;	//Pullup für Button
}


int main(void)
{
    /* Replace with your application code */
    while (1) 
    {
		
    }
}

