;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.0 #5416 (Apr  7 2010) (MINGW32)
; This file was generated Sun Apr 11 14:38:12 2010
;--------------------------------------------------------
	.module powf
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _powf
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
;../powf.c:25: float powf(const float x, const float y)
;	---------------------------------
; Function powf
; ---------------------------------
_powf:
	push	ix
	ld	ix,#0
	add	ix,sp
;../powf.c:27: if(y == 0.0) return 1.0;
	ld	a,8 (ix)
	or	a,9 (ix)
	or	a,10 (ix)
	or	a,11 (ix)
	jr	NZ,00102$
	ld	hl,#0x0000
	ld	de,#0x3F80
	jp	00107$
00102$:
;../powf.c:28: if(y==1.0) return x;
	ld	hl,#0x3F80
	push	hl
	ld	hl,#0x0000
	push	hl
	ld	l,10 (ix)
	ld	h,11 (ix)
	push	hl
	ld	l,8 (ix)
	ld	h,9 (ix)
	push	hl
	call	___fseq
	pop	af
	pop	af
	pop	af
	pop	af
	ld	c,l
	xor	a,a
	or	a,l
	jr	Z,00104$
	ld	l,4 (ix)
	ld	h,5 (ix)
	ld	e,6 (ix)
	ld	d,7 (ix)
	jp	00107$
00104$:
;../powf.c:29: if(x <= 0.0) return 0.0;
	ld	hl,#0x0000
	push	hl
	ld	hl,#0x0000
	push	hl
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	call	___fsgt
	pop	af
	pop	af
	pop	af
	pop	af
	ld	c,l
	xor	a,a
	or	a,l
	jr	NZ,00106$
	ld	hl,#0x0000
	ld	e,l
	ld	d,h
	jr	00107$
00106$:
;../powf.c:30: return expf(logf(x) * y);
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	call	_logf
	pop	af
	pop	af
	ld	b,h
	ld	c,l
	ld	l,10 (ix)
	ld	h,11 (ix)
	push	hl
	ld	l,8 (ix)
	ld	h,9 (ix)
	push	hl
	push	de
	push	bc
	call	___fsmul
	pop	af
	pop	af
	pop	af
	pop	af
	ld	b,h
	ld	c,l
	push	de
	push	bc
	call	_expf
	pop	af
	pop	af
	ld	b,h
	ld	c,l
	ld	l,c
	ld	h,b
00107$:
	pop	ix
ret
	.area _CODE
	.area _CABS
