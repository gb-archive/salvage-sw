;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.0 #5416 (Apr  7 2010) (MINGW32)
; This file was generated Sun Apr 11 14:38:16 2010
;--------------------------------------------------------
	.module atan2f
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _atan2f
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
;../atan2f.c:24: float atan2f(const float x, const float y)
;	---------------------------------
; Function atan2f
; ---------------------------------
_atan2f:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-8
	add	hl,sp
	ld	sp,hl
;../atan2f.c:28: if ((x==0.0) && (y==0.0))
	ld	a,4 (ix)
	or	a,5 (ix)
	or	a,6 (ix)
	or	a,7 (ix)
	jr	NZ,00102$
	ld	a,8 (ix)
	or	a,9 (ix)
	or	a,10 (ix)
	or	a,11 (ix)
	jr	NZ,00102$
;../atan2f.c:30: errno=EDOM;
	ld	hl,#_errno + 0
	ld	(hl), #0x21
	ld	iy,#_errno
	ld	1 (iy),#0x00
;../atan2f.c:31: return 0.0;
	ld	hl,#0x0000
	ld	e,l
	ld	d,h
	jp	00109$
00102$:
;../atan2f.c:34: if(fabsf(y)>=fabsf(x))
	ld	l,10 (ix)
	ld	h,11 (ix)
	push	hl
	ld	l,8 (ix)
	ld	h,9 (ix)
	push	hl
	call	_fabsf
	pop	af
	pop	af
	ld	-5 (ix),d
	ld	-6 (ix),e
	ld	-7 (ix),h
	ld	-8 (ix),l
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
	push	de
	push	bc
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	push	hl
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	push	hl
	call	___fslt
	pop	af
	pop	af
	pop	af
	pop	af
	xor	a,a
	or	a,l
	jp	NZ,00107$
;../atan2f.c:36: r=atanf(x/y);
	ld	l,10 (ix)
	ld	h,11 (ix)
	push	hl
	ld	l,8 (ix)
	ld	h,9 (ix)
	push	hl
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	ld	l,4 (ix)
	ld	h,5 (ix)
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
	call	_atanf
	pop	af
	pop	af
	ld	b,h
	ld	-4 (ix),l
	ld	-3 (ix),b
	ld	-2 (ix),e
	ld	-1 (ix),d
;../atan2f.c:37: if(y<0.0) r+=(x>=0?PI:-PI);
	ld	hl,#0x0000
	push	hl
	ld	hl,#0x0000
	push	hl
	ld	l,10 (ix)
	ld	h,11 (ix)
	push	hl
	ld	l,8 (ix)
	ld	h,9 (ix)
	push	hl
	call	___fslt
	pop	af
	pop	af
	pop	af
	pop	af
	ld	c,l
	xor	a,a
	or	a,l
	jp	Z,00108$
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
	xor	a,a
	or	a,l
	sub	a,#0x01
	ld	a,#0x00
	rla
	or	a,a
	jr	Z,00111$
	ld	bc,#0x0FDB
	ld	de,#0x4049
	jr	00112$
00111$:
	ld	bc,#0x0FDB
	ld	de,#0xC049
00112$:
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
	ld	c,l
	ld	-4 (ix),c
	ld	-3 (ix),b
	ld	-2 (ix),e
	ld	-1 (ix),d
	jp	00108$
00107$:
;../atan2f.c:41: r=-atanf(y/x);
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	ld	l,10 (ix)
	ld	h,11 (ix)
	push	hl
	ld	l,8 (ix)
	ld	h,9 (ix)
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
	call	_atanf
	pop	af
	pop	af
	ld	b,h
	ld	c,l
	ld	a,d
	xor	a,#0x80
	ld	d,a
	ld	-4 (ix),c
	ld	-3 (ix),b
	ld	-2 (ix),e
	ld	-1 (ix),d
;../atan2f.c:42: r+=(x<0.0?-HALF_PI:HALF_PI);
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
	xor	a,a
	or	a,l
	jr	Z,00113$
	ld	bc,#0x0FDB
	ld	de,#0xBFC9
	jr	00114$
00113$:
	ld	bc,#0x0FDB
	ld	de,#0x3FC9
00114$:
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
	ld	c,l
	ld	-4 (ix),c
	ld	-3 (ix),b
	ld	-2 (ix),e
	ld	-1 (ix),d
00108$:
;../atan2f.c:44: return r;
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	e,-2 (ix)
	ld	d,-1 (ix)
00109$:
	ld	sp,ix
	pop	ix
ret
	.area _CODE
	.area _CABS
