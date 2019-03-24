;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.0 #5416 (Apr  7 2010) (MINGW32)
; This file was generated Fri Jun 11 23:47:31 2010
;--------------------------------------------------------
	.module _strcpy
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _strcpy
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
;../_strcpy.c:29: char * strcpy (
;	---------------------------------
; Function strcpy
; ---------------------------------
_strcpy:
	
	push	af
	push	af
;../_strcpy.c:34: register char * to = d;
	lda	hl,6(sp)
	ld	a,(hl+)
	ld	e,(hl)
	lda	hl,2(sp)
	ld	(hl+),a
	ld	(hl),e
;../_strcpy.c:35: register char * from = s;
	lda	hl,8(sp)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
;../_strcpy.c:37: while (*to++ = *from++) ;
	lda	hl,2(sp)
	ld	a,(hl+)
	ld	e,(hl)
	lda	hl,0(sp)
	ld	(hl+),a
	ld	(hl),e
00101$:
	ld	a,(bc)
	inc	bc
	lda	hl,0(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	(de),a
	dec	hl
	inc	(hl)
	jr	NZ,00109$
	inc	hl
	inc	(hl)
00109$:
	or	a,a
	jp	NZ,00101$
;../_strcpy.c:39: return d;
	lda	hl,6(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
00104$:
	lda	sp,4(sp)
ret
	.area _CODE
	.area _CABS
