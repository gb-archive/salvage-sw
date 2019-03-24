;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.0 #5416 (Apr  7 2010) (MINGW32)
; This file was generated Sun Apr 11 14:38:11 2010
;--------------------------------------------------------
	.module frexpf
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _frexpf
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
;../frexpf.c:24: float frexpf(const float x, int *pw2)
;	---------------------------------
; Function frexpf
; ---------------------------------
_frexpf:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-6
	add	hl,sp
	ld	sp,hl
;../frexpf.c:29: fl.f=x;
	ld	hl,#0x0002
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
;../frexpf.c:31: i  = ( fl.l >> 23) & 0x000000ff;
	ld	hl,#0x0002
	add	hl,sp
	ld	-6 (ix),l
	ld	-5 (ix),h
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
	ld	c,l
	ld	b,#0x00
	ld	de,#0x0000
;../frexpf.c:32: i -= 0x7e;
	ld	a,c
	add	a,#0x82
	ld	c,a
	ld	a,b
	adc	a,#0xFF
	ld	b,a
	ld	a,e
	adc	a,#0xFF
	ld	a,d
	adc	a,#0xFF
;../frexpf.c:33: *pw2 = i;
	push	hl
	ld	l,8 (ix)
	ld	h,9 (ix)
	push	hl
	pop	iy
	pop	hl
	ld	0 (iy),c
	ld	1 (iy),b
;../frexpf.c:34: fl.l &= 0x807fffff; /* strip all exponent bits */
	ld	l,-6 (ix)
	ld	h,-5 (ix)
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
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	(hl),c
	inc	hl
	ld	(hl),b
	inc	hl
	ld	(hl),e
	inc	hl
	ld	(hl),d
;../frexpf.c:35: fl.l |= 0x3f000000; /* mantissa between 0.5 and 1 */
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	inc	hl
	ld	e,(hl)
	inc	hl
	ld	a,(hl)
	or	a,#0x3F
	ld	d,a
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	(hl),c
	inc	hl
	ld	(hl),b
	inc	hl
	ld	(hl),e
	inc	hl
	ld	(hl),d
;../frexpf.c:36: return(fl.f);
	ld	hl,#0x0002
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
