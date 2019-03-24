;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.0 #5416 (Apr  7 2010) (MINGW32)
; This file was generated Sun Apr 11 14:38:28 2010
;--------------------------------------------------------
	.module puts
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _puts
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
;../puts.c:27: int puts (char *s)
;	---------------------------------
; Function puts
; ---------------------------------
_puts:
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
;../puts.c:30: while (*s){
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	-2 (ix),#0x00
	ld	-1 (ix),#0x00
00101$:
	ld	a,(bc)
	ld	e,a
	or	a,a
	jr	Z,00103$
;../puts.c:31: putchar(*s++);
	inc	bc
	push	bc
	ld	a,e
	push	af
	inc	sp
	call	_putchar
	inc	sp
	pop	bc
;../puts.c:32: i++;
	inc	-2 (ix)
	jr	NZ,00109$
	inc	-1 (ix)
00109$:
	jr	00101$
00103$:
;../puts.c:34: putchar('\n');
	ld	a,#0x0A
	push	af
	inc	sp
	call	_putchar
	inc	sp
;../puts.c:35: return i+1;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	inc	hl
	ld	sp,ix
	pop	ix
ret
	.area _CODE
	.area _CABS
