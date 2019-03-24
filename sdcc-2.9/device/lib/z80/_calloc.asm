;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.0 #5416 (Apr  7 2010) (MINGW32)
; This file was generated Sun Apr 11 14:38:26 2010
;--------------------------------------------------------
	.module _calloc
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _calloc
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
;../_calloc.c:62: void __xdata * calloc (size_t nmemb, size_t size)
;	---------------------------------
; Function calloc
; ---------------------------------
_calloc:
	push	ix
	ld	ix,#0
	add	ix,sp
;../_calloc.c:66: ptr = malloc(nmemb * size);
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	call	__mulint_rrx_s
	pop	af
	pop	af
	ld	b,h
	ld	c,l
	push	bc
	push	bc
	call	_malloc
	pop	af
	ex	de,hl
	pop	bc
;../_calloc.c:67: if (ptr)
	ld	a,e
	or	a,d
	jr	Z,00102$
;../_calloc.c:69: memset(ptr, 0, nmemb * size);
	push	de
	push	bc
	ld	a,#0x00
	push	af
	inc	sp
	push	de
	call	_memset
	pop	af
	pop	af
	inc	sp
	pop	de
00102$:
;../_calloc.c:71: return ptr;
	ld	l,e
	ld	h,d
	pop	ix
ret
	.area _CODE
	.area _CABS
