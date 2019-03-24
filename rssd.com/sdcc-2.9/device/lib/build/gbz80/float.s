;	floating point support routines
;	used in	more than one module

;	floating point format
;	1 bit sign 0 =>	positive, 1	=> negative
;	8 bits exponent	in excess 127 notation
;	23 bits	- significand leading 1	bit	implied

	.area	_CODE

.chkzero::
	;; hl -	address	of low order byte
	;; b  -	number of bytes	to check
	;; note	- little endian	means byte with	lowest address !
	;; return z	flag
	xor		a
	ld		c,b
4$:	cp		(hl)
	ret		nz
	inc		hl
	dec		c
	jr		nz,4$
	ret

.unpack::
	;; unpack bits of floating point value
	;; entry
	;;		HL = address of	high order byte	(highest address)
	;; exit
	;;		A  = returned exponent
	;;		carry =	sign
	;;
	push	hl
	ld		a,(hl-)		; u3
	ld		c,a
	ld		a,(hl)		; u2
	set		7,(hl)		; set msb of significand to	1
	rla					; leave	lsb	of exp in carry
	ld		a,c
	rla					; add lsb to exp - leave sign in carry
	pop		hl
	ld		(hl),a		; save exponent	in u3
	ret

.fixsign::
    ;;       hl = address of float - msb
    ;; return Z flag indicates value is zero
    
    xor     a
    bit     7,(hl)
    jr      z,0$
    ld      a,#0x80
    
0$: cp      (hl)
    ret      nz
    
    xor     a
    
    dec     hl
    cp      (hl)
    ret     nz
        
    dec     hl
    cp      (hl)
    ret     nz
    
    dec     hl
    cp      (hl)
    ret     nz
    
    inc     hl
    inc     hl
    inc     hl
    res     7,(hl)
    ret

.cmp:
    ;; de - u
    ;; hl - v
    ;; return z for u == v
    ;;        c if v > u
	ld      c,#3
0$: ld      a,(de)
    sub     (hl)
    ret     nz
    dec     de
    dec     hl
    dec     c
    ret     z
    jr      0$
        
;; compare two floating point numbers
	;; parameters passed on	stack u, v
	;; return value	in flags according to the following	key
	;; u > v	!z & !c <==> !(z || c)
	;; u ==	v	z
	;; u < v	c
	;; u >=	v	!c
	;; u <=	v	z || c

	ra1	=	0
	ra	=	ra1	+ 2
	u	=	ra + 2
	v	=	u +	4
    .if     0
.fscmp::
	lda		hl,u+3(sp)
	call    .fixsign
	lda		hl,v+3(sp)
	call    .fixsign
	
	lda		hl,u+3(sp)    ; if u < 0
	bit     7,(hl)
	jr      z,1$
	
	lda		hl,v+3(sp)    ;     if v < 0
	bit     7,(hl)
	jr      z,1$

	lda		hl,v+3(sp)    ;       return v < u
	ld		d,h
	ld		e,l
	lda		hl,u+3(sp)
	jr  	.cmp
	                      ; 
	
1$: lda		hl,u+3(sp)    ; return u < v
	ld		d,h
	ld		e,l
	lda		hl,v+3(sp)
	jr    .cmp

    .endif
    
.fscmp::
	lda		hl,u+3(sp)
	call    .fixsign
	lda		hl,v+3(sp)
	call    .fixsign
	
	lda		hl,u+3(sp)    ; if u < 0
	bit     7,(hl)
	jr      z,1$
	
	lda		hl,v+3(sp)    ;     if v < 0
	bit     7,(hl)
	jr      z,2$

	lda		hl,v+3(sp)    ;         return v < u
	ld		d,h
	ld		e,l
	lda		hl,u+3(sp)
	jr  	.cmp
    
2$: xor     a             ;      else // v >= 0
    ccf
    ret                   ;          return ! z & c
    
1$: lda		hl,v+3(sp)    ;  else // u >= 0
	bit     7,(hl)        ;     if v < 0
	jr      z,4$
	xor     a             ;          return ! z & ! c
	dec     a
	ret

4$:                       ;     else // v >= 0
	lda		hl,u+3(sp)    ;         return v < u
	ld		d,h
	ld		e,l
	lda		hl,v+3(sp)
	jr  	.cmp

