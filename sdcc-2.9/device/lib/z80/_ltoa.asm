;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.0 #5416 (Apr  7 2010) (MINGW32)
; This file was generated Sun Apr 11 14:38:30 2010
;--------------------------------------------------------
	.module _ltoa
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl __ltoa
	.globl __ultoa
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
;../_ltoa.c:32: void _ultoa(unsigned long value, char* string, unsigned char radix)
;	---------------------------------
; Function _ultoa
; ---------------------------------
__ultoa:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-39
	add	hl,sp
	ld	sp,hl
;../_ltoa.c:37: do {
	ld	hl,#0x0007
	add	hl,sp
	ld	-39 (ix),l
	ld	-38 (ix),h
	ld	-33 (ix),#0x20
00103$:
;../_ltoa.c:38: unsigned char c = '0' + (value % radix);
	ld	a,10 (ix)
	ld	-37 (ix),a
	ld	-36 (ix),#0x00
	ld	-35 (ix),#0x00
	ld	-34 (ix),#0x00
	ld	l,-35 (ix)
	ld	h,-34 (ix)
	push	hl
	ld	l,-37 (ix)
	ld	h,-36 (ix)
	push	hl
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	call	__modulong_rrx_s
	pop	af
	pop	af
	pop	af
	pop	af
	ld	a,l
	add	a,#0x30
	ld	c,a
;../_ltoa.c:39: if (c > '9') 
	ld	a,#0x39
	sub	a,c
	jr	NC,00102$
;../_ltoa.c:40: c += 'A' - '9' - 1;
	ld	a,c
	add	a,#0x07
	ld	c,a
00102$:
;../_ltoa.c:41: buffer[--index] = c;
	dec	-33 (ix)
	ld	a,-39 (ix)
	add	a,-33 (ix)
	ld	e,a
	ld	a,-38 (ix)
	adc	a,#0x00
	ld	d,a
	ld	a,c
	ld	(de),a
;../_ltoa.c:42: value /= radix;
	ld	l,-35 (ix)
	ld	h,-34 (ix)
	push	hl
	ld	l,-37 (ix)
	ld	h,-36 (ix)
	push	hl
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	call	__divulong_rrx_s
	pop	af
	pop	af
	pop	af
	pop	af
	ld	b,h
	ld	4 (ix),l
	ld	5 (ix),b
	ld	6 (ix),e
	ld	7 (ix),d
;../_ltoa.c:43: } while (value);
	ld	a,4 (ix)
	or	a,5 (ix)
	or	a,6 (ix)
	or	a,7 (ix)
	jp	NZ,00103$
;../_ltoa.c:45: do {
	ld	c,8 (ix)
	ld	b,9 (ix)
00106$:
;../_ltoa.c:46: *string++ = buffer[index];
	ld	a,-39 (ix)
	add	a,-33 (ix)
	ld	e,a
	ld	a,-38 (ix)
	adc	a,#0x00
	ld	d,a
	ld	a,(de)
	ld	(bc),a
	inc	bc
;../_ltoa.c:47: } while ( ++index != NUMBER_OF_DIGITS );
	inc	-33 (ix)
	ld	a,-33 (ix)
	sub	a,#0x20
	jr	NZ,00106$
;../_ltoa.c:49: *string = 0;  /* string terminator */
	ld	a,#0x00
	ld	(bc),a
	ld	sp,ix
	pop	ix
ret
;../_ltoa.c:52: void _ltoa(long value, char* string, unsigned char radix)
;	---------------------------------
; Function _ltoa
; ---------------------------------
__ltoa:
	push	ix
	ld	ix,#0
	add	ix,sp
;../_ltoa.c:54: if (value < 0 && radix == 10) {
	bit	7,7 (ix)
	jr	Z,00102$
	ld	a,10 (ix)
	sub	a,#0x0A
	jr	NZ,00102$
;../_ltoa.c:55: *string++ = '-';
	ld	c,8 (ix)
	ld	b,9 (ix)
	ld	a,#0x2D
	ld	(bc),a
	ld	hl,#0x0001
	add	hl,bc
	ld	8 (ix),l
	ld	9 (ix),h
;../_ltoa.c:56: value = -value;
	xor	a,a
	sbc	a,4 (ix)
	ld	4 (ix),a
	ld	a,#0x00
	sbc	a,5 (ix)
	ld	5 (ix),a
	ld	a,#0x00
	sbc	a,6 (ix)
	ld	6 (ix),a
	ld	a,#0x00
	sbc	a,7 (ix)
	ld	7 (ix),a
00102$:
;../_ltoa.c:58: _ultoa(value, string, radix);
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	e,6 (ix)
	ld	d,7 (ix)
	ld	a,10 (ix)
	push	af
	inc	sp
	ld	l,8 (ix)
	ld	h,9 (ix)
	push	hl
	push	de
	push	bc
	call	__ultoa
	pop	af
	pop	af
	pop	af
	inc	sp
	pop	ix
ret
	.area _CODE
	.area _CABS
