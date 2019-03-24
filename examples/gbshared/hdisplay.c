/*
 * code to implement the altitude display
 */
#include <gb/gb.h>
#include "../gbshared/assert.h"
#include "../hdisplay.h"

/* Large digits for altimeter */
#include "hdigits.h"   /* 6x3 tiled digits */
#define CELLWIDTH 3
#define CELLHEIGHT 6
#define CELLSIZE (CELLWIDTH * CELLHEIGHT)
#define HEX_COLUMN 0
#define HEX_ROW 0
#define HEX_ROW_COUNT 3
#define HEX_COL_COUNT 6

/* where display has changed. Initialize to all blanks */
local INT8 hex_display[HEX_ROW_COUNT][HEX_COL_COUNT];
local UINT8 row;
/*
 * insert a digit bitmap into a tile map
 */

local void
hex_mapdigit(UINT8 index, UINT8 digit){
	set_win_tiles(
		HEX_COLUMN + CELLWIDTH * index,
		HEX_ROW + CELLHEIGHT * row,
		CELLWIDTH,
		CELLHEIGHT,
		hdigitstiles + digit * CELLSIZE
	);
}

/*
 * copy tiles for vario digits to fixed window
 */
/* call this during blanking */
local void
hex_display_update(){
	UINT8 j;
	for(j = HEX_COL_COUNT;j-- > 0;){
		INT8 x = hex_display[row][j];
		if(-1 != x)
			hex_mapdigit(j, (UINT8)x);
	}
}

/* call this to change the displayed value */
void
hex_display_set(UINT8 r, INT32 z){
	static UINT8 *cptr; // over aggresive optimization makes this fail unless its static
	static UINT8 *sptr;
    sptr = hex_display[r];
	cptr = sptr + HEX_COL_COUNT;
	/* right fill digits */
    if(0 == z)
		*--cptr = 0;
	else{
		do{
			UINT8 x = z & 0x0f;
			if(x != *--cptr)
				*cptr = x;
			else
				*cptr = -1;
            z >>= 4;
		}while(0 < z && cptr > sptr);
	}
	/* blank fill to the left */
	while(cptr-- > sptr){
		if(0x10 != *cptr)
			*cptr = 0x10;
		else
			*cptr = -1;
	}
    row = r;
}

/* call this to change the displayed value */
void
decimal_display_set(UINT8 r, INT32 z){
	static INT8 *cptr; // over aggresive optimization makes this fail unless its static
	static INT8 *sptr;
    sptr = hex_display[r];
	cptr = sptr + HEX_COL_COUNT;
	/* right fill digits */
    if(0 == z)
		*--cptr = 0;
	else{
		do{
            UINT8 x = z % 10;
			if(x != *--cptr)
				*cptr = x;
			else
				*cptr = -1;
            z /= 10;
		}while(0 < z && cptr > sptr);
	}
	/* blank fill to the left */
	while(cptr > sptr){
		if(0x10 != *--cptr)
			*cptr = 0x10;
		else
			*cptr = -1;
	}
    row = r;
}

void 
hex_display_reinit(){
	UINT8 i, j;
	for(i = HEX_ROW_COUNT;i-- > 0;)
	    for(j = HEX_COL_COUNT;j-- > 0;)
            hex_display[i][j] = 0x10;
}

/* initialize the altitude display */
void
hex_display_init(){
	UINT8 i, j;
	UINT8 blankrow[32];
	UBYTE nullpattern[16];

	/* load tiles to be displayed at bottom */
	/* note: we depend on the fact that the first window tile */
	/* is the lowest index into the tile pattern table */
	set_win_data(
		hdigitstiles[0],
		sizeof_hdigitsdata() / 16,
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
    hex_display_reinit();
}
