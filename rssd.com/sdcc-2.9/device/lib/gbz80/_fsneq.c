/* Floating point library in optimized assembly for gameboy processor
 * Copyright (c) 2009, Robert Ramey www.rrsd.com
 */

/* compare two floats */
char 
__fsneq (float a1, float a2)
{
	__asm
	.globl	.fscmp
	call	.fscmp
	ld		de,#0
    ret     z
	inc		e
	__endasm;
}
