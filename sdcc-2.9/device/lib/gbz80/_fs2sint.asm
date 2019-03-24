;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.0 #5416 (Apr  7 2010) (MINGW32)
; This file was generated Fri Jun 11 23:46:42 2010
;--------------------------------------------------------
	.module _fs2sint
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl ___fs2sint
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
;../_fs2sint.c:71: signed int __fs2sint (float f)
;	---------------------------------
; Function __fs2sint
; ---------------------------------
___fs2sint:
	
	push	af
	push	af
;../_fs2sint.c:73: signed long sl=__fs2slong(f);
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
	call	___fs2slong
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
;../_fs2sint.c:74: if (sl>=INT_MAX)
	lda	hl,0(sp)
	ld	a,(hl)
	sub	a,#0xFF
	inc	hl
	ld	a,(hl)
	sbc	a,#0x7F
	inc	hl
	ld	a,(hl)
	sbc	a,#0x00
	inc	hl
	ld	a,(hl)
	sbc	a,#0x00
	rlca
	jp	C,00102$
;../_fs2sint.c:75: return INT_MAX;
	ld	de,#0x7FFF
	jp	00105$
00102$:
;../_fs2sint.c:76: if (sl<=INT_MIN)
	ld	a,#0x00
	lda	hl,0(sp)
	sub	a,(hl)
	ld	a,#0x80
	inc	hl
	sbc	a,(hl)
	ld	a,#0xFF
	inc	hl
	sbc	a,(hl)
	ld	a,#0xFF
	inc	hl
	sbc	a,(hl)
	rlca
	jp	C,00104$
;../_fs2sint.c:77: return -INT_MIN;
	ld	de,#0xFFFF8000
	jp	00105$
00104$:
;../_fs2sint.c:78: return sl;
	lda	hl,0(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
00105$:
	lda	sp,4(sp)
ret
	.area _CODE
	.area _CABS
