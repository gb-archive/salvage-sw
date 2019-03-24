#include <gb/gb.h>
#include "display.h"
#include "checkkey.h"

/* note: bank applies to the WHOLE module */
#define KEY_BANK
#include "banks.h"

#define local static

local UBYTE key;			// joypad keys touched

local UINT8 cmd_left;
local UINT8 cmd_right;
local BOOL loop;

enum {
	left_digit,
	right_digit,
} selected_digit;

BOOL
getloop() banked {
    return loop;
}

void
setkey(void) banked {
	key |= joypad();
}

/* calibrate vario either up or down by about one foot*/
void
checkkey() banked {
	/* if keyup is pressed */
	if(J_UP & key){
		if(selected_digit == left_digit){
			++cmd_left;
			display_set(0, cmd_left & 0x0f);
		}
		else{
			++cmd_right;
			display_set(1, cmd_right & 0x0f);
		}
	}
	else
	if(J_DOWN & key){
		if(selected_digit == left_digit){
			--cmd_left;
			display_set(0, cmd_left & 0x0f);
		}
		else{
			--cmd_right;
			display_set(1, cmd_right & 0x0f);
		}
	}
	else
	if(J_LEFT & key)
		selected_digit = left_digit;
	else
	if(J_RIGHT & key)
		selected_digit = right_digit;
	else
	if(J_START & key)
		loop = TRUE;
	else
	if(J_SELECT & key){
		loop = FALSE;
	}
	else
	if(J_A & key){
		display_set(2, BLANK_SPACE);
		display_set(3, BLANK_SPACE);
	}
	else
	if(J_B & key){
	}
	key = 0;
}

