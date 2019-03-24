/* Floating point library in optimized assembly for gameboy processor
 * Copyright (c) 2009, Robert Ramey www.rrsd.com
 */
float scalef(float x, char s)
{
	__asm
	ra  =   0
    s   =   ra + 2
	x0  =   s + 2

    lda     hl,s(sp);
    ld      a,(hl)

	lda		hl,x0+3(sp)
    ld      d,(hl)
    dec     hl
    ld      e,(hl)
    rl      e           ; put lsb of exponent in carry
    rl      d           ; save sign in carry
    push    af
    add     d           ; a contains the new exponent
    pop     af          ; recover original sign
    ld      d,a
    rr      d           ; put sign back into msb
    rr      e           ; move lsb to 2nd byte

	lda		hl,x0(sp)
    ld      c,(hl)
    inc     hl
    ld      b,(hl)
    ld      h,b
    ld      l,c

	__endasm;

}
