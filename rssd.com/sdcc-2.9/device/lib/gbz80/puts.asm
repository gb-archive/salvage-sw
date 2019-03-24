;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.0 #5416 (Apr  7 2010) (MINGW32)
; This file was generated Fri Jun 11 23:46:59 2010
;--------------------------------------------------------
	.module puts
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _puts
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
	
	push	af
	push	af
;../puts.c:30: while (*s){
	lda	hl,6(sp)
	ld	a,(hl+)
	ld	e,(hl)
	lda	hl,0(sp)
	ld	(hl+),a
	ld	(hl),e
	inc	hl
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
00101$:
	lda	hl,0(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	c,a
	or	a,a
	jp	Z,00103$
;../puts.c:31: putchar(*s++);
	dec	hl
	inc	(hl)
	jr	NZ,00109$
	inc	hl
	inc	(hl)
00109$:
	ld	a,c
	push	af
	inc	sp
	call	_putchar
	lda	sp,1(sp)
;../puts.c:32: i++;
	lda	hl,2(sp)
	inc	(hl)
	jr	NZ,00110$
	inc	hl
	inc	(hl)
00110$:
	jp	00101$
00103$:
;../puts.c:34: putchar('\n');
	ld	a,#0x0A
	push	af
	inc	sp
	call	_putchar
	lda	sp,1(sp)
;../puts.c:35: return i+1;
	lda	hl,2(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	inc	de
00104$:
	lda	sp,4(sp)
ret
	.area _CODE
	.area _CABS
