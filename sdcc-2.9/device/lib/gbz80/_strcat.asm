;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.0 #5416 (Apr  7 2010) (MINGW32)
; This file was generated Fri Jun 11 23:46:55 2010
;--------------------------------------------------------
	.module _strcat
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _strcat
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
;../_strcat.c:26: char * strcat (
;	---------------------------------
; Function strcat
; ---------------------------------
_strcat:
	
	push	af
;../_strcat.c:31: char * cp = dst;
	lda	hl,4(sp)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
;../_strcat.c:33: while( *cp )
00101$:
	ld	a,(bc)
	or	a,a
	jp	Z,00111$
;../_strcat.c:34: cp++;                   /* find end of dst */
	inc	bc
	jp	00101$
;../_strcat.c:36: while( *cp++ = *src++ ) ;       /* Copy src to end of dst */
00111$:
	lda	hl,6(sp)
	ld	a,(hl+)
	ld	e,(hl)
	lda	hl,0(sp)
	ld	(hl+),a
	ld	(hl),e
00104$:
	lda	hl,0(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	dec	hl
	inc	(hl)
	jr	NZ,00115$
	inc	hl
	inc	(hl)
00115$:
	ld	(bc),a
	inc	bc
	or	a,a
	jp	NZ,00104$
;../_strcat.c:38: return( dst );                  /* return dst */
	lda	hl,4(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
00107$:
	lda	sp,2(sp)
ret
	.area _CODE
	.area _CABS
