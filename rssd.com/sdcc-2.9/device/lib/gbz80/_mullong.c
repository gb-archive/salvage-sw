long
_mullong (unsigned long u, unsigned long v){
    __asm
    .globl  .mul_n

    ;; stack displacements before argument setup
    r0  =   0
    ra  =   r0+4        ; return address - 2 bytes
    u0  =   ra+2
    v0  =   u0+4

    lda     sp,-4(sp)
    lda     hl,v0(sp)
    push    hl
    lda     hl,u0+2(sp)
    push    hl
    lda     hl,r0+4(sp)
    push    hl

    ld      b,#4
    call    .mul_n

    lda     sp,6(sp)

    lda     hl,r0(sp)   ; get address of result
    ld      a,(hl+)     ; return result in dehl
    ld      e,a
    ld      a,(hl+)
    ld      d,a
    ld      a,(hl+)
    ld      h,(hl)
    ld      l,a

    lda     sp,4(sp)
    ret

    __endasm;
}
