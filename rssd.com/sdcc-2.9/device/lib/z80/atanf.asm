;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.0 #5416 (Apr  7 2010) (MINGW32)
; This file was generated Sun Apr 11 14:38:16 2010
;--------------------------------------------------------
	.module atanf
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _atanf
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
;  ram data
;--------------------------------------------------------
	.area _DATA
_atanf_a_1_1:
	.ds 16
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
;../atanf.c:49: static myconst float a[]={  0.0, 0.5235987756, 1.5707963268, 1.0471975512 };
	ld	hl,#_atanf_a_1_1
	call	__initrleblock
	.db	#-8,#0x00
	.db	8
	.db	0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.db	0
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;../atanf.c:45: float atanf(const float x) _FLOAT_FUNC_REENTRANT
;	---------------------------------
; Function atanf
; ---------------------------------
_atanf:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-14
	add	hl,sp
	ld	sp,hl
;../atanf.c:48: int n=0;
	ld	-10 (ix),#0x00
	ld	-9 (ix),#0x00
;../atanf.c:51: f=fabsf(x);
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
;../atanf.c:52: if(f>1.0)
	ld	hl,#0x3F80
	push	hl
	ld	hl,#0x0000
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
	jr	Z,00102$
;../atanf.c:54: f=1.0/f;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	push	hl
	ld	l,-4 (ix)
	ld	h,-3 (ix)
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
	ld	b,h
	ld	-4 (ix),l
	ld	-3 (ix),b
	ld	-2 (ix),e
	ld	-1 (ix),d
;../atanf.c:55: n=2;
	ld	-10 (ix),#0x02
	ld	-9 (ix),#0x00
00102$:
;../atanf.c:57: if(f>K1)
	ld	hl,#0x3E89
	push	hl
	ld	hl,#0x30A3
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
	jp	Z,00104$
;../atanf.c:59: f=((K2*f-1.0)+f)/(K3+f);
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	push	hl
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	push	hl
	ld	hl,#0x3F3B
	push	hl
	ld	hl,#0x67AF
	push	hl
	call	___fsmul
	pop	af
	pop	af
	pop	af
	pop	af
	ld	b,h
	ld	c,l
	ld	hl,#0x3F80
	push	hl
	ld	hl,#0x0000
	push	hl
	push	de
	push	bc
	call	___fssub
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
	ld	-11 (ix),d
	ld	-12 (ix),e
	ld	-13 (ix),h
	ld	-14 (ix),l
	ld	hl,#0x3FDD
	push	hl
	ld	hl,#0xB3D7
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
	ld	b,h
	ld	c,l
	push	de
	push	bc
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	push	hl
	ld	l,-14 (ix)
	ld	h,-13 (ix)
	push	hl
	call	___fsdiv
	pop	af
	pop	af
	pop	af
	pop	af
	ld	b,h
	ld	-4 (ix),l
	ld	-3 (ix),b
	ld	-2 (ix),e
	ld	-1 (ix),d
;../atanf.c:63: n++;
	inc	-10 (ix)
	jr	NZ,00119$
	inc	-9 (ix)
00119$:
00104$:
;../atanf.c:65: if(fabsf(f)<EPS) r=f;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	push	hl
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	push	hl
	call	_fabsf
	pop	af
	pop	af
	ld	b,h
	ld	c,l
	ld	hl,#0x3980
	push	hl
	ld	hl,#0x0000
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
	jr	Z,00106$
	ld	a,-4 (ix)
	ld	-8 (ix),a
	ld	a,-3 (ix)
	ld	-7 (ix),a
	ld	a,-2 (ix)
	ld	-6 (ix),a
	ld	a,-1 (ix)
	ld	-5 (ix),a
	jp	00107$
00106$:
;../atanf.c:68: g=f*f;
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
;../atanf.c:69: r=f+P(g,f)/Q(g);
	push	bc
	push	de
	push	de
	push	bc
	ld	hl,#0xBD50
	push	hl
	ld	hl,#0x8691
	push	hl
	call	___fsmul
	pop	af
	pop	af
	pop	af
	pop	af
	ld	-11 (ix),d
	ld	-12 (ix),e
	ld	-13 (ix),h
	ld	-14 (ix),l
	pop	de
	pop	bc
	push	bc
	push	de
	ld	hl,#0xBEF1
	push	hl
	ld	hl,#0x10F6
	push	hl
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	push	hl
	ld	l,-14 (ix)
	ld	h,-13 (ix)
	push	hl
	call	___fsadd
	pop	af
	pop	af
	pop	af
	pop	af
	ld	-11 (ix),d
	ld	-12 (ix),e
	ld	-13 (ix),h
	ld	-14 (ix),l
	pop	de
	pop	bc
	push	bc
	push	de
	push	de
	push	bc
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	push	hl
	ld	l,-14 (ix)
	ld	h,-13 (ix)
	push	hl
	call	___fsmul
	pop	af
	pop	af
	pop	af
	pop	af
	ld	-11 (ix),d
	ld	-12 (ix),e
	ld	-13 (ix),h
	ld	-14 (ix),l
	pop	de
	pop	bc
	push	bc
	push	de
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	push	hl
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	push	hl
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	push	hl
	ld	l,-14 (ix)
	ld	h,-13 (ix)
	push	hl
	call	___fsmul
	pop	af
	pop	af
	pop	af
	pop	af
	ld	-11 (ix),d
	ld	-12 (ix),e
	ld	-13 (ix),h
	ld	-14 (ix),l
	pop	de
	pop	bc
	ld	hl,#0x3FB4
	push	hl
	ld	hl,#0xCCD3
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
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	push	hl
	ld	l,-14 (ix)
	ld	h,-13 (ix)
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
00107$:
;../atanf.c:71: if(n>1) r=-r;
	ld	a,#0x01
	sub	a,-10 (ix)
	ld	a,#0x00
	sbc	a,-9 (ix)
	jp	P,00109$
	ld	a,-5 (ix)
	xor	a,#0x80
	ld	-5 (ix),a
	ld	a,-8 (ix)
	ld	-8 (ix),a
	ld	a,-7 (ix)
	ld	-7 (ix),a
	ld	a,-6 (ix)
	ld	-6 (ix),a
00109$:
;../atanf.c:72: r+=a[n];
	ld	c,-10 (ix)
	ld	b,-9 (ix)
	sla	c
	rl	b
	sla	c
	rl	b
	ld	hl,#_atanf_a_1_1
	add	hl,bc
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	inc	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	push	de
	push	bc
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
;../atanf.c:73: if(x<0.0) r=-r;
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
;../atanf.c:74: return r;
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	e,-6 (ix)
	ld	d,-5 (ix)
	ld	sp,ix
	pop	ix
ret
	.area _CODE
	.area _CABS
