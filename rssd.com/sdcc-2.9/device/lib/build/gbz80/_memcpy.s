	.area	_CODE
; void *memcpy(void *dest, const void *source, int count)
_memcpy::
    ra      = 0
    dest    = ra + 2
    source  = dest + 2
    count   = source + 2
    
    lda     hl,count(sp)
    ld      a,(hl+)
    ld      c,a
    ld      b,(hl)
    lda     hl,dest(sp)
    ld      d,h
    ld      e,l
    lda     hl,source(sp)
    
0$:
    ld      a,b
    or      c
    jr      z,1$
    
    ld      a,(hl+)
    ld      (de),a
    inc     de
    dec     bc
    jr      0$
    
1$: lda     hl,dest(sp)
    ret
