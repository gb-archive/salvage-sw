	.area	    _CODE
; int strcmp (char * buf1, char * buf2)
_strcmp::
    ra      = 0
    buf1    = ra + 2
    buf2    = buf1 + 2
    
    lda     hl,buf1(sp)   ; de = buf1
    ld      e,(hl)
    inc     hl
    ld      d,(hl)
    lda     hl,buf2(sp)   ; hl = buf2
    ld      a,(hl+)
    ld      h,(hl)
    ld      l,a
    
0$: ld      a,(de)
    sub     (hl)
    jr      c,1$
    jr      nz,2$
    
    inc     de
    inc     hl
    xor     a
    jr      nz,0$
    
    ; leave 0 in de
    ld      d,a
    ld      e,a
    ret
1$: ; leave -1 in de
    xor     a;
    ld      d,a
    ld      e,a
    dec     de
    ret
2$: ; leave +1 in de
    xor     a;
    ld      d,a
    ld      e,a
    inc     de
    ret
