;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.0 #5416 (Apr  7 2010) (MINGW32)
; This file was generated Sun Apr 11 14:38:17 2010
;--------------------------------------------------------
	.module tanhf
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _tanhf
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
;../tanhf.c:40: float tanhf(const float x) _FLOAT_FUNC_REENTRANT
;	---------------------------------
; Function tanhf
; ---------------------------------
_tanhf:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-12
	add	hl,sp
	ld	sp,hl
;../tanhf.c:44: f=fabsf(x);
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
	ld	-4 (ix),l
	ld	-3 (ix),b
	ld	-2 (ix),e
	ld	-1 (ix),d
;../tanhf.c:45: if(f>SBIG) r=1.0;
	ld	hl,#0x4110
	push	hl
	ld	hl,#0x2CB0
	push	hl
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	push	hl
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	push	hl
	call	___fsgt
	pop	af
	pop	af
	pop	af
	pop	af
	xor	a,a
	or	a,l
	jr	Z,00108$
	ld	-8 (ix),#0x00
	ld	-7 (ix),#0x00
	ld	-6 (ix),#0x80
	ld	-5 (ix),#0x3F
	jp	00109$
00108$:
;../tanhf.c:46: else if(f>K1)
	ld	hl,#0x3F0C
	push	hl
	ld	hl,#0x9F54
	push	hl
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	push	hl
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	push	hl
	call	___fsgt
	pop	af
	pop	af
	pop	af
	pop	af
	xor	a,a
	or	a,l
	jp	Z,00105$
;../tanhf.c:48: r=0.5-1.0/(expf(f+f)+1.0);
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	push	hl
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	push	hl
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	push	hl
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	push	hl
	call	___fsadd
	pop	af
	pop	af
	pop	af
	pop	af
	ld	-9 (ix),d
	ld	-10 (ix),e
	ld	-11 (ix),h
	ld	-12 (ix),l
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	push	hl
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	push	hl
	call	_expf
	pop	af
	pop	af
	ld	-9 (ix),d
	ld	-10 (ix),e
	ld	-11 (ix),h
	ld	-12 (ix),l
	ld	hl,#0x3F80
	push	hl
	ld	hl,#0x0000
	push	hl
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	push	hl
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	push	hl
	call	___fsadd
	pop	af
	pop	af
	pop	af
	pop	af
	ld	-9 (ix),d
	ld	-10 (ix),e
	ld	-11 (ix),h
	ld	-12 (ix),l
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	push	hl
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	push	hl
	ld	hl,#0x3F80
	push	hl
	ld	hl,#0x0000
	push	hl
	call	___fsdiv
	pop	af
	pop	af
	pop	af
	pop	af
	ld	-9 (ix),d
	ld	-10 (ix),e
	ld	-11 (ix),h
	ld	-12 (ix),l
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	push	hl
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	push	hl
	ld	hl,#0x3F00
	push	hl
	ld	hl,#0x0000
	push	hl
	call	___fssub
	pop	af
	pop	af
	pop	af
	pop	af
	ld	b,h
	ld	-8 (ix),l
	ld	-7 (ix),b
	ld	-6 (ix),e
	ld	-5 (ix),d
;../tanhf.c:49: r+=r;
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	push	hl
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	push	hl
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	push	hl
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	push	hl
	call	___fsadd
	pop	af
	pop	af
	pop	af
	pop	af
	ld	b,h
	ld	-8 (ix),l
	ld	-7 (ix),b
	ld	-6 (ix),e
	ld	-5 (ix),d
	jp	00109$
00105$:
;../tanhf.c:51: else if(f<EPS) r=f;
	ld	hl,#0x3980
	push	hl
	ld	hl,#0x0000
	push	hl
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	push	hl
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	push	hl
	call	___fslt
	pop	af
	pop	af
	pop	af
	pop	af
	xor	a,a
	or	a,l
	jr	Z,00102$
	ld	a,-4 (ix)
	ld	-8 (ix),a
	ld	a,-3 (ix)
	ld	-7 (ix),a
	ld	a,-2 (ix)
	ld	-6 (ix),a
	ld	a,-1 (ix)
	ld	-5 (ix),a
	jp	00109$
00102$:
;../tanhf.c:54: g=f*f;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	push	hl
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	push	hl
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	push	hl
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	push	hl
	call	___fsmul
	pop	af
	pop	af
	pop	af
	pop	af
	ld	b,h
	ld	c,l
;../tanhf.c:55: r=f+f*(P(g)/Q(g));
	push	bc
	push	de
	push	de
	push	bc
	ld	hl,#0xBB7B
	push	hl
	ld	hl,#0x11B2
	push	hl
	call	___fsmul
	pop	af
	pop	af
	pop	af
	pop	af
	ld	-9 (ix),d
	ld	-10 (ix),e
	ld	-11 (ix),h
	ld	-12 (ix),l
	pop	de
	pop	bc
	push	bc
	push	de
	ld	hl,#0xBF52
	push	hl
	ld	hl,#0xE2C6
	push	hl
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	push	hl
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	push	hl
	call	___fsadd
	pop	af
	pop	af
	pop	af
	pop	af
	ld	-9 (ix),d
	ld	-10 (ix),e
	ld	-11 (ix),h
	ld	-12 (ix),l
	pop	de
	pop	bc
	push	bc
	push	de
	push	de
	push	bc
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	push	hl
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	push	hl
	call	___fsmul
	pop	af
	pop	af
	pop	af
	pop	af
	ld	-9 (ix),d
	ld	-10 (ix),e
	ld	-11 (ix),h
	ld	-12 (ix),l
	pop	de
	pop	bc
	ld	hl,#0x401E
	push	hl
	ld	hl,#0x2A1A
	push	hl
	push	de
	push	bc
	call	___fsadd
	pop	af
	pop	af
	pop	af
	pop	af
	ld	b,h
	ld	c,l
	push	de
	push	bc
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	push	hl
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	push	hl
	call	___fsdiv
	pop	af
	pop	af
	pop	af
	pop	af
	ld	b,h
	ld	c,l
	push	de
	push	bc
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	push	hl
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	push	hl
	call	___fsmul
	pop	af
	pop	af
	pop	af
	pop	af
	ld	b,h
	ld	c,l
	push	de
	push	bc
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	push	hl
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	push	hl
	call	___fsadd
	pop	af
	pop	af
	pop	af
	pop	af
	ld	b,h
	ld	-8 (ix),l
	ld	-7 (ix),b
	ld	-6 (ix),e
	ld	-5 (ix),d
00109$:
;../tanhf.c:57: if(x<0.0) r=-r;
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
	jr	Z,00111$
	ld	a,-5 (ix)
	xor	a,#0x80
	ld	-5 (ix),a
	ld	a,-8 (ix)
	ld	-8 (ix),a
	ld	a,-7 (ix)
	ld	-7 (ix),a
	ld	a,-6 (ix)
	ld	-6 (ix),a
00111$:
;../tanhf.c:58: return r;
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	e,-6 (ix)
	ld	d,-5 (ix)
	ld	sp,ix
	pop	ix
ret
	.area _CODE
	.area _CABS
