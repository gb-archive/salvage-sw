;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.0 #5416 (Apr  7 2010) (MINGW32)
; This file was generated Sun Apr 11 14:38:09 2010
;--------------------------------------------------------
	.module _fsadd
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl ___fsadd
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
;../_fsadd.c:160: float __fsadd (float a1, float a2)
;	---------------------------------
; Function __fsadd
; ---------------------------------
___fsadd:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-27
	add	hl,sp
	ld	sp,hl
;../_fsadd.c:165: char sign = 0;
	ld	-21 (ix),#0x00
;../_fsadd.c:167: fl1.f = a1;
	ld	hl,#0x000F
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
;../_fsadd.c:168: fl2.f = a2;
	ld	hl,#0x000B
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
;../_fsadd.c:171: if (!fl1.l)
	ld	hl,#0x000F
	add	hl,sp
	ld	e,(hl)
	inc	hl
	ld	b,(hl)
	inc	hl
	ld	d,(hl)
	inc	hl
	ld	c,(hl)
	ld	a,e
	or	a,b
	or	a,d
	or	a,c
	jr	NZ,00102$
;../_fsadd.c:172: return (fl2.f);
	ld	hl,#0x000B
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
	jp	00135$
00102$:
;../_fsadd.c:173: if (!fl2.l)
	ld	hl,#0x000B
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
;../_fsadd.c:174: return (fl1.f);
	ld	hl,#0x000F
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
	jp	00135$
00104$:
;../_fsadd.c:176: exp1 = EXP (fl1.l);
	ld	hl,#0x000F
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
	ld	c,l
	ld	b,#0x00
	ld	-18 (ix),c
	ld	-17 (ix),b
;../_fsadd.c:177: exp2 = EXP (fl2.l);
	ld	hl,#0x000B
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
	ld	c,l
	ld	b,#0x00
	ld	-20 (ix),c
	ld	-19 (ix),b
;../_fsadd.c:179: if (exp1 > exp2 + 25)
	ld	a,-20 (ix)
	add	a,#0x19
	ld	c,a
	ld	a,-19 (ix)
	adc	a,#0x00
	ld	b,a
	ld	a,c
	sub	a,-18 (ix)
	ld	a,b
	sbc	a,-17 (ix)
	jp	P,00106$
;../_fsadd.c:180: return (fl1.f);
	ld	hl,#0x000F
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
	jp	00135$
00106$:
;../_fsadd.c:181: if (exp2 > exp1 + 25)
	ld	a,-18 (ix)
	add	a,#0x19
	ld	c,a
	ld	a,-17 (ix)
	adc	a,#0x00
	ld	b,a
	ld	a,c
	sub	a,-20 (ix)
	ld	a,b
	sbc	a,-19 (ix)
	jp	P,00108$
;../_fsadd.c:182: return (fl2.f);
	ld	hl,#0x000B
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
	jp	00135$
00108$:
;../_fsadd.c:184: mant1 = MANT (fl1.l);
	ld	hl,#0x000F
	add	hl,sp
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	inc	hl
	ld	e,(hl)
	inc	hl
	ld	a,e
	and	a,#0x7F
	ld	e,a
	ld	d,#0x00
	ld	-4 (ix),c
	ld	-3 (ix),b
	ld	a,e
	or	a,#0x80
	ld	-2 (ix),a
	ld	-1 (ix),d
;../_fsadd.c:185: mant2 = MANT (fl2.l);
	ld	hl,#0x000B
	add	hl,sp
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	inc	hl
	ld	e,(hl)
	inc	hl
	ld	a,e
	and	a,#0x7F
	ld	e,a
	ld	d,#0x00
	ld	-8 (ix),c
	ld	-7 (ix),b
	ld	a,e
	or	a,#0x80
	ld	-6 (ix),a
	ld	-5 (ix),d
;../_fsadd.c:187: if (SIGN (fl1.l))
	ld	hl,#0x000F
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
	jr	Z,00110$
;../_fsadd.c:188: mant1 = -mant1;
	xor	a,a
	sbc	a,-4 (ix)
	ld	-4 (ix),a
	ld	a,#0x00
	sbc	a,-3 (ix)
	ld	-3 (ix),a
	ld	a,#0x00
	sbc	a,-2 (ix)
	ld	-2 (ix),a
	ld	a,#0x00
	sbc	a,-1 (ix)
	ld	-1 (ix),a
00110$:
;../_fsadd.c:189: if (SIGN (fl2.l))
	ld	hl,#0x000B
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
	jr	Z,00112$
;../_fsadd.c:190: mant2 = -mant2;
	xor	a,a
	sbc	a,-8 (ix)
	ld	-8 (ix),a
	ld	a,#0x00
	sbc	a,-7 (ix)
	ld	-7 (ix),a
	ld	a,#0x00
	sbc	a,-6 (ix)
	ld	-6 (ix),a
	ld	a,#0x00
	sbc	a,-5 (ix)
	ld	-5 (ix),a
00112$:
;../_fsadd.c:192: if (exp1 > exp2)
	ld	a,-20 (ix)
	sub	a,-18 (ix)
	ld	a,-19 (ix)
	sbc	a,-17 (ix)
	jp	P,00114$
;../_fsadd.c:194: mant2 >>= exp1 - exp2;
	ld	a,-18 (ix)
	sub	a,-20 (ix)
	ld	c,a
	ld	a,-17 (ix)
	sbc	a,-19 (ix)
	ld	b,a
	push	bc
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	push	hl
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	push	hl
	call	__rrslong_rrx_s
	pop	af
	pop	af
	pop	af
	ld	b,h
	ld	c,l
	ld	-8 (ix),c
	ld	-7 (ix),b
	ld	-6 (ix),e
	ld	-5 (ix),d
	jr	00115$
00114$:
;../_fsadd.c:198: mant1 >>= exp2 - exp1;
	ld	a,-20 (ix)
	sub	a,-18 (ix)
	ld	c,a
	ld	a,-19 (ix)
	sbc	a,-17 (ix)
	ld	b,a
	push	bc
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	push	hl
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	push	hl
	call	__rrslong_rrx_s
	pop	af
	pop	af
	pop	af
	ld	b,h
	ld	c,l
	ld	-4 (ix),c
	ld	-3 (ix),b
	ld	-2 (ix),e
	ld	-1 (ix),d
;../_fsadd.c:199: exp1 = exp2;
	ld	a,-20 (ix)
	ld	-18 (ix),a
	ld	a,-19 (ix)
	ld	-17 (ix),a
00115$:
;../_fsadd.c:201: mant1 += mant2;
	ld	a,-4 (ix)
	add	a,-8 (ix)
	ld	-4 (ix),a
	ld	a,-3 (ix)
	adc	a,-7 (ix)
	ld	-3 (ix),a
	ld	a,-2 (ix)
	adc	a,-6 (ix)
	ld	-2 (ix),a
	ld	a,-1 (ix)
	adc	a,-5 (ix)
;../_fsadd.c:203: if (mant1 < 0)
	ld	-1 (ix),a
	bit	7,a
	jr	Z,00119$
;../_fsadd.c:205: mant1 = -mant1;
	xor	a,a
	sbc	a,-4 (ix)
	ld	-4 (ix),a
	ld	a,#0x00
	sbc	a,-3 (ix)
	ld	-3 (ix),a
	ld	a,#0x00
	sbc	a,-2 (ix)
	ld	-2 (ix),a
	ld	a,#0x00
	sbc	a,-1 (ix)
	ld	-1 (ix),a
;../_fsadd.c:206: sign = 1;
	ld	-21 (ix),#0x01
	jr	00121$
00119$:
;../_fsadd.c:208: else if (!mant1)
	ld	a,-4 (ix)
	or	a,-3 (ix)
	or	a,-2 (ix)
	or	a,-1 (ix)
	jr	NZ,00121$
;../_fsadd.c:209: return (0);
	ld	hl,#0x0000
	ld	e,l
	ld	d,h
	jp	00135$
;../_fsadd.c:212: while (mant1<HIDDEN) {
00121$:
	ld	c,-4 (ix)
	ld	b,-3 (ix)
	ld	e,-2 (ix)
	ld	d,-1 (ix)
	ld	a,c
	sub	a,#0x00
	ld	a,b
	sbc	a,#0x00
	ld	a,e
	sbc	a,#0x80
	ld	a,d
	sbc	a,#0x00
	jr	NC,00126$
;../_fsadd.c:213: mant1 <<= 1;
	ld	a,#0x01
	push	af
	inc	sp
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	push	hl
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	push	hl
	call	__rlslong_rrx_s
	pop	af
	pop	af
	inc	sp
	ld	b,h
	ld	-4 (ix),l
	ld	-3 (ix),b
	ld	-2 (ix),e
	ld	-1 (ix),d
;../_fsadd.c:214: exp1--;
	ld	l,-18 (ix)
	ld	h,-17 (ix)
	dec	hl
	ld	-18 (ix),l
	ld	-17 (ix),h
	jr	00121$
;../_fsadd.c:218: while (mant1 & 0xff000000) {
00126$:
	ld	c,-4 (ix)
	ld	b,-3 (ix)
	ld	e,-2 (ix)
	ld	a,-1 (ix)
	or	a,a
	jr	Z,00128$
;../_fsadd.c:219: if (mant1&1)
	ld	a,-4 (ix)
	and	a,#0x01
	jr	Z,00125$
;../_fsadd.c:220: mant1 += 2;
	ld	a,-4 (ix)
	add	a,#0x02
	ld	-4 (ix),a
	ld	a,-3 (ix)
	adc	a,#0x00
	ld	-3 (ix),a
	ld	a,-2 (ix)
	adc	a,#0x00
	ld	-2 (ix),a
	ld	a,-1 (ix)
	adc	a,#0x00
	ld	-1 (ix),a
00125$:
;../_fsadd.c:221: mant1 >>= 1;
	ld	a,#0x01
	push	af
	inc	sp
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	push	hl
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	push	hl
	call	__rrslong_rrx_s
	pop	af
	pop	af
	inc	sp
	ld	b,h
	ld	-4 (ix),l
	ld	-3 (ix),b
	ld	-2 (ix),e
	ld	-1 (ix),d
;../_fsadd.c:222: exp1++;
	inc	-18 (ix)
	jr	NZ,00161$
	inc	-17 (ix)
00161$:
	jp	00126$
00128$:
;../_fsadd.c:226: mant1 &= ~HIDDEN;
	ld	c,-4 (ix)
	ld	b,-3 (ix)
	ld	e,-2 (ix)
	ld	d,-1 (ix)
	ld	-4 (ix),c
	ld	-3 (ix),b
	ld	a,e
	and	a,#0x7F
	ld	-2 (ix),a
	ld	-1 (ix),d
;../_fsadd.c:229: if (exp1 >= 0x100)
	ld	a,-18 (ix)
	sub	a,#0x00
	ld	a,-17 (ix)
	sbc	a,#0x01
	jp	M,00133$
;../_fsadd.c:230: fl1.l = (sign ? SIGNBIT : 0) | __INFINITY;
	ld	hl,#0x000F
	add	hl,sp
	ld	-27 (ix),l
	ld	-26 (ix),h
	xor	a,a
	or	a,-21 (ix)
	jr	Z,00137$
	ld	bc,#0x0000
	jr	00138$
00137$:
	ld	bc,#0x0000
00138$:
	ld	e,c
	ld	d,b
	ld	a,e
	or	a,#0x80
	ld	c,a
	ld	a,d
	or	a,#0x7F
	ld	b,a
	ld	l,-27 (ix)
	ld	h,-26 (ix)
	ld	(hl),e
	inc	hl
	ld	(hl),d
	inc	hl
	ld	(hl),c
	inc	hl
	ld	(hl),b
	jp	00134$
00133$:
;../_fsadd.c:231: else if (exp1 < 0)
	ld	a,-17 (ix)
	bit	7,a
	jr	Z,00130$
;../_fsadd.c:232: fl1.l = 0;
	ld	hl,#0x000F
	add	hl,sp
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
	jp	00134$
00130$:
;../_fsadd.c:234: fl1.l = PACK (sign ? SIGNBIT : 0 , exp1, mant1);
	ld	hl,#0x000F
	add	hl,sp
	ld	-27 (ix),l
	ld	-26 (ix),h
	xor	a,a
	or	a,-21 (ix)
	jr	Z,00139$
	ld	-25 (ix),#0x00
	ld	-24 (ix),#0x00
	ld	-23 (ix),#0x00
	ld	-22 (ix),#0x80
	jr	00140$
00139$:
	xor	a,a
	ld	-25 (ix),a
	ld	-24 (ix),a
	ld	-23 (ix),a
	ld	-22 (ix),a
00140$:
	ld	e,-18 (ix)
	ld	d,-17 (ix)
	ld	a,-17 (ix)
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
	ld	c,l
	ld	a,-25 (ix)
	or	a,c
	ld	-25 (ix),a
	ld	a,-24 (ix)
	or	a,b
	ld	-24 (ix),a
	ld	a,-23 (ix)
	or	a,e
	ld	-23 (ix),a
	ld	a,-22 (ix)
	or	a,d
	ld	-22 (ix),a
	ld	c,-4 (ix)
	ld	b,-3 (ix)
	ld	e,-2 (ix)
	ld	d,-1 (ix)
	ld	a,c
	or	a,-25 (ix)
	ld	c,a
	ld	a,b
	or	a,-24 (ix)
	ld	b,a
	ld	a,e
	or	a,-23 (ix)
	ld	e,a
	ld	a,d
	or	a,-22 (ix)
	ld	d,a
	ld	l,-27 (ix)
	ld	h,-26 (ix)
	ld	(hl),c
	inc	hl
	ld	(hl),b
	inc	hl
	ld	(hl),e
	inc	hl
	ld	(hl),d
00134$:
;../_fsadd.c:235: return (fl1.f);
	ld	hl,#0x000F
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
00135$:
	ld	sp,ix
	pop	ix
ret
	.area _CODE
	.area _CABS
