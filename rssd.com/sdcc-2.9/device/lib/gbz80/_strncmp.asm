;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.0 #5416 (Apr  7 2010) (MINGW32)
; This file was generated Fri Jun 11 23:46:56 2010
;--------------------------------------------------------
	.module _strncmp
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _strncmp
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
;../_strncmp.c:26: int strncmp (
;	---------------------------------
; Function strncmp
; ---------------------------------
_strncmp:
	lda	sp,-6(sp)
;../_strncmp.c:32: if (!count)
	lda	hl,12(sp)
	ld	a,(hl+)
	or	a,(hl)
	jp	NZ,00114$
;../_strncmp.c:33: return(0);
	ld	de,#0x0000
	jp	00108$
;../_strncmp.c:35: while (--count && *first && *first == *last) {
00114$:
	lda	hl,8(sp)
	ld	a,(hl+)
	ld	e,(hl)
	lda	hl,0(sp)
	ld	(hl+),a
	ld	(hl),e
	lda	hl,10(sp)
	ld	a,(hl+)
	ld	e,(hl)
	lda	hl,4(sp)
	ld	(hl+),a
	ld	(hl),e
	lda	hl,12(sp)
	ld	a,(hl+)
	ld	e,(hl)
	lda	hl,2(sp)
	ld	(hl+),a
	ld	(hl),e
00105$:
	lda	hl,2(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	dec	de
	dec	hl
	ld	(hl),e
	inc	hl
	ld	(hl),d
	dec	hl
	ld	a,(hl+)
	or	a,(hl)
	jp	Z,00107$
	lda	hl,0(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	b,a
	or	a,a
	jp	Z,00107$
	lda	hl,4(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	c,a
	ld	a,b
	sub	c
	jp	NZ,00116$
	jr	00117$
00116$:
	jp	00107$
00117$:
;../_strncmp.c:36: first++;
	lda	hl,0(sp)
	inc	(hl)
	jr	NZ,00118$
	inc	hl
	inc	(hl)
00118$:
;../_strncmp.c:37: last++;
	lda	hl,4(sp)
	inc	(hl)
	jr	NZ,00119$
	inc	hl
	inc	(hl)
00119$:
	jp	00105$
00107$:
;../_strncmp.c:40: return( *first - *last );
	lda	hl,0(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	c,a
	dec	hl
	ld	(hl),c
	ld	a,c
	rla	
	sbc	a,a
	inc	hl
	ld	(hl),a
	lda	hl,4(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	c,a
	rla	
	sbc	a,a
	ld	b,a
	lda	hl,0(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,e
	sub	a,c
	ld	e,a
	ld	a,d
	sbc	a,b
	ld	d,a
00108$:
	lda	sp,6(sp)
ret
	.area _CODE
	.area _CABS
