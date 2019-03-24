/* Floating point library in optimized assembly for gameboy processor
 * Copyright (c) 2009, Robert Ramey www.rrsd.com
 */

/* compare two floats */
char
__fseq (float u, float v)
{
	__asm
	.globl	.fscmp
	call	.fscmp
	ld		de,#0
    ret     nz
	inc		e
	__endasm;
}
