	.area	_CODE
; char *strcpy(char *dest, const char *source)
_strcpy::

    ra      = 0
    dest    = ra + 2
    source  = dest + 2
    lda     hl,source(sp)   ; de = source
    ld      e,(hl)
    inc     hl
    ld      d,(hl)
    lda     hl,dest(sp)     ; hl = dest
    ld      a,(hl+)
    ld      h,(hl)
    ld      l,a
    
$0: ld      a,(de)
    inc     de
    ld      (hl),a
    and     a
    ret     z
    inc     hl
    jr      $0
    