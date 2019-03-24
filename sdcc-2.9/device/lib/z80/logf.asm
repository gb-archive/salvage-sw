;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.0 #5416 (Apr  7 2010) (MINGW32)
; This file was generated Sun Apr 11 14:38:13 2010
;--------------------------------------------------------
	.module logf
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _logf
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
;../logf.c:202: float logf(const float x) _FLOAT_FUNC_REENTRANT
;	---------------------------------
; Function logf
; ---------------------------------
_logf:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-30
	add	hl,sp
	ld	sp,hl
;../logf.c:212: if (x<=0.0)
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
	jr	NZ,00102$
;../logf.c:214: errno=EDOM;
	ld	hl,#_errno + 0
	ld	(hl), #0x21
	ld	iy,#_errno
	ld	1 (iy),#0x00
;../logf.c:215: return 0.0;
	ld	hl,#0x0000
	ld	e,l
	ld	d,h
	jp	00106$
00102$:
;../logf.c:217: f=frexpf(x, &n);
	ld	hl,#0x0004
	add	hl,sp
	push	hl
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	call	_frexpf
	pop	af
	pop	af
	pop	af
	ld	b,h
	ld	-8 (ix),l
	ld	-7 (ix),b
	ld	-6 (ix),e
	ld	-5 (ix),d
;../logf.c:218: znum=f-0.5;
	ld	hl,#0x3F00
	push	hl
	ld	hl,#0x0000
	push	hl
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	push	hl
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	push	hl
	call	___fssub
	pop	af
	pop	af
	pop	af
	pop	af
	ld	b,h
	ld	-16 (ix),l
	ld	-15 (ix),b
	ld	-14 (ix),e
	ld	-13 (ix),d
;../logf.c:219: if (f>C0)
	ld	hl,#0x3F35
	push	hl
	ld	hl,#0x04F3
	push	hl
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	push	hl
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	push	hl
	call	___fsgt
	pop	af
	pop	af
	pop	af
	pop	af
	xor	a,a
	or	a,l
	jp	Z,00104$
;../logf.c:221: znum-=0.5;
	ld	hl,#0x3F00
	push	hl
	ld	hl,#0x0000
	push	hl
	ld	l,-14 (ix)
	ld	h,-13 (ix)
	push	hl
	ld	l,-16 (ix)
	ld	h,-15 (ix)
	push	hl
	call	___fssub
	pop	af
	pop	af
	pop	af
	pop	af
	ld	b,h
	ld	-16 (ix),l
	ld	-15 (ix),b
	ld	-14 (ix),e
	ld	-13 (ix),d
;../logf.c:222: zden=(f*0.5)+0.5;
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	push	hl
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	push	hl
	ld	hl,#0x3F00
	push	hl
	ld	hl,#0x0000
	push	hl
	call	___fsmul
	pop	af
	pop	af
	pop	af
	pop	af
	ld	b,h
	ld	c,l
	ld	hl,#0x3F00
	push	hl
	ld	hl,#0x0000
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
	jp	00105$
00104$:
;../logf.c:226: n--;
	ld	c,-26 (ix)
	ld	b,-25 (ix)
	ld	a,c
	add	a,#0xFF
	ld	-26 (ix),a
	ld	a,b
	adc	a,#0xFF
	ld	-25 (ix),a
;../logf.c:227: zden=znum*0.5+0.5;
	ld	l,-14 (ix)
	ld	h,-13 (ix)
	push	hl
	ld	l,-16 (ix)
	ld	h,-15 (ix)
	push	hl
	ld	hl,#0x3F00
	push	hl
	ld	hl,#0x0000
	push	hl
	call	___fsmul
	pop	af
	pop	af
	pop	af
	pop	af
	ld	b,h
	ld	c,l
	ld	hl,#0x3F00
	push	hl
	ld	hl,#0x0000
	push	hl
	push	de
	push	bc
	call	___fsadd
	pop	af
	pop	af
	pop	af
	pop	af
	ld	-17 (ix),d
	ld	-18 (ix),e
	ld	-19 (ix),h
	ld	-20 (ix),l
	ld	c, l
	ld	b,-19 (ix)
	ld	e,-18 (ix)
	ld	d,-17 (ix)
00105$:
;../logf.c:229: z=znum/zden;
	push	de
	push	bc
	ld	l,-14 (ix)
	ld	h,-13 (ix)
	push	hl
	ld	l,-16 (ix)
	ld	h,-15 (ix)
	push	hl
	call	___fsdiv
	pop	af
	pop	af
	pop	af
	pop	af
	ld	b,h
	ld	-12 (ix),l
	ld	-11 (ix),b
	ld	-10 (ix),e
	ld	-9 (ix),d
;../logf.c:230: w=z*z;
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	push	hl
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	push	hl
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
	ld	b,h
	ld	c,l
;../logf.c:232: Rz=z+z*(w*A(w)/B(w));
	push	bc
	push	de
	push	de
	push	bc
	ld	hl,#0xBF0D
	push	hl
	ld	hl,#0x7E3D
	push	hl
	call	___fsmul
	pop	af
	pop	af
	pop	af
	pop	af
	ld	-27 (ix),d
	ld	-28 (ix),e
	ld	-29 (ix),h
	ld	-30 (ix),l
	pop	de
	pop	bc
	ld	hl,#0xC0D4
	push	hl
	ld	hl,#0x3F3A
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
	ld	l,-28 (ix)
	ld	h,-27 (ix)
	push	hl
	ld	l,-30 (ix)
	ld	h,-29 (ix)
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
	call	___fsadd
	pop	af
	pop	af
	pop	af
	pop	af
	ld	b,h
	ld	-4 (ix),l
	ld	-3 (ix),b
	ld	-2 (ix),e
	ld	-1 (ix),d
;../logf.c:233: xn=n;
	ld	l,-26 (ix)
	ld	h,-25 (ix)
	push	hl
	call	___sint2fs
	pop	af
	ld	b,h
	ld	-24 (ix),l
	ld	-23 (ix),b
	ld	-22 (ix),e
	ld	-21 (ix),d
;../logf.c:234: return ((xn*C2+Rz)+xn*C1);
	ld	l,-22 (ix)
	ld	h,-21 (ix)
	push	hl
	ld	l,-24 (ix)
	ld	h,-23 (ix)
	push	hl
	ld	hl,#0xB95E
	push	hl
	ld	hl,#0x8083
	push	hl
	call	___fsmul
	pop	af
	pop	af
	pop	af
	pop	af
	ld	b,h
	ld	c,l
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	push	hl
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	push	hl
	push	de
	push	bc
	call	___fsadd
	pop	af
	pop	af
	pop	af
	pop	af
	ld	-27 (ix),d
	ld	-28 (ix),e
	ld	-29 (ix),h
	ld	-30 (ix),l
	ld	l,-22 (ix)
	ld	h,-21 (ix)
	push	hl
	ld	l,-24 (ix)
	ld	h,-23 (ix)
	push	hl
	ld	hl,#0x3F31
	push	hl
	ld	hl,#0x8000
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
	ld	l,-28 (ix)
	ld	h,-27 (ix)
	push	hl
	ld	l,-30 (ix)
	ld	h,-29 (ix)
	push	hl
	call	___fsadd
	pop	af
	pop	af
	pop	af
	pop	af
	ld	b,h
	ld	c,l
	ld	l,c
	ld	h,b
00106$:
	ld	sp,ix
	pop	ix
ret
	.area _CODE
	.area _CABS
