;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.0 #5416 (Apr  7 2010) (MINGW32)
; This file was generated Fri Jun 11 23:55:12 2010
;--------------------------------------------------------
	.module _memcpy
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _memcpy
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
;../_memcpy.c:31: void * memcpy (
;	---------------------------------
; Function memcpy
; ---------------------------------
_memcpy:
	
	push	af
	push	af
;../_memcpy.c:41: char * d = dst;
	lda	hl,6(sp)
	ld	a,(hl+)
	ld	e,(hl)
	lda	hl,2(sp)
	ld	(hl+),a
	ld	(hl),e
;../_memcpy.c:42: char * s = src;
	lda	hl,8(sp)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	lda	hl,0(sp)
	ld	(hl),c
	inc	hl
	ld	(hl),b
;../_memcpy.c:44: int count = -(acount >> 2);
	lda	hl,10(sp)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	srl	b
	rr	c
	srl	b
	rr	c
	xor	a,a
	sbc	a,c
	ld	c,a
	ld	a,#0x00
	sbc	a,b
	ld	b,a
;../_memcpy.c:46: while (count) {
00101$:
	ld	a,c
	or	a,b
	jp	Z,00103$
;../_memcpy.c:47: *d++ = *s++;
	lda	hl,0(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	dec	hl
	inc	(hl)
	jr	NZ,00115$
	inc	hl
	inc	(hl)
00115$:
	lda	hl,2(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	(de),a
	dec	hl
	inc	(hl)
	jr	NZ,00116$
	inc	hl
	inc	(hl)
00116$:
;../_memcpy.c:48: *d++ = *s++;
	lda	hl,0(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	dec	hl
	inc	(hl)
	jr	NZ,00117$
	inc	hl
	inc	(hl)
00117$:
	lda	hl,2(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	(de),a
	dec	hl
	inc	(hl)
	jr	NZ,00118$
	inc	hl
	inc	(hl)
00118$:
;../_memcpy.c:49: *d++ = *s++;
	lda	hl,0(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	dec	hl
	inc	(hl)
	jr	NZ,00119$
	inc	hl
	inc	(hl)
00119$:
	lda	hl,2(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	(de),a
	dec	hl
	inc	(hl)
	jr	NZ,00120$
	inc	hl
	inc	(hl)
00120$:
;../_memcpy.c:50: *d++ = *s++;
	lda	hl,0(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	dec	hl
	inc	(hl)
	jr	NZ,00121$
	inc	hl
	inc	(hl)
00121$:
	lda	hl,2(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	(de),a
	dec	hl
	inc	(hl)
	jr	NZ,00122$
	inc	hl
	inc	(hl)
00122$:
;../_memcpy.c:51: count++;
	inc	bc
	jp	00101$
00103$:
;../_memcpy.c:54: if (acount & 2) {
	lda	hl,10(sp)
	ld	a,(hl)
	and	a,#0x02
	jr	NZ,00123$
	jp	00105$
00123$:
;../_memcpy.c:55: *d++ = *s++; 
	lda	hl,0(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	dec	hl
	inc	(hl)
	jr	NZ,00124$
	inc	hl
	inc	(hl)
00124$:
	lda	hl,2(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	(de),a
	dec	hl
	inc	(hl)
	jr	NZ,00125$
	inc	hl
	inc	(hl)
00125$:
;../_memcpy.c:56: *d++ = *s++;
	lda	hl,0(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	dec	hl
	inc	(hl)
	jr	NZ,00126$
	inc	hl
	inc	(hl)
00126$:
	lda	hl,2(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	(de),a
	dec	hl
	inc	(hl)
	jr	NZ,00127$
	inc	hl
	inc	(hl)
00127$:
00105$:
;../_memcpy.c:58: if (acount & 1) {
	lda	hl,10(sp)
	ld	a,(hl)
	and	a,#0x01
	jr	NZ,00128$
	jp	00107$
00128$:
;../_memcpy.c:59: *d++ = *s++;
	lda	hl,0(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	inc	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	(de),a
00107$:
;../_memcpy.c:61: return dst;
	lda	hl,6(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
00108$:
	lda	sp,4(sp)
ret
	.area _CODE
	.area _CABS
