;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.0 #5416 (Apr  7 2010) (MINGW32)
; This file was generated Fri Jun 11 23:46:55 2010
;--------------------------------------------------------
	.module _strchr
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _strchr
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
;../_strchr.c:26: char * strchr (
;	---------------------------------
; Function strchr
; ---------------------------------
_strchr:
	
	push	af
;../_strchr.c:31: while (*string && *string != ch)
	lda	hl,4(sp)
	ld	a,(hl+)
	ld	e,(hl)
	lda	hl,0(sp)
	ld	(hl+),a
	ld	(hl),e
00102$:
	lda	hl,0(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	c,a
	or	a,a
	jp	Z,00104$
	ld	a,c
	lda	hl,6(sp)
	sub	(hl)
	jp	Z,00104$
00114$:
;../_strchr.c:32: string++;
	lda	hl,0(sp)
	inc	(hl)
	jr	NZ,00115$
	inc	hl
	inc	(hl)
00115$:
	jp	00102$
00104$:
;../_strchr.c:34: if (*string == ch)
	lda	hl,0(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	c,a
	lda	hl,6(sp)
	sub	(hl)
	jp	NZ,00116$
	jr	00117$
00116$:
	jp	00106$
00117$:
;../_strchr.c:35: return(string);
	lda	hl,0(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	jp	00107$
00106$:
;../_strchr.c:36: return ( NULL );
	ld	de,#0x0000
00107$:
	lda	sp,2(sp)
ret
	.area _CODE
	.area _CABS
