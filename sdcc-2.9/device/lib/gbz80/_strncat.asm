;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.0 #5416 (Apr  7 2010) (MINGW32)
; This file was generated Fri Jun 11 23:46:55 2010
;--------------------------------------------------------
	.module _strncat
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _strncat
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
;../_strncat.c:26: char * strncat (
;	---------------------------------
; Function strncat
; ---------------------------------
_strncat:
	lda	sp,-8(sp)
;../_strncat.c:32: char *start = front;
	lda	hl,10(sp)
	ld	a,(hl+)
	ld	e,(hl)
	lda	hl,6(sp)
	ld	(hl+),a
	ld	(hl),e
;../_strncat.c:34: while (*front++);
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
00101$:
	ld	a,(bc)
	inc	bc
	or	a,a
	jp	NZ,00101$
;../_strncat.c:36: front--;
	ld	de,#0x0001
	ld	a,c
	sub	a,e
	ld	e,a
	ld	a,b
	sbc	a,d
	lda	hl,11(sp)
	ld	(hl-),a
	ld	(hl),e
;../_strncat.c:38: while (count--)
	inc	hl
	inc	hl
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
	lda	hl,14(sp)
	ld	a,(hl+)
	ld	e,(hl)
	lda	hl,2(sp)
	ld	(hl+),a
	ld	(hl),e
00106$:
	lda	hl,2(sp)
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
	jp	Z,00108$
;../_strncat.c:39: if (!(*front++ = *back++))
	lda	hl,0(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	c,a
	dec	hl
	inc	(hl)
	jr	NZ,00117$
	inc	hl
	inc	(hl)
00117$:
	lda	hl,4(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,c
	ld	(de),a
	dec	hl
	inc	(hl)
	jr	NZ,00118$
	inc	hl
	inc	(hl)
00118$:
	lda	hl,4(sp)
	ld	a,(hl+)
	ld	e,(hl)
	lda	hl,10(sp)
	ld	(hl+),a
	ld	(hl),e
	xor	a,a
	or	a,c
	jp	NZ,00106$
;../_strncat.c:40: return(start);
	lda	hl,6(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	jp	00109$
00108$:
;../_strncat.c:42: *front = '\0';
	lda	hl,10(sp)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	a,#0x00
	ld	(bc),a
;../_strncat.c:43: return(start);
	lda	hl,6(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
00109$:
	lda	sp,8(sp)
ret
	.area _CODE
	.area _CABS
