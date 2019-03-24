/* Floating point library in optimized assembly for gameboy processor
 * Copyright (c) 2009, Robert Ramey www.rrsd.com
 */

char
__fslt (float u, float v)
{
	__asm
	.globl	.fscmp
	call	.fscmp
	ld		de,#0
    ret     nc
	inc		e
	__endasm;
}
