;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.0 #5416 (Apr  7 2010) (MINGW32)
; This file was generated Sun Apr 11 14:38:25 2010
;--------------------------------------------------------
	.module _strrchr
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _strrchr
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
;../_strrchr.c:26: char * strrchr (
;	---------------------------------
; Function strrchr
; ---------------------------------
_strrchr:
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
;../_strrchr.c:31: char * start = string;
	ld	a,4 (ix)
	ld	-2 (ix),a
	ld	a,5 (ix)
	ld	-1 (ix),a
;../_strrchr.c:33: while (*string++)                       /* find end of string */
	ld	e,-2 (ix)
	ld	d,-1 (ix)
00101$:
	ld	a,(de)
	inc	de
	or	a,a
	jr	NZ,00101$
;../_strrchr.c:36: while (--string != start && *string != ch)
00105$:
	dec	de
	ld	a,e
	sub	-2 (ix)
	jr	NZ,00118$
	ld	a,d
	sub	-1 (ix)
	jr	Z,00107$
00118$:
	ld	a,(de)
	sub	6 (ix)
	jr	NZ,00105$
00107$:
;../_strrchr.c:39: if (*string == ch)                /* char found ? */
	ld	a,(de)
	ld	c,a
	sub	6 (ix)
	jr	NZ,00109$
;../_strrchr.c:40: return( (char *)string );
	ld	l,e
	ld	h,d
	jr	00110$
00109$:
;../_strrchr.c:42: return (NULL) ;
	ld	hl,#0x0000
00110$:
	ld	sp,ix
	pop	ix
ret
	.area _CODE
	.area _CABS
