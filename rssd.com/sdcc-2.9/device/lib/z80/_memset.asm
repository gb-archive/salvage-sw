;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.0 #5416 (Apr  7 2010) (MINGW32)
; This file was generated Sun Apr 11 14:38:26 2010
;--------------------------------------------------------
	.module _memset
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _memset
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
;../_memset.c:31: void * memset (
;	---------------------------------
; Function memset
; ---------------------------------
_memset:
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
;../_memset.c:36: register unsigned char * ret = buf;
;../_memset.c:38: while (count--) {
	ld	a,4 (ix)
	ld	-2 (ix),a
	ld	a,5 (ix)
	ld	-1 (ix),a
	ld	c,7 (ix)
	ld	b,8 (ix)
00101$:
	ld	e,c
	ld	d,b
	dec	bc
	ld	a,e
	or	a,d
	jr	Z,00103$
;../_memset.c:39: *(unsigned char *) ret = ch;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	a,6 (ix)
	ld	(hl),a
;../_memset.c:40: ret = ((unsigned char *) ret) + 1;
	inc	-2 (ix)
	jr	NZ,00109$
	inc	-1 (ix)
00109$:
	jr	00101$
00103$:
;../_memset.c:43: return buf ;
	ld	l,4 (ix)
	ld	h,5 (ix)
	ld	sp,ix
	pop	ix
ret
	.area _CODE
	.area _CABS
