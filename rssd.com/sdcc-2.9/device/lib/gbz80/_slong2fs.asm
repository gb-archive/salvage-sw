;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.0 #5416 (Apr  7 2010) (MINGW32)
; This file was generated Fri Jun 11 23:46:41 2010
;--------------------------------------------------------
	.module _slong2fs
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl ___slong2fs
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
;../_slong2fs.c:69: float __slong2fs (signed long sl) {
;	---------------------------------
; Function __slong2fs
; ---------------------------------
___slong2fs:
	
	push	af
	push	af
;../_slong2fs.c:70: if (sl<0) 
	lda	hl,9(sp)
	ld	a,(hl)
	bit	7,a
	jp	Z,00102$
;../_slong2fs.c:71: return -__ulong2fs(-sl);
	ld	de,#0x0000
	ld	a,e
	lda	hl,6(sp)
	sub	a,(hl)
	ld	e,a
	ld	a,d
	inc	hl
	sbc	a,(hl)
	push	af
	lda	hl,3(sp)
	ld	(hl-),a
	ld	(hl),e
	ld	de,#0x0000
	lda	hl,10(sp)
	pop	af
	ld	a,e
	sbc	a,(hl)
	ld	e,a
	ld	a,d
	inc	hl
	sbc	a,(hl)
	lda	hl,3(sp)
	ld	(hl-),a
	ld	(hl),e
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
	lda	hl,3(sp)
	ld	a,(hl)
	xor	a,#0x80
	ld	(hl),a
	lda	hl,0(sp)
	ld	a,(hl)
	ld	(hl+),a
	ld	a,(hl)
	ld	(hl+),a
	ld	a,(hl)
	ld	(hl-),a
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	inc	hl
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	jp	00104$
00102$:
;../_slong2fs.c:73: return __ulong2fs(sl);
	lda	hl,8(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	lda	hl,8(sp)
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
00104$:
	lda	sp,4(sp)
ret
	.area _CODE
	.area _CABS
