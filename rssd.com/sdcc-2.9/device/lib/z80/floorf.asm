;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.0 #5416 (Apr  7 2010) (MINGW32)
; This file was generated Sun Apr 11 14:38:17 2010
;--------------------------------------------------------
	.module floorf
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _floorf
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
;../floorf.c:23: float floorf (float x) _FLOAT_FUNC_REENTRANT
;	---------------------------------
; Function floorf
; ---------------------------------
_floorf:
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
;../floorf.c:26: r=x;
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	call	___fs2slong
	pop	af
	pop	af
	ld	b,h
	ld	-4 (ix),l
	ld	-3 (ix),b
	ld	-2 (ix),e
	ld	-1 (ix),d
;../floorf.c:27: if (r<=0)
	ld	a,#0x00
	sub	a,-4 (ix)
	ld	a,#0x00
	sbc	a,-3 (ix)
	ld	a,#0x00
	sbc	a,-2 (ix)
	ld	a,#0x00
	sbc	a,-1 (ix)
	jp	M,00102$
;../floorf.c:28: return (r+((r>x)?-1:0));
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	push	hl
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	push	hl
	call	___slong2fs
	pop	af
	pop	af
	ld	b,h
	ld	c,l
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	push	de
	push	bc
	call	___fsgt
	pop	af
	pop	af
	pop	af
	pop	af
	xor	a,a
	or	a,l
	jr	Z,00106$
	ld	c,#0xFF
	jr	00107$
00106$:
	ld	c,#0x00
00107$:
	ld	a,c
	rla	
	sbc	a,a
	ld	b,a
	ld	e,a
	ld	d,a
	ld	a,-4 (ix)
	add	a,c
	ld	c,a
	ld	a,-3 (ix)
	adc	a,b
	ld	b,a
	ld	a,-2 (ix)
	adc	a,e
	ld	e,a
	ld	a,-1 (ix)
	adc	a,d
	ld	d,a
	push	de
	push	bc
	call	___slong2fs
	pop	af
	pop	af
	ld	b,h
	ld	c,l
	ld	l,c
	ld	h,b
	jr	00104$
00102$:
;../floorf.c:30: return r;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	push	hl
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	push	hl
	call	___slong2fs
	pop	af
	pop	af
	ld	b,h
	ld	c,l
	ld	l,c
	ld	h,b
00104$:
	ld	sp,ix
	pop	ix
ret
	.area _CODE
	.area _CABS
