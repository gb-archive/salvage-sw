;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.0 #5416 (Apr  7 2010) (MINGW32)
; This file was generated Sun Apr 11 14:38:24 2010
;--------------------------------------------------------
	.module _strncpy
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _strncpy
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
;../_strncpy.c:26: char *strncpy (
;	---------------------------------
; Function strncpy
; ---------------------------------
_strncpy:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-6
	add	hl,sp
	ld	sp,hl
;../_strncpy.c:31: register char * d1 =  d;
	ld	a,4 (ix)
	ld	-2 (ix),a
	ld	a,5 (ix)
	ld	-1 (ix),a
;../_strncpy.c:33: while ( n && *s )
	ld	e,8 (ix)
	ld	d,9 (ix)
	ld	a,6 (ix)
	ld	-4 (ix),a
	ld	a,7 (ix)
	ld	-3 (ix),a
	ld	a,-2 (ix)
	ld	-6 (ix),a
	ld	a,-1 (ix)
	ld	-5 (ix),a
00102$:
	ld	a,e
	or	a,d
	jr	Z,00114$
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	c,(hl)
	xor	a,a
	or	a,c
	jr	Z,00114$
;../_strncpy.c:35: n-- ;
	dec	de
;../_strncpy.c:36: *d++ = *s++ ;
	ld	a,c
	inc	-4 (ix)
	jr	NZ,00117$
	inc	-3 (ix)
00117$:
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	(hl),a
	inc	-6 (ix)
	jr	NZ,00118$
	inc	-5 (ix)
00118$:
	jr	00102$
;../_strncpy.c:38: while ( n-- )
00114$:
00105$:
	ld	c,e
	ld	b,d
	dec	de
	ld	a,c
	or	a,b
	jr	Z,00107$
;../_strncpy.c:40: *d++ = '\0' ;
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	(hl),#0x00
	inc	-6 (ix)
	jr	NZ,00119$
	inc	-5 (ix)
00119$:
	jr	00105$
00107$:
;../_strncpy.c:42: return d1;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	sp,ix
	pop	ix
ret
	.area _CODE
	.area _CABS
