;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.0 #5416 (Apr  7 2010) (MINGW32)
; This file was generated Sun Apr 11 14:38:25 2010
;--------------------------------------------------------
	.module _memcmp
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _memcmp
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
;../_memcmp.c:26: int memcmp (
;	---------------------------------
; Function memcmp
; ---------------------------------
_memcmp:
	push	ix
	ld	ix,#0
	add	ix,sp
;../_memcmp.c:32: if (!count)
	ld	a,8 (ix)
	or	a,9 (ix)
	jr	NZ,00112$
;../_memcmp.c:33: return(0);
	ld	hl,#0x0000
	jp	00107$
;../_memcmp.c:35: while ( --count && *((char *)buf1) == *((char *)buf2) ) {
00112$:
	ld	c,8 (ix)
	ld	b,9 (ix)
00104$:
	dec	bc
	ld	a,c
	or	a,b
	jr	Z,00106$
	ld	l,4 (ix)
	ld	h,5 (ix)
	ld	d,(hl)
	ld	l,6 (ix)
	ld	h,7 (ix)
	ld	e,(hl)
	ld	a,d
	sub	e
	jr	NZ,00106$
;../_memcmp.c:36: buf1 = (char *)buf1 + 1;
	ld	e,4 (ix)
	ld	d,5 (ix)
	ld	hl,#0x0001
	add	hl,de
	ld	4 (ix),l
	ld	5 (ix),h
;../_memcmp.c:37: buf2 = (char *)buf2 + 1;
	ld	e,6 (ix)
	ld	d,7 (ix)
	ld	hl,#0x0001
	add	hl,de
	ld	6 (ix),l
	ld	7 (ix),h
	jr	00104$
00106$:
;../_memcmp.c:40: return( *((unsigned char *)buf1) - *((unsigned char *)buf2) );
	ld	c,4 (ix)
	ld	b,5 (ix)
	push	bc
	pop	iy
	ld	c,(iy)
	ld	b,#0x00
	ld	e,6 (ix)
	ld	d,7 (ix)
	push	de
	pop	iy
	ld	e,(iy)
	ld	d,#0x00
	ld	a,c
	sub	a,e
	ld	l,a
	ld	a,b
	sbc	a,d
	ld	h,a
00107$:
	pop	ix
ret
	.area _CODE
	.area _CABS
