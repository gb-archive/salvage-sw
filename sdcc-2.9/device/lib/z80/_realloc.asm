;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.0 #5416 (Apr  7 2010) (MINGW32)
; This file was generated Sun Apr 11 14:38:27 2010
;--------------------------------------------------------
	.module _realloc
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _realloc
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
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
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-8
	add	hl,sp
	ld	sp,hl
;../_realloc.c:134: }
	ld	a,i
	di
	push	af
;../_realloc.c:84: pthis = _sdcc_find_memheader(p);
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	call	__sdcc_find_memheader
	pop	af
	ld	b,h
	ld	c,l
	ld	e,c
	ld	d,b
;../_realloc.c:85: if (pthis)
	ld	a,e
	or	a,d
	jp	Z,00114$
;../_realloc.c:87: if (size > (0xFFFF-HEADER_SIZE))
	ld	a,#0xF9
	sub	a,6 (ix)
	ld	a,#0xFF
	sbc	a,7 (ix)
	jr	NC,00111$
;../_realloc.c:89: ret = (void __xdata *) NULL; //To prevent overflow in next line
	ld	-4 (ix),#0x00
	ld	-3 (ix),#0x00
	jp	00115$
00111$:
;../_realloc.c:93: size += HEADER_SIZE; //We need a memory for header too
	ld	a,6 (ix)
	add	a,#0x06
	ld	6 (ix),a
	ld	a,7 (ix)
	adc	a,#0x00
	ld	7 (ix),a
;../_realloc.c:95: if ((((unsigned int)pthis->next) - ((unsigned int)pthis)) >= size)
	ld	l,e
	ld	h,d
	ld	a,(hl)
	ld	-6 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-5 (ix),a
	ld	a,-6 (ix)
	ld	-8 (ix),a
	ld	a,-5 (ix)
	ld	-7 (ix),a
	ld	c,e
	ld	b,d
	ld	a,-8 (ix)
	sub	a,c
	ld	c,a
	ld	a,-7 (ix)
	sbc	a,b
	ld	b,a
	ld	a,c
	sub	a,6 (ix)
	ld	a,b
	sbc	a,7 (ix)
	jr	C,00108$
;../_realloc.c:97: pthis->len = size;
	ld	hl,#0x0004
	add	hl,de
	ld	c,l
	ld	b,h
	ld	a,6 (ix)
	ld	(hl),a
	inc	hl
	ld	a,7 (ix)
	ld	(hl),a
;../_realloc.c:98: ret = p;
	ld	a,4 (ix)
	ld	-4 (ix),a
	ld	a,5 (ix)
	ld	-3 (ix),a
	jp	00115$
00108$:
;../_realloc.c:102: if ((_sdcc_prev_memheader) &&
	ld	a,(#__sdcc_prev_memheader+0)
	ld	iy,#__sdcc_prev_memheader
	or	a,1 (iy)
	jp	Z,00104$
;../_realloc.c:103: ((((unsigned int)pthis->next) -
	ld	c,-6 (ix)
	ld	b,-5 (ix)
	ld	-8 (ix),c
	ld	-7 (ix),b
;../_realloc.c:104: ((unsigned int)_sdcc_prev_memheader) -
	ld	iy,#__sdcc_prev_memheader
	ld	c,0 (iy)
	ld	iy,#__sdcc_prev_memheader
	ld	b,1 (iy)
	ld	a,-8 (ix)
	sub	a,c
	ld	-8 (ix),a
	ld	a,-7 (ix)
	sbc	a,b
	ld	-7 (ix),a
;../_realloc.c:105: _sdcc_prev_memheader->len) >= size))
	ld	bc,(__sdcc_prev_memheader)
	ld	l,c
	ld	h,b
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	a,-8 (ix)
	sub	a,c
	ld	c,a
	ld	a,-7 (ix)
	sbc	a,b
	ld	b,a
	ld	a,c
	sub	a,6 (ix)
	ld	a,b
	sbc	a,7 (ix)
	jp	C,00104$
;../_realloc.c:107: pnew = (MEMHEADER __xdata * )((char __xdata *)_sdcc_prev_memheader + _sdcc_prev_memheader->len);
	ld	bc,(__sdcc_prev_memheader)
	ld	l,c
	ld	h,b
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	a,(#__sdcc_prev_memheader+0)
	add	a,c
	ld	c,a
	ld	a,(#__sdcc_prev_memheader+1)
	adc	a,b
	ld	b,a
	ld	-2 (ix),c
	ld	-1 (ix),b
;../_realloc.c:108: _sdcc_prev_memheader->next = pnew;
	ld	bc,(__sdcc_prev_memheader)
	ld	l,c
	ld	h,b
	ld	a,-2 (ix)
	ld	(hl),a
	inc	hl
	ld	a,-1 (ix)
	ld	(hl),a
;../_realloc.c:111: pthis->next->prev = pnew;
	ld	l, -6 (ix)
	ld	h, -5 (ix)
	inc	hl
	inc	hl
	ld	a,-2 (ix)
	ld	(hl),a
	inc	hl
	ld	a,-1 (ix)
	ld	(hl),a
;../_realloc.c:114: memmove(pnew, pthis, pthis->len);
	ld	hl,#0x0004
	add	hl,de
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	push	bc
	push	de
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	push	hl
	call	_memmove
	pop	af
	pop	af
	pop	af
;../_realloc.c:115: pnew->len = size;
	ld	a,-2 (ix)
	add	a,#0x04
	ld	c,a
	ld	a,-1 (ix)
	adc	a,#0x00
	ld	b,a
	ld	l,c
	ld	h,a
	ld	a,6 (ix)
	ld	(hl),a
	inc	hl
	ld	a,7 (ix)
	ld	(hl),a
;../_realloc.c:116: ret = MEM(pnew);
	ld	a,-2 (ix)
	add	a,#0x06
	ld	-4 (ix),a
	ld	a,-1 (ix)
	adc	a,#0x00
	ld	-3 (ix),a
	jp	00115$
00104$:
;../_realloc.c:120: ret = malloc(size - HEADER_SIZE);
	ld	a,6 (ix)
	add	a,#0xFA
	ld	c,a
	ld	a,7 (ix)
	adc	a,#0xFF
	ld	b,a
	push	de
	push	bc
	call	_malloc
	pop	af
	ld	b,h
	ld	c,l
	pop	de
	ld	-4 (ix),c
	ld	-3 (ix),b
;../_realloc.c:121: if (ret)
	ld	a,-4 (ix)
	or	a,-3 (ix)
	jp	Z,00115$
;../_realloc.c:123: memcpy(ret, MEM(pthis), pthis->len - HEADER_SIZE);
	ld	hl,#0x0006
	add	hl,de
	ld	c,l
	ld	b,h
	inc	de
	ex	de,hl
	inc	hl
	inc	hl
	inc	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,e
	add	a,#0xFA
	ld	l,a
	ld	a,d
	adc	a,#0xFF
	ld	h,a
	ld	a,c
	ld	c,l
	ld	l,a
	ld	a,b
	ld	b,h
	ld	h,a
	ld	e,-4 (ix)
	ld	d,-3 (ix)
	ldir
;../_realloc.c:124: free(p);
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	call	_free
	pop	af
	jr	00115$
00114$:
;../_realloc.c:132: ret = malloc(size);
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_malloc
	pop	af
	ld	b,h
	ld	c,l
	ld	-4 (ix),c
	ld	-3 (ix),b
00115$:
	pop	af
	jp	PO,00125$
	ei
00125$:
;../_realloc.c:135: return ret;
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	sp,ix
	pop	ix
ret
	.area _CODE
	.area _CABS
