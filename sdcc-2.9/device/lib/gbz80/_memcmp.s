	;; Implementation of some string functions in
	;; assembler.

	.area	_CODE
;int memcmp(void * buf1, void * buf2, size_t count) 
_memcmp::
    ra      = 0
    buf1    = ra + 2
    buf2    = buf1 + 2
    count   = buf2 + 2
    
    lda     hl,count(sp)   ; bc = count
    ld      c,(hl)
    inc     hl
    ld      b,(hl)
    lda     hl,buf2(sp)   ; de = buf2
    ld      e,(hl)
    inc     hl
    ld      d,(hl)
    lda     hl,buf1(sp)   ; hl = buf1
    ld      a,(hl+)
    ld      h,(hl)
    ld      l,a
    
4$:
    ld      a,b         ; if count = 0 
    or      a,c
    jr      z,0$        ; we're done = compare is equal
    dec     bc

    ld      a,(de)      ; compare one byte
    sub     (hl)        ; *buf2 - *buf1
    jr      c,2$        ; return +1
    jr      nz,1$       ; return -1
    inc     de          ; increment the addresses
    inc     hl
    jr      4$          ; and loop

0$: ; leave 0 in de
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
