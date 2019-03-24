	.area	_CODE
; char *strcpy(char *dest, const char *source)
_strcpy::

    ra      = 0
    dest    = ra + 2
    source  = dest + 2
    lda     hl,dest(sp)
    ld      d,h
    ld      e,l
    lda     hl,source(sp)
    
$0: ld      a,(hl+)
    ld      (de),a
    inc     de
    and     a
    jr      nz,$0
    ld      h,d
    ld      l,e
    ret
    