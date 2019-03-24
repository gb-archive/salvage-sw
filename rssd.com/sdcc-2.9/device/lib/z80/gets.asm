;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.0 #5416 (Apr  7 2010) (MINGW32)
; This file was generated Sun Apr 11 14:38:29 2010
;--------------------------------------------------------
	.module gets
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _gets
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
;../gets.c:3: char * gets(char *s) {
;	---------------------------------
; Function gets
; ---------------------------------
_gets:
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
;../gets.c:5: unsigned int count=0;
	ld	-2 (ix),#0x00
	ld	-1 (ix),#0x00
;../gets.c:7: while (1) {
00109$:
;../gets.c:8: c=getchar();
	call	_getchar
	ld	e,l
;../gets.c:9: switch(c) {
	ld	a,e
	sub	a,#0x08
	jr	Z,00101$
	ld	a,e
	sub	a,#0x0A
	jr	Z,00105$
	ld	a,e
	sub	a,#0x0D
	jr	Z,00105$
	jp	00106$
;../gets.c:10: case '\b': // backspace
00101$:
;../gets.c:11: if (count) {
	ld	a,-2 (ix)
	or	a,-1 (ix)
	jr	Z,00109$
;../gets.c:12: putchar ('\b');
	ld	a,#0x08
	push	af
	inc	sp
	call	_putchar
	inc	sp
;../gets.c:13: putchar (' ');
	ld	a,#0x20
	push	af
	inc	sp
	call	_putchar
	inc	sp
;../gets.c:14: putchar ('\b');
	ld	a,#0x08
	push	af
	inc	sp
	call	_putchar
	inc	sp
;../gets.c:15: s--;
	ld	d,4 (ix)
	ld	c,5 (ix)
	ld	a,d
	add	a,#0xFF
	ld	4 (ix),a
	ld	a,c
	adc	a,#0xFF
	ld	5 (ix),a
;../gets.c:16: count--;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	dec	hl
	ld	-2 (ix),l
	ld	-1 (ix),h
;../gets.c:18: break;
	jp	00109$
;../gets.c:20: case '\r': // CR or LF
00105$:
;../gets.c:21: putchar('\r');
	ld	a,#0x0D
	push	af
	inc	sp
	call	_putchar
	inc	sp
;../gets.c:22: putchar('\n');
	ld	a,#0x0A
	push	af
	inc	sp
	call	_putchar
	inc	sp
;../gets.c:23: *s=0;
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	a,#0x00
	ld	(bc),a
;../gets.c:24: return s;
	ld	l,c
	ld	h,b
	jr	00111$
;../gets.c:25: default:
00106$:
;../gets.c:26: *s++=c;
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	a,e
	ld	(bc),a
	ld	hl,#0x0001
	add	hl,bc
	ld	4 (ix),l
	ld	5 (ix),h
;../gets.c:27: count++;
	inc	-2 (ix)
	jr	NZ,00121$
	inc	-1 (ix)
00121$:
;../gets.c:28: putchar(c);
	ld	a,e
	push	af
	inc	sp
	call	_putchar
	inc	sp
;../gets.c:30: }
	jp	00109$
00111$:
	ld	sp,ix
	pop	ix
ret
	.area _CODE
	.area _CABS
