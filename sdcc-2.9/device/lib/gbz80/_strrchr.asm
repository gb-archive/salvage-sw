;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.0 #5416 (Apr  7 2010) (MINGW32)
; This file was generated Fri Jun 11 23:46:56 2010
;--------------------------------------------------------
	.module _strrchr
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _strrchr
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
;../_strrchr.c:26: char * strrchr (
;	---------------------------------
; Function strrchr
; ---------------------------------
_strrchr:
	
	push	af
	push	af
;../_strrchr.c:31: char * start = string;
	lda	hl,6(sp)
	ld	a,(hl+)
	ld	e,(hl)
	lda	hl,2(sp)
	ld	(hl+),a
	ld	(hl),e
;../_strrchr.c:33: while (*string++)                       /* find end of string */
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
00101$:
	ld	a,(bc)
	inc	bc
	or	a,a
	jp	NZ,00101$
;../_strrchr.c:36: while (--string != start && *string != ch)
	lda	hl,0(sp)
	ld	(hl),c
	inc	hl
	ld	(hl),b
00105$:
	lda	hl,0(sp)
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
	inc	hl
	sub	(hl)
	jp	NZ,00118$
	dec	hl
	ld	a,(hl+)
	inc	hl
	sub	(hl)
	jp	Z,00107$
00118$:
	lda	hl,0(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	c,a
	lda	hl,8(sp)
	sub	(hl)
	jp	NZ,00119$
	jr	00120$
00119$:
	jp	00105$
00120$:
00107$:
;../_strrchr.c:39: if (*string == ch)                /* char found ? */
	lda	hl,0(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	c,a
	lda	hl,8(sp)
	sub	(hl)
	jp	NZ,00121$
	jr	00122$
00121$:
	jp	00109$
00122$:
;../_strrchr.c:40: return( (char *)string );
	lda	hl,0(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	jp	00110$
00109$:
;../_strrchr.c:42: return (NULL) ;
	ld	de,#0x0000
00110$:
	lda	sp,4(sp)
ret
	.area _CODE
	.area _CABS
