	;; Implementation of some string functions in
	;; assembler.

	.area	_CODE
;int memcmp(void * buf1, void * buf2, size_t count) 
_memcmp::
    ra      = 0
    buf1    = ra + 2
    buf2    = buf1 + 2
    count   = buf2 + 2
    
    lda     hl,count(sp)
    ld      a,(hl+)
    ld      c,a
    ld      b,(hl)
    lda     hl,buf1(sp)
    ld      d,h
    ld      e,l
    lda     hl,buf2(sp)
    
4$:
    ld      a,b         ; if count = 0 
    or      a,c
    jr      z,0$        ; we're done = compare is equal
   
    dec     bc

    ld      a,(de)      ; compare one byte
    sub     (hl)
    jr      c,1$
    jr      nz,2$
    inc     de          ; and increment the addresses
    inc     hl
    jr      4$

0$: ; leave 0 in hl
    xor     a;
    ld      h,a
    ld      l,a
    ret
1$: ; leave -1 in hl
    xor     a;
    ld      h,a
    ld      l,a
    dec     hl
    ret
2$: ; leave + 1 in hl
    xor     a;
    ld      h,a
    ld      l,a
    inc     hl
    ret
