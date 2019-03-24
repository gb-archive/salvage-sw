/* Floating point library in optimized assembly for gameboy processor
 * Copyright (c) 2009, Robert Ramey www.rrsd.com
 */
char exponentf(const float x)
{
	__asm
	ra  =   0
	x0  =   ra + 2

	lda		hl,x0+3(sp)
    ld      e,(hl)
    dec     hl
    ld      a,(hl)
    rl      a           ; put lsb of exponent in carry
    rl      e           ; normalize exponent
	__endasm;
}
