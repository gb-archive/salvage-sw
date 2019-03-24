;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.0 #5416 (Apr  7 2010) (MINGW32)
; This file was generated Fri Jun 11 23:46:44 2010
;--------------------------------------------------------
	.module frexpf
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _frexpf
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
;../frexpf.c:24: float frexpf(const float x, int *pw2)
;	---------------------------------
; Function frexpf
; ---------------------------------
_frexpf:
	lda	sp,-14(sp)
;../frexpf.c:29: fl.f=x;
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
;../frexpf.c:31: i  = ( fl.l >> 23) & 0x000000ff;
	lda	hl,10(sp)
	ld	a,l
	ld	d,h
	lda	hl,4(sp)
	ld	(hl+),a
	ld	(hl),d
	ld	e,a
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
	call	__rrslong_rrx_s
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
	lda	hl,0(sp)
	ld	a,(hl)
	lda	hl,6(sp)
	ld	(hl+),a
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
;../frexpf.c:32: i -= 0x7e;
	lda	hl,6(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,e
	sub	a,#0x7E
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
;../frexpf.c:33: *pw2 = i;
	lda	hl,20(sp)
	ld	a,(hl+)
	ld	e,(hl)
	lda	hl,0(sp)
	ld	(hl+),a
	ld	(hl),e
	lda	hl,6(sp)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	lda	hl,0(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,c
	ld	(de),a
	inc	de
	ld	a,b
	ld	(de),a
;../frexpf.c:34: fl.l &= 0x807fffff; /* strip all exponent bits */
	lda	hl,4(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
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
	ld	a,(hl)
	and	a,#0x80
	ld	(hl+),a
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	lda	hl,0(sp)
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
;../frexpf.c:35: fl.l |= 0x3f000000; /* mantissa between 0.5 and 1 */
	inc	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
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
	ld	a,a
	or	a,#0x3F
	ld	(hl+),a
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	lda	hl,0(sp)
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
;../frexpf.c:36: return(fl.f);
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
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	inc	hl
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
00101$:
	lda	sp,14(sp)
ret
	.area _CODE
	.area _CABS
