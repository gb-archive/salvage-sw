;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.0 #5416 (Apr  7 2010) (MINGW32)
; This file was generated Fri Jun 11 23:47:01 2010
;--------------------------------------------------------
	.module _ltoa
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl __ltoa
	.globl __ultoa
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
	lda	sp,-44(sp)
;../_ltoa.c:37: do {
	lda	hl,12(sp)
	ld	a,l
	ld	d,h
	lda	hl,8(sp)
	ld	(hl+),a
	ld	(hl),d
	inc	hl
	inc	hl
	ld	(hl),#0x20
00103$:
;../_ltoa.c:38: unsigned char c = '0' + (value % radix);
	lda	hl,52(sp)
	ld	a,(hl)
	lda	hl,4(sp)
	ld	(hl+),a
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
	dec	hl
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	lda	hl,6(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	lda	hl,52(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	lda	hl,52(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	__modulong_rrx_s
	lda	sp,8(sp)
	push	hl
	lda	hl,2(sp)
	ld	(hl),e
	inc	hl
	ld	(hl),d
	pop	de
	inc	hl
	ld	(hl),e
	inc	hl
	ld	(hl),d
	lda	hl,0(sp)
	ld	c,(hl)
	ld	a,c
	add	a,#0x30
	lda	hl,10(sp)
	ld	(hl),a
;../_ltoa.c:39: if (c > '9') 
	ld	a,#0x39
	sub	a,(hl)
	jp	NC,00102$
;../_ltoa.c:40: c += 'A' - '9' - 1;
	ld	a,(hl)
	add	a,#0x07
	ld	(hl),a
00102$:
;../_ltoa.c:41: buffer[--index] = c;
	lda	hl,11(sp)
	dec	(hl)
	lda	hl,8(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	inc	hl
	inc	hl
	ld	l,(hl)
	ld	h,#0x00
	add	hl,de
	ld	c,l
	ld	b,h
	lda	hl,10(sp)
	ld	a,(hl)
	ld	(bc),a
;../_ltoa.c:42: value /= radix;
	lda	hl,6(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	lda	hl,6(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	lda	hl,52(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	lda	hl,52(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	__divulong_rrx_s
	lda	sp,8(sp)
	push	hl
	lda	hl,2(sp)
	ld	(hl),e
	inc	hl
	ld	(hl),d
	pop	de
	inc	hl
	ld	(hl),e
	inc	hl
	ld	(hl),d
	lda	hl,0(sp)
	ld	d,h
	ld	e,l
	lda	hl,46(sp)
	ld	a,(de)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl),a
;../_ltoa.c:43: } while (value);
	lda	hl,46(sp)
	ld	a,(hl+)
	or	a,(hl)
	inc	hl
	or	a,(hl)
	inc	hl
	or	a,(hl)
	jp	NZ,00103$
;../_ltoa.c:45: do {
	inc	hl
	ld	a,(hl+)
	ld	e,(hl)
	lda	hl,0(sp)
	ld	(hl+),a
	ld	(hl),e
00106$:
;../_ltoa.c:46: *string++ = buffer[index];
	lda	hl,8(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	inc	hl
	inc	hl
	ld	l,(hl)
	ld	h,#0x00
	add	hl,de
	ld	c,l
	ld	b,h
	ld	a,(bc)
	lda	hl,0(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	(de),a
	dec	hl
	inc	(hl)
	jr	NZ,00117$
	inc	hl
	inc	(hl)
00117$:
;../_ltoa.c:47: } while ( ++index != NUMBER_OF_DIGITS );
	lda	hl,11(sp)
	inc	(hl)
	ld	a,(hl)
	sub	a,#0x20
	jp	NZ,00118$
	jr	00119$
00118$:
	jp	00106$
00119$:
;../_ltoa.c:49: *string = 0;  /* string terminator */
	lda	hl,0(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,#0x00
	ld	(de),a
00109$:
	lda	sp,44(sp)
ret
;../_ltoa.c:52: void _ltoa(long value, char* string, unsigned char radix)
;	---------------------------------
; Function _ltoa
; ---------------------------------
__ltoa:
	
;../_ltoa.c:54: if (value < 0 && radix == 10) {
	lda	hl,5(sp)
	ld	a,(hl)
	bit	7,a
	jp	Z,00102$
	lda	hl,8(sp)
	ld	a,(hl)
	sub	a,#0x0A
	jp	NZ,00108$
	jr	00109$
00108$:
	jp	00102$
00109$:
;../_ltoa.c:55: *string++ = '-';
	lda	hl,6(sp)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	a,#0x2D
	ld	(bc),a
	ld	hl,#0x0001
	add	hl,bc
	ld	a,l
	ld	d,h
	lda	hl,6(sp)
	ld	(hl+),a
	ld	(hl),d
;../_ltoa.c:56: value = -value;
	ld	de,#0x0000
	ld	a,e
	lda	hl,2(sp)
	sub	a,(hl)
	ld	e,a
	ld	a,d
	inc	hl
	sbc	a,(hl)
	push	af
	ld	(hl-),a
	ld	(hl),e
	ld	de,#0x0000
	inc	hl
	inc	hl
	pop	af
	ld	a,e
	sbc	a,(hl)
	ld	e,a
	ld	a,d
	inc	hl
	sbc	a,(hl)
	ld	(hl-),a
	ld	(hl),e
00102$:
;../_ltoa.c:58: _ultoa(value, string, radix);
	lda	hl,8(sp)
	ld	a,(hl)
	push	af
	inc	sp
	dec	hl
	dec	hl
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	lda	hl,7(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	lda	hl,7(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	__ultoa
	lda	sp,7(sp)
00104$:
	
ret
	.area _CODE
	.area _CABS
