#include <errno.h>

long
_divslong(long u, long v)
{
    __asm
    .globl      .div_n

    ;; unsigned long result;
    ;; unsigned long modulus
    lda     sp,-9(sp)

    ;; stack displacements
    s   = 0
    m0  = s + 1
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

5$: lda     hl,s(sp)
    xor     a
    ld      (hl),a

    lda      hl,v0+3(sp) ; if v < 0 negate
    ld      a,(hl)
    bit     7,a
    jr      z,0$
    lda     hl,v0(sp)
    call    .neg_n
    lda     hl,s(sp)
    ld      (hl),#1

0$: lda     hl,u0+3(sp) ; if u < 0 negate
    ld      a,(hl)
    bit     7,a
    jr      z,1$
    lda     hl,u0(sp)
    call    .neg_n
    lda     hl,s(sp)
    ld      a,#1
    xor     (hl)
    ld      (hl),a

1$: lda     hl,v0(sp)
    push    hl
    lda     hl,u0+2(sp)
    push    hl
    lda     hl,r0+4(sp)
    push    hl
    lda     hl,m0+6(sp)
    push    hl
    call    .div_n
    lda     sp,8(sp)
    
    lda     hl,s(sp)
    rr      (hl)
    jr      nc,3$
    ld      b,#4
    xor     a
    lda     hl,r0(sp)
    call    .neg_n

    ;; return the result in the appropriate registers
3$: lda     hl,r0(sp); return value
    ld      a,(hl+)
    ld      e,a
    ld      a,(hl+)
    ld      d,a
    ld      a,(hl+)
    ld      h,(hl)
    ld      l,a
exit:
    lda     sp,9(sp)
    __endasm;
}

