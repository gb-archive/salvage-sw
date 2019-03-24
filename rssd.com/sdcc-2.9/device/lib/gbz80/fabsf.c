/* Floating point library in optimized assembly for gameboy processor
 * Copyright (c) 2009, Robert Ramey www.rrsd.com
 */
#include <math.h>

float fabsf(float x)
{
	__asm
	ra  =   0
	x0  =   ra + 2

	lda		hl,x0+3(sp)
	res		7,(hl)
	__endasm;
	return x;
}
