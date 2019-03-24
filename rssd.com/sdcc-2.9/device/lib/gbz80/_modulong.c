#include "errno.h"

unsigned long
_modulong (unsigned long u, unsigned long v)
{
    __asm
    .globl      .chkzero
    .globl      .div_n
    .globl      .zero_n
    .globl      _errno

    ;; unsigned long result;
    ;; unsigned long modulus
    lda     sp,-8(sp)

    ;; stack displacements
    m0  = 0
    r0  = m0 + 4
    ra  = r0 + 4
    u0  = ra + 2    ; return address - 2 bytes
    v0  = u0 + 4

    ld      b,#4

    ;; filter out the case where numerator is zero
    lda     hl,u0(sp)
    call    .chkzero
    jr      nz,4$
    xor     a
    ld      e,a
    ld      d,a
    ld      l,a
    ld      h,a
    jp      exit

    ;; filter out the case where denominator is zero
4$: lda     hl,v0(sp)
    call    .chkzero
    jr      nz,5$
    ld      a,#EDOM
    ld      (_errno),a
    ld      a,#0xff
    ld      e,a
    ld      d,a
    ld      l,a
    ld      h,#0x7f
    jp      exit

5$: lda     hl,v0(sp)
    push    hl
    lda     hl,u0+2(sp)
    push    hl
    lda     hl,r0+4(sp)
    push    hl
    lda     hl,m0+6(sp)
    push    hl
    call    .div_n
    lda     sp,8(sp)

    ;; return the result in the appropriate registers
    lda     hl,m0(sp); return modulus
    ld      a,(hl+)
    ld      e,a
    ld      a,(hl+)
    ld      d,a
    ld      a,(hl+)
    ld      h,(hl)
    ld      l,a
exit:
    lda     sp,8(sp)
    __endasm;
}
