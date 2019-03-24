/*
 * Game Boy Vario Program
 *
 * by Robert Ramey
 * December 1998
 *
 * program designed to test the communication between the gameboy
 * and the pic on the gameboy vario card.  Instructions:
 *
 * left pair of hex digits contains command to be sent
 * right pair of hex digits contains response.
 *
 * 1) use joy pad  right/left to select hex digit to set
 * 2) use joy pad to increment/decrement to the desired digit
 * 3) use A button to send command once
 * 4) use B button to read response
 * 5) use start button to start sending command repeatedly
 * 6) use start button to stop sending command repeatedly
 */

#include <gb/gb.h>
#include <string.h>
#include "display.h"
#include "checkkey.h"

#define local static

local BOOL timertripped;	// timer interrupted tripped

/* legal values are 4096, 16384, 65536, 262144 */
typedef enum CLOCK_SELECTION {
	cf256K = 1,
	cf64K = 2,
	cf16K = 3,
	cf4K = 0
};

#define CLOCK_SELECTED cf4K

#if CLOCK_SELECTED == cf4K
	#define CLOCK_FREQUENCY 4096
#elif CLOCK_SELECTED == cf16K
	#define CLOCK_FREQUENCY 16384
#elif CLOCK_SELECTED == cf64K
	#define CLOCK_FREQUENCY 65536
#elif CLOCK_SELECTED == cf256K
	#define CLOCK_FREQUENCY 262144
#endif

/* times per second for polling/update */
#define INTERRUPT_FREQUENCY 16

/* times per second for polling/update */
#if (256 < (CLOCK_FREQUENCY / INTERRUPT_FREQUENCY))
	#error Invalid combination of clock and interrupt frequency
#endif

/* 
 * called if the joy pad bounces. capture bits for later 
 */
local void
onjoy(void){
    setkey();
}

/*
 * timer will call this INTERRUPT_FREQUENCY times every second
 */
local void
ontimer(void) interrupt  {
	timertripped = TRUE;
	// reenable joypad
	P1_REG = 0x00;
}

local void
onvblank(){
    display_update();
}

void
main(){
	/* initialization */
	disable_interrupts();
	/* initialize LCD configuration register */
	/*
	LCDC_REG = 0x61;
	7 - 0:LCD On
	6 - 1;Win tile map display at $9800
	5 - 1;Window display on
	4 - 0:BG & Window Tile Data Select $8800-$97ff
	3 - 0:BG tile map display at $9C00
	2 - 0:Sprite is 8x8
	1 - 1:Sprite display on
	0 - 1:BG display on
	*/
	/* note: my gameboy doesn't seem to show the window */
	/* if the background is hidden.  So show the background */
	/* even though in this ap it is covered by the window */
	SHOW_BKG;
	SHOW_WIN;
	HIDE_SPRITES;
	display_init();

	/* setup timer at CLOCK_FREQUENCY times/second */
	/* start time at 64 KHz */
	TAC_REG = 0x4 | CLOCK_SELECTED;	

	/* timer overflows INTERRUPT_FREQUENCY times/second */
	TMA_REG = 256 - (CLOCK_FREQUENCY / INTERRUPT_FREQUENCY);

	add_TIM(ontimer);

	/* now let everything get started */
	add_VBL(onvblank);

	/* capture joy pad movement */
	add_JOY(onjoy);
    P1_REG = 0x00;

	set_interrupts(VBL_IFLAG | TIM_IFLAG | JOY_IFLAG);

    enable_interrupts(); 

	DISPLAY_ON;

	/* main loop */
    timertripped = TRUE;
	for(;;){
		/*
		we invoke this function outside of the interrupt handler
		in order to permit it to be take longer than the 
		interrupt handler time.  That, is this stuff can
		itself be interrupted
		*/
		if(timertripped){
			checkkey();
			timertripped = FALSE;
		}
	}
}

