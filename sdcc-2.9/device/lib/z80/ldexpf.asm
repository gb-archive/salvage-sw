;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.0 #5416 (Apr  7 2010) (MINGW32)
; This file was generated Sun Apr 11 14:38:12 2010
;--------------------------------------------------------
	.module ldexpf
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _ldexpf
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
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
;../ldexpf.c:24: float ldexpf(const float x, const int pw2)
;	---------------------------------
; Function ldexpf
; ---------------------------------
_ldexpf:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-14
	add	hl,sp
	ld	sp,hl
;../ldexpf.c:29: fl.f = x;
	ld	hl,#0x000A
	add	hl,sp
	ld	a,4 (ix)
	ld	(hl),a
	inc	hl
	ld	a,5 (ix)
	ld	(hl),a
	inc	hl
	ld	a,6 (ix)
	ld	(hl),a
	inc	hl
	ld	a,7 (ix)
	ld	(hl),a
;../ldexpf.c:31: e=(fl.l >> 23) & 0x000000ff;
	ld	hl,#0x000A
	add	hl,sp
	ld	-10 (ix),l
	ld	-9 (ix),h
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	inc	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	a,#0x17
	push	af
	inc	sp
	push	bc
	push	de
	call	__rrslong_rrx_s
	pop	af
	pop	af
	inc	sp
	ld	-8 (ix),l
	ld	-7 (ix),#0x00
	ld	-6 (ix),#0x00
	ld	-5 (ix),#0x00
;../ldexpf.c:32: e+=pw2;
	ld	c,8 (ix)
	ld	b,9 (ix)
	ld	a,9 (ix)
	rla	
	sbc	a,a
	ld	e,a
	ld	d,a
	ld	a,-8 (ix)
	add	a,c
	ld	-8 (ix),a
	ld	a,-7 (ix)
	adc	a,b
	ld	-7 (ix),a
	ld	a,-6 (ix)
	adc	a,e
	ld	-6 (ix),a
	ld	a,-5 (ix)
	adc	a,d
	ld	-5 (ix),a
;../ldexpf.c:33: fl.l= ((e & 0xff) << 23) | (fl.l & 0x807fffff);
	ld	c,-8 (ix)
	ld	b,#0x00
	ld	de,#0x0000
	ld	a,#0x17
	push	af
	inc	sp
	push	de
	push	bc
	call	__rlslong_rrx_s
	pop	af
	pop	af
	inc	sp
	ld	-11 (ix),d
	ld	-12 (ix),e
	ld	-13 (ix),h
	ld	-14 (ix),l
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	inc	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,e
	and	a,#0x7F
	ld	e,a
	ld	a,d
	and	a,#0x80
	ld	d,a
	ld	a,c
	or	a,-14 (ix)
	ld	c,a
	ld	a,b
	or	a,-13 (ix)
	ld	b,a
	ld	a,e
	or	a,-12 (ix)
	ld	e,a
	ld	a,d
	or	a,-11 (ix)
	ld	d,a
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	(hl),c
	inc	hl
	ld	(hl),b
	inc	hl
	ld	(hl),e
	inc	hl
	ld	(hl),d
;../ldexpf.c:35: return(fl.f);
	ld	hl,#0x000A
	add	hl,sp
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	inc	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	l,c
	ld	h,b
	ld	sp,ix
	pop	ix
ret
	.area _CODE
	.area _CABS
