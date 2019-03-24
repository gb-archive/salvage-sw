;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.0 #5416 (Apr  7 2010) (MINGW32)
; This file was generated Fri Jun 11 23:46:54 2010
;--------------------------------------------------------
	.module _isxdigit
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _isxdigit
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
;../_isxdigit.c:24: char isxdigit (unsigned char c) 
;	---------------------------------
; Function isxdigit
; ---------------------------------
_isxdigit:
	
;../_isxdigit.c:27: if (( c >= '0' && c <= '9')  ||
	lda	hl,2(sp)
	ld	a,(hl)
	sub	a,#0x30
	jp	C,00105$
	ld	a,#0x39
	sub	a,(hl)
	jp	NC,00101$
00105$:
;../_isxdigit.c:28: ( c >= 'a' && c <= 'f')  ||
	lda	hl,2(sp)
	ld	a,(hl)
	sub	a,#0x61
	jp	C,00107$
	ld	a,#0x66
	sub	a,(hl)
	jp	NC,00101$
00107$:
;../_isxdigit.c:29: ( c >= 'A' && c <= 'F')) 
	lda	hl,2(sp)
	ld	a,(hl)
	sub	a,#0x41
	jp	C,00102$
	ld	a,#0x46
	sub	a,(hl)
	jp	C,00102$
00101$:
;../_isxdigit.c:30: return 1;
	ld	e,#0x01
	jp	00108$
00102$:
;../_isxdigit.c:31: return 0;
	ld	e,#0x00
00108$:
	
ret
	.area _CODE
	.area _CABS
