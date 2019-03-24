;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.0 #5416 (Apr  7 2010) (MINGW32)
; This file was generated Fri Jun 11 23:46:43 2010
;--------------------------------------------------------
	.module _fs2slong
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl ___fs2slong
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
;../_fs2slong.c:98: signed long __fs2slong (float f)
;	---------------------------------
; Function __fs2slong
; ---------------------------------
___fs2slong:
	
	push	af
	push	af
;../_fs2slong.c:101: if (!f)
	lda	hl,6(sp)
	ld	a,(hl+)
	or	a,(hl)
	inc	hl
	or	a,(hl)
	inc	hl
	or	a,(hl)
	jp	NZ,00102$
;../_fs2slong.c:102: return 0;
	ld	de,#0x0000
	ld	hl,#0x0000
	jp	00106$
00102$:
;../_fs2slong.c:104: if (f<0) {
	ld	hl,#0x0000
	push	hl
	ld	hl,#0x0000
	push	hl
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
	call	___fslt
	lda	sp,8(sp)
	ld	c,e
	xor	a,a
	or	a,c
	jp	Z,00104$
;../_fs2slong.c:105: return -__fs2ulong(-f);
	lda	hl,9(sp)
	ld	a,(hl)
	xor	a,#0x80
	lda	hl,3(sp)
	ld	(hl),a
	lda	hl,6(sp)
	ld	a,(hl)
	lda	hl,0(sp)
	ld	(hl),a
	lda	hl,7(sp)
	ld	a,(hl)
	lda	hl,1(sp)
	ld	(hl),a
	lda	hl,8(sp)
	ld	a,(hl)
	lda	hl,2(sp)
	ld	(hl),a
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	lda	hl,2(sp)
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
	ld	de,#0x0000
	ld	a,e
	lda	hl,0(sp)
	sub	a,(hl)
	ld	e,a
	ld	a,d
	inc	hl
	sbc	a,(hl)
	push	af
	ld	(hl-),a
	ld	(hl),e
	ld	de,#0x0000
	inc	hl
	inc	hl
	pop	af
	ld	a,e
	sbc	a,(hl)
	ld	e,a
	ld	a,d
	inc	hl
	sbc	a,(hl)
	ld	(hl-),a
	ld	(hl),e
	dec	hl
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	inc	hl
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	jp	00106$
00104$:
;../_fs2slong.c:107: return __fs2ulong(f);
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
	lda	hl,0(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	inc	hl
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
00106$:
	lda	sp,4(sp)
ret
	.area _CODE
	.area _CABS
