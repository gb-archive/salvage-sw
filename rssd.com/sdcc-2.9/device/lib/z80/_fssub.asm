;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.0 #5416 (Apr  7 2010) (MINGW32)
; This file was generated Sun Apr 11 14:38:10 2010
;--------------------------------------------------------
	.module _fssub
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl ___fssub
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
;../_fssub.c:69: float __fssub (float a1, float a2)
;	---------------------------------
; Function __fssub
; ---------------------------------
___fssub:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-14
	add	hl,sp
	ld	sp,hl
;../_fssub.c:73: fl1.f = a1;
	ld	hl,#0x000A
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
;../_fssub.c:74: fl2.f = a2;
	ld	hl,#0x0006
	add	hl,sp
	ld	a,8 (ix)
	ld	(hl),a
	inc	hl
	ld	a,9 (ix)
	ld	(hl),a
	inc	hl
	ld	a,10 (ix)
	ld	(hl),a
	inc	hl
	ld	a,11 (ix)
	ld	(hl),a
;../_fssub.c:77: if (!fl2.l)
	ld	hl,#0x0006
	add	hl,sp
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	inc	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,c
	or	a,b
	or	a,e
	or	a,d
	jr	NZ,00102$
;../_fssub.c:78: return (fl1.f);
	ld	hl,#0x000A
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
	jp	00105$
00102$:
;../_fssub.c:79: if (!fl1.l)
	ld	hl,#0x000A
	add	hl,sp
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	inc	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,c
	or	a,b
	or	a,e
	or	a,d
	jr	NZ,00104$
;../_fssub.c:80: return (-fl2.f);
	ld	hl,#0x0006
	add	hl,sp
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	inc	hl
	ld	e,(hl)
	inc	hl
	ld	a,(hl)
	xor	a,#0x80
	ld	d,a
	ld	l,c
	ld	h,b
	jp	00105$
00104$:
;../_fssub.c:83: fl2.l ^= SIGNBIT;
	ld	hl,#0x0006
	add	hl,sp
	ld	-10 (ix),l
	ld	-9 (ix),h
	ld	hl,#0x0006
	add	hl,sp
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	inc	hl
	ld	c,(hl)
	inc	hl
	ld	a,(hl)
	xor	a,#0x80
	ld	b,a
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	(hl),e
	inc	hl
	ld	(hl),d
	inc	hl
	ld	(hl),c
	inc	hl
	ld	(hl),b
;../_fssub.c:84: return fl1.f + fl2.f; 
	ld	hl,#0x000A
	add	hl,sp
	ld	a,(hl)
	ld	-14 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-13 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-12 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-11 (ix),a
	ld	hl,#0x0006
	add	hl,sp
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	inc	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	push	de
	push	bc
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
	ld	b,h
	ld	c,l
	ld	l,c
	ld	h,b
00105$:
	ld	sp,ix
	pop	ix
ret
	.area _CODE
	.area _CABS
