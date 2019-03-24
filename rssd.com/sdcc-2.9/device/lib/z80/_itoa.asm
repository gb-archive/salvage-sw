;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.0 #5416 (Apr  7 2010) (MINGW32)
; This file was generated Sun Apr 11 14:38:30 2010
;--------------------------------------------------------
	.module _itoa
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl __itoa
	.globl __uitoa
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
;../_itoa.c:16: void _uitoa(unsigned int value, char* string, unsigned char radix)
;	---------------------------------
; Function _uitoa
; ---------------------------------
__uitoa:
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
;../_itoa.c:21: do {
	ld	-1 (ix),#0x00
00103$:
;../_itoa.c:22: string[index] = '0' + (value % radix);
	ld	a,6 (ix)
	add	a,-1 (ix)
	ld	e,a
	ld	a,7 (ix)
	adc	a,#0x00
	ld	d,a
	ld	a,8 (ix)
	ld	-4 (ix),a
	ld	-3 (ix),#0x00
	push	de
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	push	hl
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	call	__moduint_rrx_s
	pop	af
	pop	af
	ld	c,l
	pop	de
	ld	a,c
	add	a,#0x30
	ld	(de),a
;../_itoa.c:23: if (string[index] > '9')
	ld	a,(de)
	ld	c,a
	ld	a,#0x39
	sub	a,c
	jp	P,00102$
;../_itoa.c:24: string[index] += 'A' - '9' - 1;
	ld	a,(de)
	add	a,#0x07
	ld	(de),a
00102$:
;../_itoa.c:25: value /= radix;
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	push	hl
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	call	__divuint_rrx_s
	pop	af
	pop	af
	ld	b,h
	ld	4 (ix),l
	ld	5 (ix),b
;../_itoa.c:26: ++index;
	inc	-1 (ix)
;../_itoa.c:27: } while (value != 0);
	ld	a,4 (ix)
	or	a,5 (ix)
	jp	NZ,00103$
;../_itoa.c:30: string[index--] = '\0';
	ld	a,-1 (ix)
	dec	a
	ld	c,a
	ld	a,6 (ix)
	add	a,-1 (ix)
	ld	e,a
	ld	a,7 (ix)
	adc	a,#0x00
	ld	d,a
	ld	a,#0x00
	ld	(de),a
;../_itoa.c:33: while (index > i) {
	ld	-2 (ix),#0x00
00106$:
	ld	a,-2 (ix)
	sub	a,c
	jp	P,00109$
;../_itoa.c:34: char tmp = string[i];
	ld	a,6 (ix)
	add	a,-2 (ix)
	ld	-4 (ix),a
	ld	a,7 (ix)
	adc	a,#0x00
	ld	-3 (ix),a
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	b,(hl)
	ld	d,b
;../_itoa.c:35: string[i] = string[index];
	ld	a,6 (ix)
	add	a,c
	ld	b,a
	ld	a,7 (ix)
	adc	a,#0x00
	ld	e,a
	ld	l,b
	ld	h,a
	ld	a,(hl)
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),a
;../_itoa.c:36: string[index] = tmp;
	ld	l,b
	ld	h,e
	ld	(hl),d
;../_itoa.c:37: ++i;
	inc	-2 (ix)
;../_itoa.c:38: --index;
	dec	c
	jr	00106$
00109$:
	ld	sp,ix
	pop	ix
ret
;../_itoa.c:42: void _itoa(int value, char* string, unsigned char radix)
;	---------------------------------
; Function _itoa
; ---------------------------------
__itoa:
	push	ix
	ld	ix,#0
	add	ix,sp
;../_itoa.c:44: if (value < 0 && radix == 10) {
	bit	7,5 (ix)
	jr	Z,00102$
	ld	a,8 (ix)
	sub	a,#0x0A
	jr	NZ,00102$
;../_itoa.c:45: *string++ = '-';
	ld	c,6 (ix)
	ld	b,7 (ix)
	ld	a,#0x2D
	ld	(bc),a
	ld	hl,#0x0001
	add	hl,bc
	ld	6 (ix),l
	ld	7 (ix),h
;../_itoa.c:46: value = -value;
	xor	a,a
	sbc	a,4 (ix)
	ld	4 (ix),a
	ld	a,#0x00
	sbc	a,5 (ix)
	ld	5 (ix),a
00102$:
;../_itoa.c:48: _uitoa(value, string, radix);
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	a,8 (ix)
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	push	bc
	call	__uitoa
	pop	af
	pop	af
	inc	sp
	pop	ix
ret
	.area _CODE
	.area _CABS
