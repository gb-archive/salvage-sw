;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.0 #5416 (Apr  7 2010) (MINGW32)
; This file was generated Sun Apr 11 14:38:20 2010
;--------------------------------------------------------
	.module _atoi
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _atoi
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
;../_atoi.c:25: int atoi(char * s)
;	---------------------------------
; Function atoi
; ---------------------------------
_atoi:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-5
	add	hl,sp
	ld	sp,hl
;../_atoi.c:27: register int rv=0; 
	ld	-2 (ix),#0x00
	ld	-1 (ix),#0x00
;../_atoi.c:31: while (*s) {
	ld	e,4 (ix)
	ld	d,5 (ix)
00107$:
	ld	a,(de)
	ld	c,a
	or	a,a
	jr	Z,00133$
;../_atoi.c:32: if (*s <= '9' && *s >= '0')
	ld	a,#0x39
	sub	a,c
	jp	M,00102$
	ld	a,c
	sub	a,#0x30
	jp	P,00133$
;../_atoi.c:33: break;
00102$:
;../_atoi.c:34: if (*s == '-' || *s == '+') 
	ld	a,(de)
	ld	c,a
	sub	a,#0x2D
	jr	Z,00133$
	ld	a,c
	sub	a,#0x2B
	jr	Z,00133$
;../_atoi.c:36: s++;
	inc	de
	jr	00107$
00133$:
	ld	4 (ix),e
	ld	5 (ix),d
;../_atoi.c:39: sign = (*s == '-');
	ld	a,(de)
	ld	c,a
	sub	a,#0x2D
	jr	NZ,00137$
	ld	a,#0x01
	jr	00138$
00137$:
	xor	a,a
00138$:
	ld	b,a
	ld	-3 (ix),b
;../_atoi.c:40: if (*s == '-' || *s == '+') s++;
	xor	a,a
	or	a,b
	jr	NZ,00110$
	ld	a,c
	sub	a,#0x2B
	jr	NZ,00131$
00110$:
	ld	hl,#0x0001
	add	hl,de
	ld	4 (ix),l
	ld	5 (ix),h
;../_atoi.c:42: while (*s && *s >= '0' && *s <= '9') {
00131$:
	ld	e,4 (ix)
	ld	d,5 (ix)
00115$:
	ld	a,(de)
	ld	c,a
	or	a,a
	jr	Z,00117$
	ld	a,c
	sub	a,#0x30
	jp	M,00117$
	ld	a,#0x39
	sub	a,c
	jp	M,00117$
;../_atoi.c:43: rv = (rv * 10) + (*s - '0');
	push	de
	ld	e,-2 (ix)
	ld	d,-1 (ix)
	ld	l,e
	ld	h,d
	add	hl,hl
	add	hl,hl
	add	hl,de
	add	hl,hl
	pop	de
	ld	-5 (ix),l
	ld	-4 (ix),h
	ld	a,c
	rla	
	sbc	a,a
	ld	b,a
	ld	a,c
	add	a,#0xD0
	ld	c,a
	ld	a,b
	adc	a,#0xFF
	ld	b,a
	ld	a,-5 (ix)
	add	a,c
	ld	c,a
	ld	a,-4 (ix)
	adc	a,b
	ld	b,a
	ld	-2 (ix),c
	ld	-1 (ix),b
;../_atoi.c:44: s++;
	inc	de
	jr	00115$
00117$:
;../_atoi.c:47: return (sign ? -rv : rv);
	xor	a,a
	or	a,-3 (ix)
	jr	Z,00120$
	xor	a,a
	sbc	a,-2 (ix)
	ld	c,a
	ld	a,#0x00
	sbc	a,-1 (ix)
	ld	b,a
	jr	00121$
00120$:
	ld	c,-2 (ix)
	ld	b,-1 (ix)
00121$:
	ld	l,c
	ld	h,b
	ld	sp,ix
	pop	ix
ret
	.area _CODE
	.area _CABS
