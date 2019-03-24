;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.0 #5416 (Apr  7 2010) (MINGW32)
; This file was generated Fri Jun 11 23:46:43 2010
;--------------------------------------------------------
	.module _fs2uint
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl ___fs2uint
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
;../_fs2uint.c:44: unsigned int __fs2uint (float f)
;	---------------------------------
; Function __fs2uint
; ---------------------------------
___fs2uint:
	
	push	af
	push	af
;../_fs2uint.c:46: unsigned long ul=__fs2ulong(f);
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
	call	___fs2ulong
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
;../_fs2uint.c:47: if (ul>=UINT_MAX) return UINT_MAX;
	lda	hl,0(sp)
	ld	a,(hl)
	sub	a,#0xFF
	inc	hl
	ld	a,(hl)
	sbc	a,#0xFF
	inc	hl
	ld	a,(hl)
	sbc	a,#0x00
	inc	hl
	ld	a,(hl)
	sbc	a,#0x00
	jp	C,00102$
	ld	de,#0xFFFF
	jp	00103$
00102$:
;../_fs2uint.c:48: return ul;
	lda	hl,0(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
00103$:
	lda	sp,4(sp)
ret
	.area _CODE
	.area _CABS
