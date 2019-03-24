;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.0 #5416 (Apr  7 2010) (MINGW32)
; This file was generated Sun Apr 11 14:38:15 2010
;--------------------------------------------------------
	.module asinf
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _asinf
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
;../asinf.c:25: float asinf(const float x) _FLOAT_FUNC_REENTRANT
;	---------------------------------
; Function asinf
; ---------------------------------
_asinf:
	push	ix
	ld	ix,#0
	add	ix,sp
;../asinf.c:27: if(x== 1.0) return  HALF_PI;
	ld	hl,#0x3F80
	push	hl
	ld	hl,#0x0000
	push	hl
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	call	___fseq
	pop	af
	pop	af
	pop	af
	pop	af
	ld	c,l
	xor	a,a
	or	a,l
	jr	Z,00108$
	ld	hl,#0x0FDB
	ld	de,#0x3FC9
	jp	00110$
00108$:
;../asinf.c:28: else if(x==-1.0) return -HALF_PI;
	ld	hl,#0xBF80
	push	hl
	ld	hl,#0x0000
	push	hl
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	call	___fseq
	pop	af
	pop	af
	pop	af
	pop	af
	ld	c,l
	xor	a,a
	or	a,l
	jr	Z,00105$
	ld	hl,#0x0FDB
	ld	de,#0xBFC9
	jr	00110$
00105$:
;../asinf.c:29: else if(x== 0.0) return 0.0;
	ld	a,4 (ix)
	or	a,5 (ix)
	or	a,6 (ix)
	or	a,7 (ix)
	jr	NZ,00102$
	ld	hl,#0x0000
	ld	e,l
	ld	d,h
	jr	00110$
00102$:
;../asinf.c:30: else return asincosf(x,0);
	ld	hl,#0x0000
	push	hl
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	call	_asincosf
	pop	af
	pop	af
	pop	af
	ld	b,h
	ld	c,l
	ld	l,c
	ld	h,b
00110$:
	pop	ix
ret
	.area _CODE
	.area _CABS
