/* Floating point library in optimized assembly for gameboy processor
 * Copyright (c) 2009, Robert Ramey www.rrsd.com
 */

/* subtract two floats */
float __fssub (float u, float v)
{
    __asm
    .globl  ___fsadd

    ra  =   0
    u  =   ra + 2
    v  =   u + 4

    lda     hl,v+3(sp) ; complement sign bit second argument
    rl      (hl)
    ccf
    rr      (hl)
    jp      ___fsadd
    __endasm;
}
