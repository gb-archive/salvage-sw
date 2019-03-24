;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.0 #5416 (Apr  7 2010) (MINGW32)
; This file was generated Fri Jun 11 23:46:44 2010
;--------------------------------------------------------
	.module _fs2ulong
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl ___fs2ulong
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
;../_fs2ulong.c:93: __fs2ulong (float a1)
;	---------------------------------
; Function __fs2ulong
; ---------------------------------
___fs2ulong:
	lda	sp,-14(sp)
;../_fs2ulong.c:99: fl1.f = a1;
	lda	hl,10(sp)
	ld	c,l
	ld	b,h
	ld	e,c
	ld	d,b
	lda	hl,16(sp)
	ld	a,(hl)
	ld	(de),a
	inc	de
	inc	hl
	ld	a,(hl)
	ld	(de),a
	inc	de
	inc	hl
	ld	a,(hl)
	ld	(de),a
	inc	de
	inc	hl
	ld	a,(hl)
	ld	(de),a
;../_fs2ulong.c:101: if (!fl1.l || SIGN(fl1.l))
	lda	hl,10(sp)
	ld	c,l
	ld	b,h
	ld	e,c
	ld	d,b
	ld	a,(de)
	lda	hl,0(sp)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl),a
	lda	hl,0(sp)
	ld	a,(hl+)
	or	a,(hl)
	inc	hl
	or	a,(hl)
	inc	hl
	or	a,(hl)
	jp	Z,00101$
	lda	hl,10(sp)
	ld	c,l
	ld	b,h
	ld	e,c
	ld	d,b
	ld	a,(de)
	lda	hl,0(sp)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl),a
	rlc	a
	and	a,#0x01
	jp	Z,00102$
00101$:
;../_fs2ulong.c:102: return (0);
	ld	de,#0x0000
	ld	hl,#0x0000
	jp	00104$
00102$:
;../_fs2ulong.c:104: exp = EXP (fl1.l) - EXCESS - 24;
	lda	hl,10(sp)
	ld	c,l
	ld	b,h
	ld	e,c
	ld	d,b
	ld	a,(de)
	lda	hl,0(sp)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl),a
	ld	a,#0x17
	push	af
	inc	sp
	dec	hl
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	lda	hl,3(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	__rrulong_rrx_s
	lda	sp,5(sp)
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
	lda	hl,1(sp)
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
	lda	hl,0(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,e
	sub	a,#0x96
	ld	e,a
	ld	a,d
	sbc	a,#0x00
	push	af
	ld	(hl-),a
	ld	(hl),e
	inc	hl
	inc	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	pop	af
	ld	a,e
	sbc	a,#0x00
	ld	e,a
	ld	a,d
	sbc	a,#0x00
	ld	(hl-),a
	ld	(hl),e
	dec	hl
	dec	hl
	ld	a,(hl)
	lda	hl,8(sp)
	ld	(hl),a
	lda	hl,1(sp)
	ld	a,(hl)
	lda	hl,9(sp)
	ld	(hl),a
;../_fs2ulong.c:105: l = MANT (fl1.l);
	lda	hl,10(sp)
	ld	c,l
	ld	b,h
	ld	e,c
	ld	d,b
	ld	a,(de)
	lda	hl,0(sp)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl-),a
	ld	a,(hl)
	and	a,#0x7F
	ld	(hl+),a
	ld	(hl),#0x00
	lda	hl,0(sp)
	ld	a,(hl)
	lda	hl,4(sp)
	ld	(hl),a
	lda	hl,1(sp)
	ld	a,(hl)
	lda	hl,5(sp)
	ld	(hl),a
	lda	hl,2(sp)
	ld	a,(hl)
	or	a,#0x80
	lda	hl,6(sp)
	ld	(hl),a
	lda	hl,3(sp)
	ld	a,(hl)
	lda	hl,7(sp)
	ld	(hl),a
;../_fs2ulong.c:107: l >>= -exp;
	xor	a,a
	inc	hl
	ld	a,#0x00
	sbc	a,(hl)
	ld	c,a
	inc	hl
	ld	a,#0x00
	sbc	a,(hl)
	ld	b,a
	push	bc
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
	call	__rrslong_rrx_s
	lda	sp,6(sp)
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
	ld	d,h
	ld	e,l
	lda	hl,4(sp)
	ld	a,(de)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl),a
;../_fs2ulong.c:109: return l;
	lda	hl,4(sp)
	ld	d,h
	ld	e,l
	lda	hl,0(sp)
	ld	a,(de)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl),a
	lda	hl,0(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	inc	hl
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
00104$:
	lda	sp,14(sp)
ret
	.area _CODE
	.area _CABS
