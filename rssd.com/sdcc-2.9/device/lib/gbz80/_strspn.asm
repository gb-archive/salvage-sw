;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.0 #5416 (Apr  7 2010) (MINGW32)
; This file was generated Fri Jun 11 23:46:57 2010
;--------------------------------------------------------
	.module _strspn
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _strspn
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
;../_strspn.c:26: int strspn (
;	---------------------------------
; Function strspn
; ---------------------------------
_strspn:
	
	push	af
	push	af
;../_strspn.c:34: while (ch = *string) {
	lda	hl,2(sp)
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
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
	ld	c,a
	ld	b,c
	xor	a,a
	or	a,c
	jp	Z,00106$
;../_strspn.c:35: if ( strchr(control,ch) )
	push	bc
	inc	sp
	lda	hl,9(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	_strchr
	lda	sp,3(sp)
	ld	b,d
	ld	c,e
	ld	a,c
	or	a,b
	jp	Z,00106$
;../_strspn.c:36: count++ ;
	lda	hl,2(sp)
	inc	(hl)
	jr	NZ,00113$
	inc	hl
	inc	(hl)
00113$:
;../_strspn.c:39: string++ ;
	lda	hl,0(sp)
	inc	(hl)
	jr	NZ,00114$
	inc	hl
	inc	(hl)
00114$:
	jp	00104$
00106$:
;../_strspn.c:42: return count ;
	lda	hl,2(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
00107$:
	lda	sp,4(sp)
ret
	.area _CODE
	.area _CABS
