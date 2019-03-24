	.area	_CODE
; void *memset(void *buf, const unsigned char ch, size_t count)
_memset::
    ra      = 0
    buf     = ra + 2
    ch      = buf + 2
    count   = ch + 1
    
    lda     hl,count(sp)
    ld      a,(hl+)
    ld      c,a
    ld      b,(hl)
    lda     hl,ch(sp)
    ld      d,(hl)
    lda     hl,buf(sp)
    
0$: ld      a,b
    or      c
    ret     z
    dec     bc
    ld      (hl),d
    inc     hl
    jr      0$
    
  