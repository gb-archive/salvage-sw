;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.0 #5416 (Apr  7 2010) (MINGW32)
; This file was generated Fri Jun 11 23:46:58 2010
;--------------------------------------------------------
	.module _realloc
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _realloc
;--------------------------------------------------------
;  ram data
;--------------------------------------------------------
	.area _DATA
;--------------------------------------------------------
; overlayable items in  ram 
;--------------------------------------------------------
	.area _OVERLAY
;--------------------------------------------------------
; external initialized ram data
;--------------------------------------------------------
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;../_realloc.c:76: void __xdata * realloc (void * p, size_t size)
;	---------------------------------
; Function realloc
; ---------------------------------
_realloc:
	lda	sp,-10(sp)
;../_realloc.c:134: }
	di
;../_realloc.c:84: pthis = _sdcc_find_memheader(p);
	lda	hl,12(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	__sdcc_find_memheader
	lda	sp,2(sp)
	ld	b,d
	ld	c,e
	lda	hl,8(sp)
	ld	(hl),c
	inc	hl
	ld	(hl),b
;../_realloc.c:85: if (pthis)
	dec	hl
	ld	a,(hl+)
	or	a,(hl)
	jp	Z,00114$
;../_realloc.c:87: if (size > (0xFFFF-HEADER_SIZE))
	ld	a,#0xF9
	lda	hl,14(sp)
	sub	a,(hl)
	ld	a,#0xFF
	inc	hl
	sbc	a,(hl)
	jp	NC,00111$
;../_realloc.c:89: ret = (void __xdata *) NULL; //To prevent overflow in next line
	lda	hl,4(sp)
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
	jp	00115$
00111$:
;../_realloc.c:93: size += HEADER_SIZE; //We need a memory for header too
	lda	hl,14(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x0006
	add	hl,de
	ld	a,l
	ld	d,h
	lda	hl,14(sp)
	ld	(hl+),a
	ld	(hl),d
;../_realloc.c:95: if ((((unsigned int)pthis->next) - ((unsigned int)pthis)) >= size)
	lda	hl,8(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	lda	hl,2(sp)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl-),a
	ld	a,(hl)
	dec	hl
	dec	hl
	ld	(hl),a
	lda	hl,3(sp)
	ld	a,(hl)
	dec	hl
	dec	hl
	ld	(hl),a
	lda	hl,8(sp)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	lda	hl,0(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,e
	sub	a,c
	ld	e,a
	ld	a,d
	sbc	a,b
	ld	b,a
	ld	c,e
	ld	a,c
	lda	hl,14(sp)
	sub	a,(hl)
	ld	a,b
	inc	hl
	sbc	a,(hl)
	jp	C,00108$
;../_realloc.c:97: pthis->len = size;
	lda	hl,8(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x0004
	add	hl,de
	ld	c,l
	ld	b,h
	ld	e,c
	ld	d,b
	lda	hl,14(sp)
	ld	a,(hl)
	ld	(de),a
	inc	de
	inc	hl
	ld	a,(hl)
	ld	(de),a
;../_realloc.c:98: ret = p;
	lda	hl,12(sp)
	ld	a,(hl+)
	ld	e,(hl)
	lda	hl,4(sp)
	ld	(hl+),a
	ld	(hl),e
	jp	00115$
00108$:
;../_realloc.c:102: if ((_sdcc_prev_memheader) &&
	ld	hl,#__sdcc_prev_memheader
	ld	a,(hl)
	ld	hl,#__sdcc_prev_memheader + 1
	or	a,(hl)
	jp	Z,00104$
;../_realloc.c:103: ((((unsigned int)pthis->next) -
	lda	hl,2(sp)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	lda	hl,0(sp)
	ld	(hl),c
	inc	hl
	ld	(hl),b
;../_realloc.c:104: ((unsigned int)_sdcc_prev_memheader) -
	ld	hl,#__sdcc_prev_memheader
	ld	c,(hl)
	ld	hl,#__sdcc_prev_memheader + 1
	ld	b,(hl)
	lda	hl,0(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,e
	sub	a,c
	ld	e,a
	ld	a,d
	sbc	a,b
	ld	(hl-),a
	ld	(hl),e
;../_realloc.c:105: _sdcc_prev_memheader->len) >= size))
	ld	hl,#__sdcc_prev_memheader
	ld	hl,#__sdcc_prev_memheader
	ld	c,(hl)
	ld	hl,#__sdcc_prev_memheader + 1
	ld	b,(hl)
	inc	bc
	inc	bc
	inc	bc
	inc	bc
	ld	e,c
	ld	d,b
	ld	a,(de)
	ld	c,a
	inc	de
	ld	a,(de)
	ld	b,a
	lda	hl,0(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,e
	sub	a,c
	ld	e,a
	ld	a,d
	sbc	a,b
	ld	b,a
	ld	c,e
	ld	a,c
	lda	hl,14(sp)
	sub	a,(hl)
	ld	a,b
	inc	hl
	sbc	a,(hl)
	jp	C,00104$
;../_realloc.c:107: pnew = (MEMHEADER __xdata * )((char __xdata *)_sdcc_prev_memheader + _sdcc_prev_memheader->len);
	ld	hl,#__sdcc_prev_memheader
	ld	hl,#__sdcc_prev_memheader
	ld	c,(hl)
	ld	hl,#__sdcc_prev_memheader + 1
	ld	b,(hl)
	inc	bc
	inc	bc
	inc	bc
	inc	bc
	ld	e,c
	ld	d,b
	ld	a,(de)
	ld	c,a
	inc	de
	ld	a,(de)
	ld	b,a
	ld	hl,#__sdcc_prev_memheader
	ld	a,(hl)
	add	a,c
	ld	hl,#__sdcc_prev_memheader + 1
	ld	c,a
	ld	hl,#__sdcc_prev_memheader + 1
	ld	a,(hl)
	adc	a,b
	ld	b,a
	lda	hl,6(sp)
	ld	(hl),c
	inc	hl
	ld	(hl),b
;../_realloc.c:108: _sdcc_prev_memheader->next = pnew;
	ld	hl,#__sdcc_prev_memheader
	ld	hl,#__sdcc_prev_memheader
	ld	c,(hl)
	ld	hl,#__sdcc_prev_memheader + 1
	ld	b,(hl)
	ld	e,c
	ld	d,b
	lda	hl,6(sp)
	ld	a,(hl)
	ld	(de),a
	inc	de
	inc	hl
	ld	a,(hl)
	ld	(de),a
;../_realloc.c:111: pthis->next->prev = pnew;
	lda	hl,2(sp)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	inc	bc
	inc	bc
	ld	e,c
	ld	d,b
	lda	hl,6(sp)
	ld	a,(hl)
	ld	(de),a
	inc	de
	inc	hl
	ld	a,(hl)
	ld	(de),a
;../_realloc.c:114: memmove(pnew, pthis, pthis->len);
	inc	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x0004
	add	hl,de
	ld	c,l
	ld	b,h
	ld	e,c
	ld	d,b
	ld	a,(de)
	ld	c,a
	inc	de
	ld	a,(de)
	ld	b,a
	push	bc
	lda	hl,10(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	lda	hl,10(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	_memmove
	lda	sp,6(sp)
;../_realloc.c:115: pnew->len = size;
	lda	hl,6(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x0004
	add	hl,de
	ld	c,l
	ld	b,h
	ld	e,c
	ld	d,b
	lda	hl,14(sp)
	ld	a,(hl)
	ld	(de),a
	inc	de
	inc	hl
	ld	a,(hl)
	ld	(de),a
;../_realloc.c:116: ret = MEM(pnew);
	lda	hl,6(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x0006
	add	hl,de
	ld	a,l
	ld	d,h
	lda	hl,4(sp)
	ld	(hl+),a
	ld	(hl),d
	jp	00115$
00104$:
;../_realloc.c:120: ret = malloc(size - HEADER_SIZE);
	lda	hl,14(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x0006
	ld	a,e
	sub	a,l
	ld	e,a
	ld	a,d
	sbc	a,h
	ld	b,a
	ld	c,e
	push	bc
	call	_malloc
	lda	sp,2(sp)
	ld	b,d
	ld	c,e
	lda	hl,4(sp)
	ld	(hl),c
	inc	hl
	ld	(hl),b
;../_realloc.c:121: if (ret)
	dec	hl
	ld	a,(hl+)
	or	a,(hl)
	jp	Z,00115$
;../_realloc.c:123: memcpy(ret, MEM(pthis), pthis->len - HEADER_SIZE);
	lda	hl,8(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x0004
	add	hl,de
	ld	c,l
	ld	b,h
	ld	e,c
	ld	d,b
	ld	a,(de)
	ld	c,a
	inc	de
	ld	a,(de)
	ld	b,a
	ld	de,#0x0006
	ld	a,c
	sub	a,e
	ld	e,a
	ld	a,b
	sbc	a,d
	lda	hl,1(sp)
	ld	(hl-),a
	ld	(hl),e
	lda	hl,8(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x0006
	add	hl,de
	ld	c,l
	ld	b,h
	lda	hl,0(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	push	bc
	lda	hl,8(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	_memcpy
	lda	sp,6(sp)
;../_realloc.c:124: free(p);
	lda	hl,12(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	_free
	lda	sp,2(sp)
	jp	00115$
00114$:
;../_realloc.c:132: ret = malloc(size);
	lda	hl,14(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	_malloc
	lda	sp,2(sp)
	ld	b,d
	ld	c,e
	lda	hl,4(sp)
	ld	(hl),c
	inc	hl
	ld	(hl),b
00115$:
	ei
;../_realloc.c:135: return ret;
	lda	hl,4(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
00116$:
	lda	sp,10(sp)
ret
	.area _CODE
	.area _CABS
