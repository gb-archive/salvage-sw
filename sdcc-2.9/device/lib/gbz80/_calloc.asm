;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.0 #5416 (Apr  7 2010) (MINGW32)
; This file was generated Fri Jun 11 23:46:58 2010
;--------------------------------------------------------
	.module _calloc
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _calloc
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
	
	push	af
;../_calloc.c:66: ptr = malloc(nmemb * size);
	lda	hl,6(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	lda	hl,6(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	__mulint_rrx_s
	lda	sp,4(sp)
	lda	hl,1(sp)
	ld	(hl),d
	dec	hl
	ld	(hl),e
	lda	hl,0(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	_malloc
	lda	sp,2(sp)
	ld	b,d
	ld	c,e
;../_calloc.c:67: if (ptr)
	ld	a,c
	or	a,b
	jp	Z,00102$
;../_calloc.c:69: memset(ptr, 0, nmemb * size);
	push	bc
	lda	hl,2(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	ld	a,#0x00
	push	af
	inc	sp
	push	bc
	call	_memset
	lda	sp,5(sp)
	pop	bc
00102$:
;../_calloc.c:71: return ptr;
	ld	e,c
	ld	d,b
00103$:
	lda	sp,2(sp)
ret
	.area _CODE
	.area _CABS
