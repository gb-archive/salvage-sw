;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.0 #5416 (Apr  7 2010) (MINGW32)
; This file was generated Sun Apr 11 14:38:25 2010
;--------------------------------------------------------
	.module _strtok
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _strtok
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
;  ram data
;--------------------------------------------------------
	.area _DATA
_strtok_s_1_1:
	.ds 2
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
;../_strtok.c:31: char * strtok (
;	---------------------------------
; Function strtok
; ---------------------------------
_strtok:
	push	ix
	ld	ix,#0
	add	ix,sp
;../_strtok.c:38: if ( str )
	ld	a,4 (ix)
	or	a,5 (ix)
	jr	Z,00102$
;../_strtok.c:39: s = str ;
	ld	a,4 (ix)
	ld	hl,#_strtok_s_1_1 + 0
	ld	(hl), a
	ld	a,5 (ix)
	ld	hl,#_strtok_s_1_1 + 1
	ld	(hl), a
00102$:
;../_strtok.c:40: if ( !s )
	ld	a,(#_strtok_s_1_1+0)
	ld	iy,#_strtok_s_1_1
	or	a,1 (iy)
	jr	NZ,00108$
;../_strtok.c:41: return NULL;
	ld	hl,#0x0000
	jp	00119$
;../_strtok.c:43: while (*s) {
00108$:
	ld	bc,(_strtok_s_1_1)
	ld	a,(bc)
	or	a,a
	jr	Z,00110$
;../_strtok.c:44: if (strchr(control,*s))
	ld	bc,(_strtok_s_1_1)
	ld	a,(bc)
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_strchr
	pop	af
	inc	sp
	ld	b,h
	ld	a,l
	or	a,b
	jr	Z,00110$
;../_strtok.c:45: s++;
	ld	iy,#_strtok_s_1_1
	inc	0 (iy)
	jr	NZ,00130$
	ld	iy,#_strtok_s_1_1
	inc	1 (iy)
00130$:
	jr	00108$
;../_strtok.c:47: break;
00110$:
;../_strtok.c:50: s1 = s ;
	ld	bc,(_strtok_s_1_1)
;../_strtok.c:52: while (*s) {
00113$:
	ld	de,(_strtok_s_1_1)
	ld	a,(de)
	or	a,a
	jr	Z,00115$
;../_strtok.c:53: if (strchr(control,*s)) {
	ld	de,(_strtok_s_1_1)
	ld	a,(de)
	ld	e,a
	push	bc
	ld	a,e
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_strchr
	pop	af
	inc	sp
	ex	de,hl
	pop	bc
	ld	a,e
	or	a,d
	jr	Z,00112$
;../_strtok.c:54: *s++ = '\0';
	ld	de,(_strtok_s_1_1)
	ld	a,#0x00
	ld	(de),a
	ld	iy,#_strtok_s_1_1
	inc	0 (iy)
	jr	NZ,00131$
	ld	iy,#_strtok_s_1_1
	inc	1 (iy)
00131$:
;../_strtok.c:55: return s1 ;
	ld	l,c
	ld	h,b
	jr	00119$
00112$:
;../_strtok.c:57: s++ ;
	ld	iy,#_strtok_s_1_1
	inc	0 (iy)
	jr	NZ,00132$
	ld	iy,#_strtok_s_1_1
	inc	1 (iy)
00132$:
	jr	00113$
00115$:
;../_strtok.c:60: s = NULL;
	ld	hl,#_strtok_s_1_1 + 0
	ld	(hl), #0x00
	ld	iy,#_strtok_s_1_1
	ld	1 (iy),#0x00
;../_strtok.c:62: if (*s1)
	ld	a,(bc)
	or	a,a
	jr	Z,00117$
;../_strtok.c:63: return s1;
	ld	l,c
	ld	h,b
	jr	00119$
00117$:
;../_strtok.c:65: return NULL;
	ld	hl,#0x0000
00119$:
	pop	ix
ret
	.area _CODE
	.area _CABS
