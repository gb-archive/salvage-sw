;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.0 #5416 (Apr  7 2010) (MINGW32)
; This file was generated Sun Apr 11 14:38:25 2010
;--------------------------------------------------------
	.module _strstr
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _strstr
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
;../_strstr.c:26: char * strstr (
;	---------------------------------
; Function strstr
; ---------------------------------
_strstr:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-10
	add	hl,sp
	ld	sp,hl
;../_strstr.c:31: char * cp = str1;
	ld	a,4 (ix)
	ld	-2 (ix),a
	ld	a,5 (ix)
	ld	-1 (ix),a
;../_strstr.c:35: if ( !*str2 )
	ld	a,6 (ix)
	ld	-6 (ix),a
	ld	a,7 (ix)
	ld	-5 (ix),a
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	a,(hl)
	or	a,a
	jr	NZ,00122$
;../_strstr.c:36: return str1;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	jp	00113$
;../_strstr.c:38: while (*cp)
00122$:
	ld	a,-2 (ix)
	ld	-4 (ix),a
	ld	a,-1 (ix)
	ld	-3 (ix),a
00110$:
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	a,(hl)
	or	a,a
	jp	Z,00112$
;../_strstr.c:41: s2 = str2;
	ld	e,-6 (ix)
	ld	d,-5 (ix)
;../_strstr.c:43: while ( *s1 && *s2 && !(*s1-*s2) )
	ld	a,-4 (ix)
	ld	-8 (ix),a
	ld	a,-3 (ix)
	ld	-7 (ix),a
00105$:
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	c,(hl)
	xor	a,a
	or	a,c
	jr	Z,00107$
	ld	a,(de)
	ld	b,a
	or	a,a
	jr	Z,00107$
	ld	-10 (ix),c
	ld	a,c
	rla	
	sbc	a,a
	ld	-9 (ix),a
	ld	a,b
	ld	c,a
	rla	
	sbc	a,a
	ld	b,a
	ld	a,-10 (ix)
	sub	a,c
	ld	c,a
	ld	a,-9 (ix)
	sbc	a,b
	ld	b,a
	or	a,c
	jr	NZ,00107$
;../_strstr.c:44: s1++, s2++;
	inc	-8 (ix)
	jr	NZ,00124$
	inc	-7 (ix)
00124$:
	inc	de
	jr	00105$
00107$:
;../_strstr.c:46: if (!*s2)
	ld	a,(de)
	or	a,a
	jr	NZ,00109$
;../_strstr.c:47: return(cp);
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	jr	00113$
00109$:
;../_strstr.c:49: cp++;
	inc	-4 (ix)
	jr	NZ,00125$
	inc	-3 (ix)
00125$:
	ld	a,-4 (ix)
	ld	-2 (ix),a
	ld	a,-3 (ix)
	ld	-1 (ix),a
	jp	00110$
00112$:
;../_strstr.c:52: return (NULL) ;
	ld	hl,#0x0000
00113$:
	ld	sp,ix
	pop	ix
ret
	.area _CODE
	.area _CABS
