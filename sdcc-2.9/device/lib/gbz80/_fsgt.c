/* Floating point library in optimized assembly for gameboy processor
 * Copyright (c) 2009, Robert Ramey www.rrsd.com
 */

char
__fsgt (float u, float v)
{
	__asm
	.globl	.fscmp
	call	.fscmp
	ld		de,#0
    ret     z
    ret     c
    inc     e
	__endasm;
}

