;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.0 #5416 (Apr  7 2010) (MINGW32)
; This file was generated Fri Jun 11 23:46:57 2010
;--------------------------------------------------------
	.module _strtok
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _strtok
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
	
	push	af
;../_strtok.c:38: if ( str )
	lda	hl,4(sp)
	ld	a,(hl+)
	or	a,(hl)
	jp	Z,00102$
;../_strtok.c:39: s = str ;
	dec	hl
	ld	a,(hl+)
	ld	e,(hl)
	ld	hl,#_strtok_s_1_1
	ld	(hl),a
	ld	hl,#_strtok_s_1_1 + 1
	ld	(hl),e
00102$:
;../_strtok.c:40: if ( !s )
	ld	hl,#_strtok_s_1_1
	ld	a,(hl)
	ld	hl,#_strtok_s_1_1 + 1
	or	a,(hl)
	jp	NZ,00108$
;../_strtok.c:41: return NULL;
	ld	de,#0x0000
	jp	00119$
;../_strtok.c:43: while (*s) {
00108$:
	ld	hl,#_strtok_s_1_1
	ld	hl,#_strtok_s_1_1
	ld	c,(hl)
	ld	hl,#_strtok_s_1_1 + 1
	ld	b,(hl)
	ld	a,(bc)
	or	a,a
	jp	Z,00110$
;../_strtok.c:44: if (strchr(control,*s))
	ld	hl,#_strtok_s_1_1
	ld	hl,#_strtok_s_1_1
	ld	c,(hl)
	ld	hl,#_strtok_s_1_1 + 1
	ld	b,(hl)
	ld	a,(bc)
	ld	c,a
	push	af
	inc	sp
	lda	hl,7(sp)
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
	jp	Z,00110$
;../_strtok.c:45: s++;
	ld	hl,#_strtok_s_1_1
	inc	(hl)
	jr	NZ,00130$
	ld	hl,#_strtok_s_1_1 + 1
	inc	(hl)
00130$:
	jp	00108$
;../_strtok.c:47: break;
00110$:
;../_strtok.c:50: s1 = s ;
	ld	hl,#_strtok_s_1_1
	ld	a,(hl)
	ld	hl,#_strtok_s_1_1 + 1
	ld	e,(hl)
	lda	hl,0(sp)
	ld	(hl+),a
	ld	(hl),e
;../_strtok.c:52: while (*s) {
00113$:
	ld	hl,#_strtok_s_1_1
	ld	hl,#_strtok_s_1_1
	ld	c,(hl)
	ld	hl,#_strtok_s_1_1 + 1
	ld	b,(hl)
	ld	a,(bc)
	or	a,a
	jp	Z,00115$
;../_strtok.c:53: if (strchr(control,*s)) {
	ld	hl,#_strtok_s_1_1
	ld	hl,#_strtok_s_1_1
	ld	c,(hl)
	ld	hl,#_strtok_s_1_1 + 1
	ld	b,(hl)
	ld	a,(bc)
	ld	c,a
	push	af
	inc	sp
	lda	hl,7(sp)
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
	jp	Z,00112$
;../_strtok.c:54: *s++ = '\0';
	ld	hl,#_strtok_s_1_1
	ld	hl,#_strtok_s_1_1
	ld	c,(hl)
	ld	hl,#_strtok_s_1_1 + 1
	ld	b,(hl)
	ld	a,#0x00
	ld	(bc),a
	ld	hl,#_strtok_s_1_1
	inc	(hl)
	jr	NZ,00131$
	ld	hl,#_strtok_s_1_1 + 1
	inc	(hl)
00131$:
;../_strtok.c:55: return s1 ;
	lda	hl,0(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	jp	00119$
00112$:
;../_strtok.c:57: s++ ;
	ld	hl,#_strtok_s_1_1
	inc	(hl)
	jr	NZ,00132$
	ld	hl,#_strtok_s_1_1 + 1
	inc	(hl)
00132$:
	jp	00113$
00115$:
;../_strtok.c:60: s = NULL;
	ld	hl,#_strtok_s_1_1
	ld	(hl),#0x00
	ld	hl,#_strtok_s_1_1 + 1
	ld	(hl),#0x00
;../_strtok.c:62: if (*s1)
	lda	hl,0(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	or	a,a
	jp	Z,00117$
;../_strtok.c:63: return s1;
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	jp	00119$
00117$:
;../_strtok.c:65: return NULL;
	ld	de,#0x0000
00119$:
	lda	sp,2(sp)
ret
	.area _CODE
	.area _CABS
