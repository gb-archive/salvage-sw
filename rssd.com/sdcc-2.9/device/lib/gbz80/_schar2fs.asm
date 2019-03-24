;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.0 #5416 (Apr  7 2010) (MINGW32)
; This file was generated Fri Jun 11 23:46:40 2010
;--------------------------------------------------------
	.module _schar2fs
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl ___schar2fs
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
;../_schar2fs.c:45: float __schar2fs (signed char sc) {
;	---------------------------------
; Function __schar2fs
; ---------------------------------
___schar2fs:
	
	push	af
	push	af
;../_schar2fs.c:46: return __slong2fs(sc);
	lda	hl,6(sp)
	ld	a,(hl)
	lda	hl,0(sp)
	ld	(hl),a
	lda	hl,6(sp)
	ld	a,(hl)
	rla	
	sbc	a,a
	lda	hl,1(sp)
	ld	(hl+),a
	ld	(hl+),a
	ld	(hl-),a
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	lda	hl,2(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	___slong2fs
	lda	sp,4(sp)
	push	hl
	lda	hl,2(sp)
	ld	(hl),e
	inc	hl
	ld	(hl),d
	pop	de
	inc	hl
	ld	(hl),e
	inc	hl
	ld	(hl),d
	lda	hl,0(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	inc	hl
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
00101$:
	lda	sp,4(sp)
ret
	.area _CODE
	.area _CABS
