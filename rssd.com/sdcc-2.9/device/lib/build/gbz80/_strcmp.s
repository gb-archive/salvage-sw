	.area	    _CODE
; int strcmp (char * buf1, char * buf2)
_strcmp::
    ra      = 0
    buf1    = ra + 2
    buf2    = buf1 + 2
    
    lda     hl,buf1(sp)
    ld      d,h
    ld      e,l
    lda     hl,buf2(sp)
    
0$: ld      a,(de)
    ld      b,a
    sub     (hl)
    jr      c,1$
    jr      nz,2$
    
    inc     de
    inc     hl
    ld      a,b
    xor     a
    jr      nz,0$
    
    ; leave 0 in hl
    xor     a;
    ld      h,a
    ld      l,a
    ret
1$: ; leave -1 in hl
    xor     a;
    ld      h,a
    ld      l,a
    ret
2$: ; leave + 1 in hl
    xor     a;
    ld      h,a
    ld      l,a
    inc     hl
    ret
