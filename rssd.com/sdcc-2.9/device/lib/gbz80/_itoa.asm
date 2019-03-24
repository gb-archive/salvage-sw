;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.0 #5416 (Apr  7 2010) (MINGW32)
; This file was generated Fri Jun 11 23:47:00 2010
;--------------------------------------------------------
	.module _itoa
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl __itoa
	.globl __uitoa
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
	lda	sp,-7(sp)
;../_itoa.c:21: do {
	lda	hl,6(sp)
	ld	(hl),#0x00
00103$:
;../_itoa.c:22: string[index] = '0' + (value % radix);
	lda	hl,11(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	lda	hl,6(sp)
	ld	l,(hl)
	ld	h,#0x00
	add	hl,de
	ld	a,l
	ld	d,h
	lda	hl,0(sp)
	ld	(hl+),a
	ld	(hl),d
	lda	hl,13(sp)
	ld	a,(hl)
	lda	hl,2(sp)
	ld	(hl+),a
	ld	(hl),#0x00
	dec	hl
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	lda	hl,11(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	__moduint_rrx_s
	lda	sp,4(sp)
	ld	b,d
	ld	c,e
	ld	a,c
	add	a,#0x30
	lda	hl,0(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	(de),a
;../_itoa.c:23: if (string[index] > '9')
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	c,a
	ld	a,#0x39
	sub	a,c
	rlca
	jp	NC,00102$
;../_itoa.c:24: string[index] += 'A' - '9' - 1;
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	c,a
	add	a,#0x07
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	(de),a
00102$:
;../_itoa.c:25: value /= radix;
	lda	hl,2(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	lda	hl,11(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	__divuint_rrx_s
	lda	sp,4(sp)
	ld	b,d
	ld	c,e
	lda	hl,9(sp)
	ld	(hl),c
	inc	hl
	ld	(hl),b
;../_itoa.c:26: ++index;
	lda	hl,6(sp)
	inc	(hl)
;../_itoa.c:27: } while (value != 0);
	lda	hl,9(sp)
	ld	a,(hl+)
	or	a,(hl)
	jp	NZ,00103$
;../_itoa.c:30: string[index--] = '\0';
	lda	hl,6(sp)
	ld	a,(hl)
	dec	a
	lda	hl,0(sp)
	ld	(hl),a
	lda	hl,11(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	lda	hl,6(sp)
	ld	l,(hl)
	ld	h,#0x00
	add	hl,de
	ld	c,l
	ld	b,h
	ld	a,#0x00
	ld	(bc),a
;../_itoa.c:33: while (index > i) {
	lda	hl,5(sp)
	ld	(hl),#0x00
	lda	hl,0(sp)
	ld	a,(hl)
	ld	(hl),a
00106$:
	lda	hl,5(sp)
	ld	a,(hl)
	lda	hl,0(sp)
	sub	a,(hl)
	rlca
	jp	NC,00109$
;../_itoa.c:34: char tmp = string[i];
	lda	hl,11(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	lda	hl,5(sp)
	ld	l,(hl)
	ld	h,#0x00
	add	hl,de
	ld	a,l
	ld	d,h
	lda	hl,2(sp)
	ld	(hl+),a
	ld	(hl),d
	ld	e,a
	ld	a,(de)
	ld	c,a
	inc	hl
	ld	(hl),c
;../_itoa.c:35: string[i] = string[index];
	lda	hl,11(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	lda	hl,0(sp)
	ld	l,(hl)
	ld	h,#0x00
	add	hl,de
	ld	c,l
	ld	b,h
	ld	a,(bc)
	lda	hl,2(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	(de),a
;../_itoa.c:36: string[index] = tmp;
	inc	hl
	ld	a,(hl)
	ld	(bc),a
;../_itoa.c:37: ++i;
	inc	hl
	inc	(hl)
;../_itoa.c:38: --index;
	lda	hl,0(sp)
	dec	(hl)
	jp	00106$
00109$:
	lda	sp,7(sp)
ret
;../_itoa.c:42: void _itoa(int value, char* string, unsigned char radix)
;	---------------------------------
; Function _itoa
; ---------------------------------
__itoa:
	
;../_itoa.c:44: if (value < 0 && radix == 10) {
	lda	hl,3(sp)
	ld	a,(hl)
	bit	7,a
	jp	Z,00102$
	lda	hl,6(sp)
	ld	a,(hl)
	sub	a,#0x0A
	jp	NZ,00108$
	jr	00109$
00108$:
	jp	00102$
00109$:
;../_itoa.c:45: *string++ = '-';
	lda	hl,4(sp)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	a,#0x2D
	ld	(bc),a
	ld	hl,#0x0001
	add	hl,bc
	ld	a,l
	ld	d,h
	lda	hl,4(sp)
	ld	(hl+),a
	ld	(hl),d
;../_itoa.c:46: value = -value;
	xor	a,a
	lda	hl,2(sp)
	ld	a,#0x00
	sbc	a,(hl)
	ld	(hl+),a
	ld	a,#0x00
	sbc	a,(hl)
	ld	(hl),a
00102$:
;../_itoa.c:48: _uitoa(value, string, radix);
	lda	hl,2(sp)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	lda	hl,6(sp)
	ld	a,(hl)
	push	af
	inc	sp
	dec	hl
	dec	hl
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	push	bc
	call	__uitoa
	lda	sp,5(sp)
00104$:
	
ret
	.area _CODE
	.area _CABS
