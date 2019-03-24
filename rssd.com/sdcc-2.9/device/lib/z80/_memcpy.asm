;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.0 #5416 (Apr  7 2010) (MINGW32)
; This file was generated Sun Apr 11 14:38:26 2010
;--------------------------------------------------------
	.module _memcpy
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _memcpy
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
;../_memcpy.c:31: void * memcpy (
;	---------------------------------
; Function memcpy
; ---------------------------------
_memcpy:
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
;../_memcpy.c:41: char * d = dst;
	ld	e,4 (ix)
	ld	d,5 (ix)
;../_memcpy.c:42: char * s = src;
	ld	c,6 (ix)
	ld	b,7 (ix)
	ld	-2 (ix),c
	ld	-1 (ix),b
;../_memcpy.c:44: int count = -(acount >> 2);
	ld	c,8 (ix)
	ld	b,9 (ix)
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
	jr	Z,00103$
;../_memcpy.c:47: *d++ = *s++;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	a,(hl)
	inc	-2 (ix)
	jr	NZ,00115$
	inc	-1 (ix)
00115$:
	ld	(de),a
	inc	de
;../_memcpy.c:48: *d++ = *s++;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	a,(hl)
	inc	-2 (ix)
	jr	NZ,00116$
	inc	-1 (ix)
00116$:
	ld	(de),a
	inc	de
;../_memcpy.c:49: *d++ = *s++;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	a,(hl)
	inc	-2 (ix)
	jr	NZ,00117$
	inc	-1 (ix)
00117$:
	ld	(de),a
	inc	de
;../_memcpy.c:50: *d++ = *s++;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	a,(hl)
	inc	-2 (ix)
	jr	NZ,00118$
	inc	-1 (ix)
00118$:
	ld	(de),a
	inc	de
;../_memcpy.c:51: count++;
	inc	bc
	jr	00101$
00103$:
;../_memcpy.c:54: if (acount & 2) {
	ld	a,8 (ix)
	and	a,#0x02
	jr	Z,00105$
;../_memcpy.c:55: *d++ = *s++; 
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	a,(hl)
	inc	-2 (ix)
	jr	NZ,00120$
	inc	-1 (ix)
00120$:
	ld	(de),a
	inc	de
;../_memcpy.c:56: *d++ = *s++;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	a,(hl)
	inc	-2 (ix)
	jr	NZ,00121$
	inc	-1 (ix)
00121$:
	ld	(de),a
	inc	de
00105$:
;../_memcpy.c:58: if (acount & 1) {
	ld	a,8 (ix)
	and	a,#0x01
	jr	Z,00107$
;../_memcpy.c:59: *d++ = *s++;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	a,(hl)
	ld	(de),a
00107$:
;../_memcpy.c:61: return dst;
	ld	l,4 (ix)
	ld	h,5 (ix)
	ld	sp,ix
	pop	ix
ret
	.area _CODE
	.area _CABS
