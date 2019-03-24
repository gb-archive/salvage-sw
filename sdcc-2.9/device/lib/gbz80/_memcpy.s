	.area	_CODE
; void *memcpy(void *dest, const void *source, int count)
_memcpy::
    ra      = 0
    dest    = ra + 2
    source  = dest + 2
    count   = source + 2
    
    lda     hl,count(sp)    ; bc = count
    ld      a,(hl+)
    ld      c,a
    ld      b,(hl)
    lda     hl,source(sp)   ; de = source
    ld      e,(hl)
    inc     hl
    ld      d,(hl)
    lda     hl,dest(sp)     ; hl = dest
    ld      a,(hl+)
    ld      h,(hl)
    ld      l,a
    
$0: ld      a,b
    or      c
    ret     z

    ld      a,(de)
    inc     de
    ld      (hl),a
    
    dec     bc
    inc     hl
    jr      $0
