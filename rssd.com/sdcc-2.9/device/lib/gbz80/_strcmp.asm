;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.0 #5416 (Apr  7 2010) (MINGW32)
; This file was generated Fri Jun 11 23:47:31 2010
;--------------------------------------------------------
	.module _strcmp
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _strcmp
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
;../_strcmp.c:29: int strcmp (
;	---------------------------------
; Function strcmp
; ---------------------------------
_strcmp:
	lda	sp,-7(sp)
;../_strcmp.c:38: char * src = asrc;
	lda	hl,9(sp)
	ld	a,(hl+)
	ld	e,(hl)
	lda	hl,5(sp)
	ld	(hl+),a
	ld	(hl),e
;../_strcmp.c:39: char * dst = adst;
	lda	hl,11(sp)
	ld	a,(hl+)
	ld	e,(hl)
	lda	hl,3(sp)
	ld	(hl+),a
	ld	(hl),e
;../_strcmp.c:41: while( ! (*src - *dst) && *dst)
00102$:
	lda	hl,5(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	c,a
	lda	hl,0(sp)
	ld	(hl),c
	ld	a,c
	rla	
	sbc	a,a
	inc	hl
	ld	(hl+),a
	inc	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	dec	hl
	dec	hl
	ld	(hl),a
	ld	c,a
	ld	a,(hl)
	rla	
	sbc	a,a
	ld	b,a
	dec	hl
	dec	hl
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
	or	a,b
	jp	NZ,00104$
	xor	a,a
	inc	hl
	or	a,(hl)
	jp	Z,00104$
;../_strcmp.c:42: ++src, ++dst;
	lda	hl,5(sp)
	inc	(hl)
	jr	NZ,00110$
	inc	hl
	inc	(hl)
00110$:
	lda	hl,3(sp)
	inc	(hl)
	jr	NZ,00111$
	inc	hl
	inc	(hl)
00111$:
	jp	00102$
00104$:
;../_strcmp.c:44: return *src - *dst;
	lda	hl,5(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	c,a
	lda	hl,0(sp)
	ld	(hl),c
	ld	a,c
	rla	
	sbc	a,a
	inc	hl
	ld	(hl+),a
	inc	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	c,a
	rla	
	sbc	a,a
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
	ld	d,a
00105$:
	lda	sp,7(sp)
ret
	.area _CODE
	.area _CABS
