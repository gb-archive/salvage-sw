/*
 * code to implement the altitude display
 */
#include "types.h"
#include <gb/gb.h>
#include "display.h"
#include "hdigits.h"	/* 6x3 letters a-f */

#define DISPLAY_BANK
#include "banks.h"

#define local static

/* Large digits for altimeter */
#define CELLWIDTH 3
#define CELLHEIGHT 6
#define CELLSIZE (CELLWIDTH * CELLHEIGHT)
#define ALTITUDE_COLUMN 0
#define ALTITUDE_ROW 12

/* where display has changed. Initialize to all blanks */
local INT8 display[4];

/*
 * insert a digit bitmap into a tile map
 */
local void
mapdigit(UINT8 index, UINT8 digit){
	if(index > 1)
		++index;
	set_win_tiles(
		ALTITUDE_COLUMN + CELLWIDTH * index,
		ALTITUDE_ROW,
		CELLWIDTH,
		CELLHEIGHT,
		hdigitstiles + (UINT16)digit * CELLSIZE
	);
}

/*
 * copy tiles for vario digits to fixed window.
 * This is called during vertical blanking.  update screen only in here
 * to avoid "snow"
 */
void
display_update() banked {
	UINT8 j;
	for(j = sizeof(display);j-- > 0;){
		INT8 x = display[j];
		if(-1 == x)
			continue;
		display[j] = -1;
		mapdigit(j, (UINT8)x);
	}
}

/* call this to change a displayed digit */
void
display_set(UINT8 i, UINT8 value) banked {
	display[i] = value;
}

/* initialize the altitude display */
void
display_init() banked {
	UINT8 i;
	unsigned char blankrow[32];
	unsigned char nullpattern[16];
	for(i = sizeof(display);i-- > 0;)
		display[i] = -1;

	move_win(7,0);

	/* load tiles to be displayed at bottom */
	/* note: we depend on the fact that the first window tile */
	/* is the lowest index into the tile pattern table */
	set_win_data(
		hdigitstiles[0],
		/* note: the following doesn't work as the sizeof operator */
		/* on this compiler (gdbk 2.94) returns an 8 bit value */
		/* So - until further notice use the equivalent hard */
		/* coded value */
		/* sizeof(hdigitsdata) / 16,*/
		214,
		hdigitsdata
	);
	/* blank out the background */
	for(i = 16;i-- > 0;)
		nullpattern[i] = 0;
	set_win_data(127, 1, nullpattern);
	for(i = 32;i-- > 0;)
		blankrow[i] = 127;
	for(i = 32;i-- > 0;){
		set_win_tiles(0,i,32,1,blankrow);
	}

	display_set(0, 0);
	display_set(1, 0);
}
