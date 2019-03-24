;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.0 #5416 (Apr  7 2010) (MINGW32)
; This file was generated Fri Jun 11 23:46:41 2010
;--------------------------------------------------------
	.module _uint2fs
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl ___uint2fs
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
;../_uint2fs.c:44: float __uint2fs (unsigned int ui) {
;	---------------------------------
; Function __uint2fs
; ---------------------------------
___uint2fs:
	
	push	af
	push	af
;../_uint2fs.c:45: return __ulong2fs(ui);
	lda	hl,6(sp)
	ld	a,(hl)
	lda	hl,0(sp)
	ld	(hl),a
	lda	hl,7(sp)
	ld	a,(hl)
	lda	hl,1(sp)
	ld	(hl+),a
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
	dec	hl
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	lda	hl,2(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	___ulong2fs
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
