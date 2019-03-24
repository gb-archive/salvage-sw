;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.0 #5416 (Apr  7 2010) (MINGW32)
; This file was generated Sun Apr 11 14:38:10 2010
;--------------------------------------------------------
	.module _fsmul
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl ___fsmul
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
;../_fsmul.c:231: float __fsmul (float a1, float a2) {
;	---------------------------------
; Function __fsmul
; ---------------------------------
___fsmul:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-22
	add	hl,sp
	ld	sp,hl
;../_fsmul.c:237: fl1.f = a1;
	ld	hl,#0x0012
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
;../_fsmul.c:238: fl2.f = a2;
	ld	hl,#0x000E
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
;../_fsmul.c:240: if (!fl1.l || !fl2.l)
	ld	hl,#0x0012
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
	jr	Z,00101$
	ld	hl,#0x000E
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
00101$:
;../_fsmul.c:241: return (0);
	ld	hl,#0x0000
	ld	e,l
	ld	d,h
	jp	00113$
00102$:
;../_fsmul.c:244: sign = SIGN (fl1.l) ^ SIGN (fl2.l);
	ld	hl,#0x0012
	add	hl,sp
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	inc	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,d
	rlc	a
	and	a,#0x01
	ld	-16 (ix),a
	ld	hl,#0x000E
	add	hl,sp
	ld	e,(hl)
	inc	hl
	ld	b,(hl)
	inc	hl
	ld	d,(hl)
	inc	hl
	ld	c,(hl)
	ld	a,c
	rlc	a
	and	a,#0x01
	xor	a,-16 (ix)
	ld	-15 (ix),a
;../_fsmul.c:245: exp = EXP (fl1.l) - EXCESS;
	ld	hl,#0x0012
	add	hl,sp
	ld	e,(hl)
	inc	hl
	ld	b,(hl)
	inc	hl
	ld	d,(hl)
	inc	hl
	ld	c,(hl)
	ld	a,#0x17
	push	af
	inc	sp
	ld	l,d
	ld	h,c
	push	hl
	ld	c,e
	push	bc
	call	__rrulong_rrx_s
	pop	af
	pop	af
	inc	sp
	ld	c,l
	ld	b,#0x00
	ld	de,#0x0000
	ld	a,c
	add	a,#0x82
	ld	c,a
	ld	a,b
	adc	a,#0xFF
	ld	b,a
	ld	a,e
	adc	a,#0xFF
	ld	a,d
	adc	a,#0xFF
	ld	-14 (ix),c
	ld	-13 (ix),b
;../_fsmul.c:246: exp += EXP (fl2.l);
	ld	hl,#0x000E
	add	hl,sp
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	inc	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,#0x17
	push	af
	inc	sp
	push	de
	push	bc
	call	__rrulong_rrx_s
	pop	af
	pop	af
	inc	sp
	ld	-20 (ix),l
	ld	-19 (ix),#0x00
	ld	-18 (ix),#0x00
	ld	-17 (ix),#0x00
	ld	c,-14 (ix)
	ld	b,-13 (ix)
	ld	a,-13 (ix)
	rla	
	sbc	a,a
	ld	e,a
	ld	d,a
	ld	a,c
	add	a,-20 (ix)
	ld	c,a
	ld	a,b
	adc	a,-19 (ix)
	ld	b,a
	ld	a,e
	adc	a,-18 (ix)
	ld	a,d
	adc	a,-17 (ix)
	ld	-14 (ix),c
	ld	-13 (ix),b
;../_fsmul.c:248: fl1.l = MANT (fl1.l);
	ld	hl,#0x0012
	add	hl,sp
	ld	-20 (ix),l
	ld	-19 (ix),h
	ld	hl,#0x0012
	add	hl,sp
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	inc	hl
	ld	c,(hl)
	inc	hl
	ld	a,c
	and	a,#0x7F
	ld	b,#0x00
	or	a,#0x80
	ld	c,a
	ld	l,-20 (ix)
	ld	h,-19 (ix)
	ld	(hl),e
	inc	hl
	ld	(hl),d
	inc	hl
	ld	(hl),c
	inc	hl
	ld	(hl),b
;../_fsmul.c:249: fl2.l = MANT (fl2.l);
	ld	hl,#0x000E
	add	hl,sp
	ld	-20 (ix),l
	ld	-19 (ix),h
	ld	hl,#0x000E
	add	hl,sp
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	inc	hl
	ld	c,(hl)
	inc	hl
	ld	a,c
	and	a,#0x7F
	ld	b,#0x00
	or	a,#0x80
	ld	c,a
	ld	l,-20 (ix)
	ld	h,-19 (ix)
	ld	(hl),e
	inc	hl
	ld	(hl),d
	inc	hl
	ld	(hl),c
	inc	hl
	ld	(hl),b
;../_fsmul.c:252: result = (fl1.l >> 8) * (fl2.l >> 8);
	ld	hl,#0x0012
	add	hl,sp
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	inc	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,#0x08
	push	af
	inc	sp
	push	de
	push	bc
	call	__rrulong_rrx_s
	pop	af
	pop	af
	inc	sp
	ld	-17 (ix),d
	ld	-18 (ix),e
	ld	-19 (ix),h
	ld	-20 (ix),l
	ld	hl,#0x000E
	add	hl,sp
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	inc	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,#0x08
	push	af
	inc	sp
	push	de
	push	bc
	call	__rrulong_rrx_s
	pop	af
	pop	af
	inc	sp
	ld	b,h
	ld	c,l
	push	de
	push	bc
	ld	l,-18 (ix)
	ld	h,-17 (ix)
	push	hl
	ld	l,-20 (ix)
	ld	h,-19 (ix)
	push	hl
	call	__mullong_rrx_s
	pop	af
	pop	af
	pop	af
	pop	af
	ld	b,h
	ld	-12 (ix),l
	ld	-11 (ix),b
	ld	-10 (ix),e
	ld	-9 (ix),d
;../_fsmul.c:253: result += ((fl1.l & (unsigned long) 0xFF) * (fl2.l >> 8)) >> 8;
	ld	hl,#0x0012
	add	hl,sp
	ld	c,(hl)
	inc	hl
	inc	hl
	inc	hl
	ld	-20 (ix),c
	ld	-19 (ix),#0x00
	ld	-18 (ix),#0x00
	ld	-17 (ix),#0x00
	ld	hl,#0x000E
	add	hl,sp
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	inc	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,#0x08
	push	af
	inc	sp
	push	de
	push	bc
	call	__rrulong_rrx_s
	pop	af
	pop	af
	inc	sp
	ld	b,h
	ld	c,l
	push	de
	push	bc
	ld	l,-18 (ix)
	ld	h,-17 (ix)
	push	hl
	ld	l,-20 (ix)
	ld	h,-19 (ix)
	push	hl
	call	__mullong_rrx_s
	pop	af
	pop	af
	pop	af
	pop	af
	ld	b,h
	ld	c,l
	ld	a,#0x08
	push	af
	inc	sp
	push	de
	push	bc
	call	__rrulong_rrx_s
	pop	af
	pop	af
	inc	sp
	ld	b,h
	ld	c,l
	ld	a,-12 (ix)
	add	a,c
	ld	-12 (ix),a
	ld	a,-11 (ix)
	adc	a,b
	ld	-11 (ix),a
	ld	a,-10 (ix)
	adc	a,e
	ld	-10 (ix),a
	ld	a,-9 (ix)
	adc	a,d
	ld	-9 (ix),a
;../_fsmul.c:254: result += ((fl2.l & (unsigned long) 0xFF) * (fl1.l >> 8)) >> 8;
	ld	hl,#0x000E
	add	hl,sp
	ld	c,(hl)
	inc	hl
	inc	hl
	inc	hl
	ld	-20 (ix),c
	ld	-19 (ix),#0x00
	ld	-18 (ix),#0x00
	ld	-17 (ix),#0x00
	ld	hl,#0x0012
	add	hl,sp
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	inc	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,#0x08
	push	af
	inc	sp
	push	de
	push	bc
	call	__rrulong_rrx_s
	pop	af
	pop	af
	inc	sp
	ld	b,h
	ld	c,l
	push	de
	push	bc
	ld	l,-18 (ix)
	ld	h,-17 (ix)
	push	hl
	ld	l,-20 (ix)
	ld	h,-19 (ix)
	push	hl
	call	__mullong_rrx_s
	pop	af
	pop	af
	pop	af
	pop	af
	ld	b,h
	ld	c,l
	ld	a,#0x08
	push	af
	inc	sp
	push	de
	push	bc
	call	__rrulong_rrx_s
	pop	af
	pop	af
	inc	sp
	ld	b,h
	ld	c,l
	ld	a,-12 (ix)
	add	a,c
	ld	-12 (ix),a
	ld	a,-11 (ix)
	adc	a,b
	ld	-11 (ix),a
	ld	a,-10 (ix)
	adc	a,e
	ld	-10 (ix),a
	ld	a,-9 (ix)
	adc	a,d
;../_fsmul.c:256: if (result & SIGNBIT)
	ld	-9 (ix),a
	and	a,#0x80
	jr	Z,00105$
;../_fsmul.c:259: result += 0x80;
	ld	a,-12 (ix)
	add	a,#0x80
	ld	-12 (ix),a
	ld	a,-11 (ix)
	adc	a,#0x00
	ld	-11 (ix),a
	ld	a,-10 (ix)
	adc	a,#0x00
	ld	-10 (ix),a
	ld	a,-9 (ix)
	adc	a,#0x00
	ld	-9 (ix),a
;../_fsmul.c:260: result >>= 8;
	ld	a,#0x08
	push	af
	inc	sp
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	push	hl
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	push	hl
	call	__rrulong_rrx_s
	pop	af
	pop	af
	inc	sp
	ld	b,h
	ld	c,l
	ld	-12 (ix),c
	ld	-11 (ix),b
	ld	-10 (ix),e
	ld	-9 (ix),d
	jr	00106$
00105$:
;../_fsmul.c:265: result += 0x40;
	ld	a,-12 (ix)
	add	a,#0x40
	ld	-12 (ix),a
	ld	a,-11 (ix)
	adc	a,#0x00
	ld	-11 (ix),a
	ld	a,-10 (ix)
	adc	a,#0x00
	ld	-10 (ix),a
	ld	a,-9 (ix)
	adc	a,#0x00
	ld	-9 (ix),a
;../_fsmul.c:266: result >>= 7;
	ld	a,#0x07
	push	af
	inc	sp
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	push	hl
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	push	hl
	call	__rrulong_rrx_s
	pop	af
	pop	af
	inc	sp
	ld	b,h
	ld	c,l
	ld	-12 (ix),c
	ld	-11 (ix),b
	ld	-10 (ix),e
	ld	-9 (ix),d
;../_fsmul.c:267: exp--;
	ld	l,-14 (ix)
	ld	h,-13 (ix)
	dec	hl
	ld	-14 (ix),l
	ld	-13 (ix),h
00106$:
;../_fsmul.c:270: result &= ~HIDDEN;
	ld	a,-10 (ix)
	and	a,#0x7F
	ld	-10 (ix),a
;../_fsmul.c:273: if (exp >= 0x100)
	ld	a,-14 (ix)
	sub	a,#0x00
	ld	a,-13 (ix)
	sbc	a,#0x01
	jp	M,00111$
;../_fsmul.c:274: fl1.l = (sign ? SIGNBIT : 0) | __INFINITY;
	ld	hl,#0x0012
	add	hl,sp
	ld	-22 (ix),l
	ld	-21 (ix),h
	xor	a,a
	or	a,-15 (ix)
	jr	Z,00115$
	ld	bc,#0x0000
	jr	00116$
00115$:
	ld	bc,#0x0000
00116$:
	ld	e,c
	ld	d,b
	ld	a,e
	or	a,#0x80
	ld	c,a
	ld	a,d
	or	a,#0x7F
	ld	b,a
	ld	l,-22 (ix)
	ld	h,-21 (ix)
	ld	(hl),e
	inc	hl
	ld	(hl),d
	inc	hl
	ld	(hl),c
	inc	hl
	ld	(hl),b
	jp	00112$
00111$:
;../_fsmul.c:275: else if (exp < 0)
	ld	a,-13 (ix)
	bit	7,a
	jr	Z,00108$
;../_fsmul.c:276: fl1.l = 0;
	ld	hl,#0x0012
	add	hl,sp
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
	jp	00112$
00108$:
;../_fsmul.c:278: fl1.l = PACK (sign ? SIGNBIT : 0 , exp, result);
	ld	hl,#0x0012
	add	hl,sp
	ld	-22 (ix),l
	ld	-21 (ix),h
	xor	a,a
	or	a,-15 (ix)
	jr	Z,00117$
	ld	-20 (ix),#0x00
	ld	-19 (ix),#0x00
	ld	-18 (ix),#0x00
	ld	-17 (ix),#0x80
	jr	00118$
00117$:
	xor	a,a
	ld	-20 (ix),a
	ld	-19 (ix),a
	ld	-18 (ix),a
	ld	-17 (ix),a
00118$:
	ld	e,-14 (ix)
	ld	d,-13 (ix)
	ld	a,-13 (ix)
	rla	
	sbc	a,a
	ld	c,a
	ld	b,a
	ld	a,#0x17
	push	af
	inc	sp
	push	bc
	push	de
	call	__rlulong_rrx_s
	pop	af
	pop	af
	inc	sp
	ld	b,h
	ld	a,l
	or	a,-20 (ix)
	ld	c,a
	ld	a,b
	or	a,-19 (ix)
	ld	b,a
	ld	a,e
	or	a,-18 (ix)
	ld	e,a
	ld	a,d
	or	a,-17 (ix)
	ld	d,a
	ld	a,c
	or	a,-12 (ix)
	ld	c,a
	ld	a,b
	or	a,-11 (ix)
	ld	b,a
	ld	a,e
	or	a,-10 (ix)
	ld	e,a
	ld	a,d
	or	a,-9 (ix)
	ld	d,a
	ld	l,-22 (ix)
	ld	h,-21 (ix)
	ld	(hl),c
	inc	hl
	ld	(hl),b
	inc	hl
	ld	(hl),e
	inc	hl
	ld	(hl),d
00112$:
;../_fsmul.c:279: return (fl1.f);
	ld	hl,#0x0012
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
00113$:
	ld	sp,ix
	pop	ix
ret
	.area _CODE
	.area _CABS
