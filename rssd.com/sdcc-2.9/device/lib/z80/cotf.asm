;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.0 #5416 (Apr  7 2010) (MINGW32)
; This file was generated Sun Apr 11 14:38:15 2010
;--------------------------------------------------------
	.module cotf
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _cotf
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
;../cotf.c:26: float cotf(const float x) _FLOAT_FUNC_REENTRANT
;	---------------------------------
; Function cotf
; ---------------------------------
_cotf:
	push	ix
	ld	ix,#0
	add	ix,sp
;../cotf.c:30: y=fabsf(x);
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	call	_fabsf
	pop	af
	pop	af
	ld	b,h
	ld	c,l
;../cotf.c:31: if (y<1.0E-30) //This one requires more thinking...
	ld	hl,#0x0DA2
	push	hl
	ld	hl,#0x4260
	push	hl
	push	de
	push	bc
	call	___fslt
	pop	af
	pop	af
	pop	af
	pop	af
	xor	a,a
	or	a,l
	jr	Z,00105$
;../cotf.c:33: errno = ERANGE;
	ld	hl,#_errno + 0
	ld	(hl), #0x22
	ld	hl,#_errno + 1
	ld	(hl), #0x00
;../cotf.c:34: if (x<0.0)
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
	call	___fslt
	pop	af
	pop	af
	pop	af
	pop	af
	ld	c,l
	xor	a,a
	or	a,l
	jr	Z,00102$
;../cotf.c:35: return -HUGE_VALF;
	ld	hl,#0xFFFF
	ld	de,#0xFF7F
	jr	00106$
00102$:
;../cotf.c:37: return +HUGE_VALF;
	ld	hl,#0xFFFF
	ld	de,#0x7F7F
	jr	00106$
00105$:
;../cotf.c:39: return tancotf(x, 1);
	ld	hl,#0x0001
	push	hl
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	call	_tancotf
	pop	af
	pop	af
	pop	af
	ld	b,h
	ld	c,l
	ld	l,c
	ld	h,b
00106$:
	pop	ix
ret
	.area _CODE
	.area _CABS
