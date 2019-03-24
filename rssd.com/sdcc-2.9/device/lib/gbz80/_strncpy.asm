;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.0 #5416 (Apr  7 2010) (MINGW32)
; This file was generated Fri Jun 11 23:46:56 2010
;--------------------------------------------------------
	.module _strncpy
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _strncpy
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
;../_strncpy.c:26: char *strncpy (
;	---------------------------------
; Function strncpy
; ---------------------------------
_strncpy:
	lda	sp,-7(sp)
;../_strncpy.c:31: register char * d1 =  d;
	lda	hl,9(sp)
	ld	a,(hl+)
	ld	e,(hl)
	lda	hl,5(sp)
	ld	(hl+),a
	ld	(hl),e
;../_strncpy.c:33: while ( n && *s )
	lda	hl,13(sp)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	lda	hl,11(sp)
	ld	a,(hl+)
	ld	e,(hl)
	lda	hl,3(sp)
	ld	(hl+),a
	ld	(hl),e
	inc	hl
	ld	a,(hl+)
	ld	e,(hl)
	lda	hl,1(sp)
	ld	(hl+),a
	ld	(hl),e
00102$:
	ld	a,c
	or	a,b
	jp	Z,00114$
	lda	hl,3(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	lda	hl,0(sp)
	ld	(hl),a
	or	a,a
	jp	Z,00114$
;../_strncpy.c:35: n-- ;
	dec	bc
;../_strncpy.c:36: *d++ = *s++ ;
	ld	a,(hl)
	lda	hl,3(sp)
	inc	(hl)
	jr	NZ,00117$
	inc	hl
	inc	(hl)
00117$:
	lda	hl,1(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	(de),a
	dec	hl
	inc	(hl)
	jr	NZ,00118$
	inc	hl
	inc	(hl)
00118$:
	jp	00102$
;../_strncpy.c:38: while ( n-- )
00114$:
	lda	hl,3(sp)
	ld	(hl),c
	inc	hl
	ld	(hl),b
00105$:
	lda	hl,3(sp)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	dec	de
	dec	hl
	ld	(hl),e
	inc	hl
	ld	(hl),d
	ld	a,c
	or	a,b
	jp	Z,00107$
;../_strncpy.c:40: *d++ = '\0' ;
	lda	hl,1(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,#0x00
	ld	(de),a
	dec	hl
	inc	(hl)
	jr	NZ,00119$
	inc	hl
	inc	(hl)
00119$:
	jp	00105$
00107$:
;../_strncpy.c:42: return d1;
	lda	hl,5(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
00108$:
	lda	sp,7(sp)
ret
	.area _CODE
	.area _CABS
