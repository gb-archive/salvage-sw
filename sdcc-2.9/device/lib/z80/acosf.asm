;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.0 #5416 (Apr  7 2010) (MINGW32)
; This file was generated Sun Apr 11 14:38:16 2010
;--------------------------------------------------------
	.module acosf
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _acosf
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
;../acosf.c:25: float acosf(const float x) _FLOAT_FUNC_REENTRANT
;	---------------------------------
; Function acosf
; ---------------------------------
_acosf:
	push	ix
	ld	ix,#0
	add	ix,sp
;../acosf.c:27: if(x== 1.0) return 0.0;
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
	jr	Z,00107$
	ld	hl,#0x0000
	ld	e,l
	ld	d,h
	jp	00109$
00107$:
;../acosf.c:28: else if(x==-1.0) return PI;
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
	jr	Z,00104$
	ld	hl,#0x0FDB
	ld	de,#0x4049
	jr	00109$
00104$:
;../acosf.c:29: else if(x== 0.0) return HALF_PI;
	ld	a,4 (ix)
	or	a,5 (ix)
	or	a,6 (ix)
	or	a,7 (ix)
	jr	NZ,00108$
	ld	hl,#0x0FDB
	ld	de,#0x3FC9
	jr	00109$
00108$:
;../acosf.c:30: return asincosf(x,1);
	ld	hl,#0x0001
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
00109$:
	pop	ix
ret
	.area _CODE
	.area _CABS
