;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.0 #5416 (Apr  7 2010) (MINGW32)
; This file was generated Fri Jun 11 23:46:50 2010
;--------------------------------------------------------
	.module floorf
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _floorf
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
;../floorf.c:23: float floorf (float x) _FLOAT_FUNC_REENTRANT
;	---------------------------------
; Function floorf
; ---------------------------------
_floorf:
	lda	sp,-8(sp)
;../floorf.c:26: r=x;
	lda	hl,12(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	lda	hl,12(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	___fs2slong
	lda	sp,4(sp)
	push	hl
	lda	hl,6(sp)
	ld	(hl),e
	inc	hl
	ld	(hl),d
	pop	de
	inc	hl
	ld	(hl),e
	inc	hl
	ld	(hl),d
;../floorf.c:27: if (r<=0)
	ld	a,#0x00
	lda	hl,4(sp)
	sub	a,(hl)
	ld	a,#0x00
	inc	hl
	sbc	a,(hl)
	ld	a,#0x00
	inc	hl
	sbc	a,(hl)
	ld	a,#0x00
	inc	hl
	sbc	a,(hl)
	rlca
	jp	C,00102$
;../floorf.c:28: return (r+((r>x)?-1:0));
	dec	hl
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	lda	hl,6(sp)
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
	lda	hl,12(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	lda	hl,12(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
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
	call	___fsgt
	lda	sp,8(sp)
	ld	c,e
	xor	a,a
	or	a,c
	jp	Z,00106$
	ld	c,#0xFF
	jp	00107$
00106$:
	ld	c,#0x00
00107$:
	lda	hl,0(sp)
	ld	(hl),c
	ld	a,c
	rla	
	sbc	a,a
	inc	hl
	ld	(hl+),a
	ld	(hl+),a
	ld	(hl+),a
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,e
	lda	hl,0(sp)
	add	a,(hl)
	ld	e,a
	ld	a,d
	inc	hl
	adc	a,(hl)
	push	af
	ld	(hl-),a
	ld	(hl),e
	lda	hl,8(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	lda	hl,4(sp)
	pop	af
	ld	a,e
	adc	a,(hl)
	ld	e,a
	ld	a,d
	inc	hl
	adc	a,(hl)
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
	jp	00104$
00102$:
;../floorf.c:30: return r;
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
00104$:
	lda	sp,8(sp)
ret
	.area _CODE
	.area _CABS
