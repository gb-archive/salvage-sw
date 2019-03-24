;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.0 #5416 (Apr  7 2010) (MINGW32)
; This file was generated Fri Jun 11 23:47:30 2010
;--------------------------------------------------------
	.module _memset
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _memset
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
;../_memset.c:31: void * memset (
;	---------------------------------
; Function memset
; ---------------------------------
_memset:
	
	push	af
	push	af
;../_memset.c:36: register unsigned char * ret = buf;
;../_memset.c:38: while (count--) {
	lda	hl,6(sp)
	ld	a,(hl+)
	ld	e,(hl)
	lda	hl,2(sp)
	ld	(hl+),a
	ld	(hl),e
	lda	hl,9(sp)
	ld	a,(hl+)
	ld	e,(hl)
	lda	hl,0(sp)
	ld	(hl+),a
	ld	(hl),e
00101$:
	lda	hl,0(sp)
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
	jp	Z,00103$
;../_memset.c:39: *(unsigned char *) ret = ch;
	inc	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	lda	hl,8(sp)
	ld	a,(hl)
	ld	(de),a
;../_memset.c:40: ret = ((unsigned char *) ret) + 1;
	lda	hl,2(sp)
	inc	(hl)
	jr	NZ,00109$
	inc	hl
	inc	(hl)
00109$:
	jp	00101$
00103$:
;../_memset.c:43: return buf ;
	lda	hl,6(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
00104$:
	lda	sp,4(sp)
ret
	.area _CODE
	.area _CABS
