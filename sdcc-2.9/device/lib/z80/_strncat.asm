;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.0 #5416 (Apr  7 2010) (MINGW32)
; This file was generated Sun Apr 11 14:38:24 2010
;--------------------------------------------------------
	.module _strncat
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _strncat
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
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
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-6
	add	hl,sp
	ld	sp,hl
;../_strncat.c:32: char *start = front;
	ld	a,4 (ix)
	ld	-2 (ix),a
	ld	a,5 (ix)
	ld	-1 (ix),a
;../_strncat.c:34: while (*front++);
	ld	e,-2 (ix)
	ld	d,-1 (ix)
00101$:
	ld	a,(de)
	inc	de
	or	a,a
	jr	NZ,00101$
;../_strncat.c:36: front--;
	ld	a,e
	add	a,#0xFF
	ld	4 (ix),a
	ld	a,d
	adc	a,#0xFF
	ld	5 (ix),a
;../_strncat.c:38: while (count--)
	ld	e,6 (ix)
	ld	d,7 (ix)
	ld	a,4 (ix)
	ld	-4 (ix),a
	ld	a,5 (ix)
	ld	-3 (ix),a
	ld	a,8 (ix)
	ld	-6 (ix),a
	ld	a,9 (ix)
	ld	-5 (ix),a
00106$:
	ld	c,-6 (ix)
	ld	b,-5 (ix)
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	dec	hl
	ld	-6 (ix),l
	ld	-5 (ix),h
	ld	a,c
	or	a,b
	jr	Z,00108$
;../_strncat.c:39: if (!(*front++ = *back++))
	ld	a,(de)
	ld	c,a
	inc	de
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),c
	inc	-4 (ix)
	jr	NZ,00117$
	inc	-3 (ix)
00117$:
	ld	a,-4 (ix)
	ld	4 (ix),a
	ld	a,-3 (ix)
	ld	5 (ix),a
	xor	a,a
	or	a,c
	jr	NZ,00106$
;../_strncat.c:40: return(start);
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	jr	00109$
00108$:
;../_strncat.c:42: *front = '\0';
	ld	c,4 (ix)
	ld	b,5 (ix)
	push	bc
	pop	iy
	ld	(iy),#0x00
;../_strncat.c:43: return(start);
	ld	l,-2 (ix)
	ld	h,-1 (ix)
00109$:
	ld	sp,ix
	pop	ix
ret
	.area _CODE
	.area _CABS
