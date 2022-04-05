/*
 * SD Spielwiese.c
 *
 * Created: 05.04.2022 08:54:09
 * Author : Timo
 */ 

#include <avr/io.h>
#include "ff.h"		/* Declarations of FatFs API */
#include <avr/interrupt.h>
#include <string.h>
#include "uart.h"
#include "xitoa.h"
#include "ff.h"
#include "diskio.h"

BYTE Buff[4096];	/* Working buffer */
FATFS FatFs[2];		/* Filesystem object for each logical drive */
FIL File[2];		/* File object */
DIR Dir;			/* Directory object */
FILINFO Finfo;

void setup_io(void)
{
	PORTA_DIR = 0b01011001;	//SPI Interface Input/Output
	PORTC_DIR = 0b00000000;
	PORTD_DIR = 0b01100000;	//LED Outputs
	PORTC_PIN0CTRL = (1 << 3);	//Pullup für Button
}

int main(void)
{
	char line[120];
	char *ptr, *ptr2;
	long p1, p2, p3;
	LBA_t lba;
	FRESULT fr;
	BYTE b1, *bp;
	UINT s1, s2, cnt, blen = sizeof Buff, acc_dirs, acc_files;
	DWORD ofs, sect = 0, dw, acc_size;
	static const char* const fst[] = {"", "FAT12", "FAT16", "FAT32", "exFAT"};
	FATFS *fs;
	
	ccp_write_io((void *) & (CLKCTRL.OSCHFCTRLA), (0b10001101)); //HF Clock Runstandby, 4 MHz CLK_Main, Autotune
	setup_io();
	
	uart_init(115200);		/* Initialize UART driver */
	xdev_out(uart_putc);	/* Register uart_putc() to xitoa module as console output */
	xputs(PSTR("\nFatFs Module Test Monitor\n"));
	xprintf(PSTR("LFN=%S, CP=%u\n"), FF_USE_LFN ? PSTR("Enabled") : PSTR("Disabled"), FF_CODE_PAGE);
	#ifdef DRV_CFC
	xprintf(PSTR("CFC ==> %u\n"), DRV_CFC);
	#endif
	#ifdef DRV_MMC
	xprintf(PSTR("MMC ==> %u\n"), DRV_MMC);
	#endif
		
    /* Replace with your application code */
    while (1) 
    {
    }
}

