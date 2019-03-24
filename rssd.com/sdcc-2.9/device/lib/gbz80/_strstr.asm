;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.0 #5416 (Apr  7 2010) (MINGW32)
; This file was generated Fri Jun 11 23:46:57 2010
;--------------------------------------------------------
	.module _strstr
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _strstr
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
	lda	sp,-12(sp)
;../_strstr.c:31: char * cp = str1;
	lda	hl,14(sp)
	ld	a,(hl+)
	ld	e,(hl)
	lda	hl,10(sp)
	ld	(hl+),a
	ld	(hl),e
;../_strstr.c:35: if ( !*str2 )
	lda	hl,16(sp)
	ld	a,(hl+)
	ld	e,(hl)
	lda	hl,6(sp)
	ld	(hl+),a
	ld	(hl),e
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	or	a,a
	jp	NZ,00122$
;../_strstr.c:36: return str1;
	lda	hl,10(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	jp	00113$
;../_strstr.c:38: while (*cp)
00122$:
	lda	hl,10(sp)
	ld	a,(hl+)
	ld	e,(hl)
	lda	hl,8(sp)
	ld	(hl+),a
	ld	(hl),e
00110$:
	lda	hl,8(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	or	a,a
	jp	Z,00112$
;../_strstr.c:41: s2 = str2;
	lda	hl,6(sp)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
;../_strstr.c:43: while ( *s1 && *s2 && !(*s1-*s2) )
	inc	hl
	ld	a,(hl+)
	ld	e,(hl)
	lda	hl,4(sp)
	ld	(hl+),a
	ld	(hl),e
	lda	hl,2(sp)
	ld	(hl),c
	inc	hl
	ld	(hl),b
00105$:
	lda	hl,4(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	c,a
	or	a,a
	jp	Z,00107$
	lda	hl,2(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	b,a
	or	a,a
	jp	Z,00107$
	lda	hl,0(sp)
	ld	(hl),c
	ld	a,c
	rla	
	sbc	a,a
	inc	hl
	ld	(hl),a
	ld	a,b
	ld	c,a
	rla	
	sbc	a,a
	ld	b,a
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,e
	sub	a,c
	ld	e,a
	ld	a,d
	sbc	a,b
	ld	b,a
	ld	c,e
	ld	a,c
	or	a,b
	jp	NZ,00107$
;../_strstr.c:44: s1++, s2++;
	lda	hl,4(sp)
	inc	(hl)
	jr	NZ,00124$
	inc	hl
	inc	(hl)
00124$:
	lda	hl,2(sp)
	inc	(hl)
	jr	NZ,00125$
	inc	hl
	inc	(hl)
00125$:
	jp	00105$
00107$:
;../_strstr.c:46: if (!*s2)
	lda	hl,2(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	or	a,a
	jp	NZ,00109$
;../_strstr.c:47: return(cp);
	lda	hl,10(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	jp	00113$
00109$:
;../_strstr.c:49: cp++;
	lda	hl,8(sp)
	inc	(hl)
	jr	NZ,00126$
	inc	hl
	inc	(hl)
00126$:
	lda	hl,8(sp)
	ld	a,(hl+)
	ld	e,(hl)
	inc	hl
	ld	(hl+),a
	ld	(hl),e
	jp	00110$
00112$:
;../_strstr.c:52: return (NULL) ;
	ld	de,#0x0000
00113$:
	lda	sp,12(sp)
ret
	.area _CODE
	.area _CABS
