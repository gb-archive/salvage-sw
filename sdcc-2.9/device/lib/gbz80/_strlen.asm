;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.0 #5416 (Apr  7 2010) (MINGW32)
; This file was generated Fri Jun 11 23:47:01 2010
;--------------------------------------------------------
	.module _strlen
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _strlen
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
;../_strlen.c:29: int strlen ( char * str )
;	---------------------------------
; Function strlen
; ---------------------------------
_strlen:
	
	push	af
;../_strlen.c:33: while (*str++)
	lda	hl,0(sp)
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
	lda	hl,4(sp)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
00101$:
	ld	a,(bc)
	inc	bc
	or	a,a
	jp	Z,00103$
;../_strlen.c:34: i++ ;
	lda	hl,0(sp)
	inc	(hl)
	jr	NZ,00109$
	inc	hl
	inc	(hl)
00109$:
	jp	00101$
00103$:
;../_strlen.c:36: return i;
	lda	hl,0(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
00104$:
	lda	sp,2(sp)
ret
	.area _CODE
	.area _CABS
