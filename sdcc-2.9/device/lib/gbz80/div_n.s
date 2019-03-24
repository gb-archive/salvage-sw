    ;; Stubs to match between function names
    .area   _CODE
    .globl  .cmp_n
    .globl  .sub_n
    .globl  .sla_n
    .globl  .zero_n
    .globl  .set_n
    .globl  .chkzero
    .globl  _errno
    
;   B = number of bytes to to divide
;   (sp + 2) address of mod u / v
;   (sp + 4) address of result u / v
;   (sp + 6) address of u
;   (sp + 8) address of v
;
;   stack displacements

    bc  =   0           ; temporary storage for bit and byte count
    ra  =   bc + 2
    m0  =   ra + 2
    r0  =   m0 + 2
    u0  =   r0 + 2
    v0  =   u0 + 2
    
.div_n::
    ld      a,b         ; multiply byte count by 8
    sla     a
    sla     a
    sla     a
    ld      c,a         ; initialize counter
    push    bc
    
    lda     hl,r0(sp)
    ld      a,(hl+)     ; deref
    ld      h,(hl)
    ld      l,a
    call    .zero_n
    
    lda     hl,m0(sp)
    ld      a,(hl+)     ; deref
    ld      h,(hl)
    ld      l,a
    call    .zero_n
    
0$: lda     hl,u0(sp)
    ld      a,(hl+)
    ld      h,(hl)
    ld      l,a
    xor     a           ; reset carry
    call    .sla_n      ; u <<= 1
    push    af          ; save the carry flag
    lda     hl,m0+2(sp)
    ld      a,(hl+)     ; deref
    ld      h,(hl)
    ld      l,a
    pop     af          ; recover carry flag
    push    hl
    call    .sla_n      ; append high bit from u to m
    pop     de          ; de == m
    lda     hl,v0(sp)
    ld      a,(hl+)     ; deref
    ld      h,(hl)
    ld      l,a         ; hl == v
    push    de
    push    hl
    call    .cmp_n      ; if v <= m // <=> ! (v > m) <=> ! ( 0 > m - v )
    pop     hl
    pop     de
    jr      c,1$
    call    .sub_n      ;    m -= v // carry should be reset now
1$:
    ccf
    push    af          ; save carry flag
    lda     hl,r0+2(sp) ; damn! resets the carry
    ld      a,(hl+)     ; deref
    ld      h,(hl)
    ld      l,a
    pop     af          ; recover carry flag
    call    .sla_n      ; r <<= 1 + carry

    pop     bc
    dec     c
    ret     z
    push    bc
    jr      0$
