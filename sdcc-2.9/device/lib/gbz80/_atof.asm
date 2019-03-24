;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.0 #5416 (Apr  7 2010) (MINGW32)
; This file was generated Fri Jun 11 23:46:40 2010
;--------------------------------------------------------
	.module _atof
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _atof
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
;../_atof.c:23: float atof(char * s)
;	---------------------------------
; Function atof
; ---------------------------------
_atof:
	lda	sp,-19(sp)
;../_atof.c:30: while (isspace(*s)) s++;
	lda	hl,21(sp)
	ld	a,(hl+)
	ld	e,(hl)
	lda	hl,8(sp)
	ld	(hl+),a
	ld	(hl),e
00101$:
	lda	hl,8(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	c,a
	push	af
	inc	sp
	call	_isspace
	lda	sp,1(sp)
	ld	c,e
	xor	a,a
	or	a,c
	jp	Z,00148$
	lda	hl,8(sp)
	inc	(hl)
	jr	NZ,00151$
	inc	hl
	inc	(hl)
00151$:
	jp	00101$
00148$:
	lda	hl,8(sp)
	ld	a,(hl+)
	ld	e,(hl)
	lda	hl,21(sp)
	ld	(hl+),a
	ld	(hl),e
;../_atof.c:33: if (*s == '-')
	lda	hl,8(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	c,a
	sub	a,#0x2D
	jp	NZ,00152$
	jr	00153$
00152$:
	jp	00107$
00153$:
;../_atof.c:35: sign=1;
	lda	hl,10(sp)
	ld	(hl),#0x01
;../_atof.c:36: s++;
	dec	hl
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x0001
	add	hl,de
	ld	a,l
	ld	d,h
	lda	hl,21(sp)
	ld	(hl+),a
	ld	(hl),d
	jp	00108$
00107$:
;../_atof.c:40: sign=0;
	lda	hl,10(sp)
	ld	(hl),#0x00
;../_atof.c:41: if (*s == '+') s++;
	ld	a,c
	sub	a,#0x2B
	jp	NZ,00154$
	jr	00155$
00154$:
	jp	00108$
00155$:
	lda	hl,8(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x0001
	add	hl,de
	ld	a,l
	ld	d,h
	lda	hl,21(sp)
	ld	(hl+),a
	ld	(hl),d
00108$:
;../_atof.c:45: for (value=0.0; isdigit(*s); s++)
	lda	hl,15(sp)
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
	lda	hl,21(sp)
	ld	a,(hl+)
	ld	e,(hl)
	lda	hl,8(sp)
	ld	(hl+),a
	ld	(hl),e
00121$:
	lda	hl,8(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	c,a
	push	af
	inc	sp
	call	_isdigit
	lda	sp,1(sp)
	ld	c,e
	xor	a,a
	or	a,c
	jp	Z,00149$
;../_atof.c:47: value=10.0*value+(*s-'0');
	lda	hl,17(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	lda	hl,17(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	ld	hl,#0x4120
	push	hl
	ld	hl,#0x0000
	push	hl
	call	___fsmul
	lda	sp,8(sp)
	push	hl
	lda	hl,6(sp)
	ld	(hl),e
	inc	hl
	ld	(hl),d
	pop	de
	inc	hl
	ld	(hl),e
	inc	hl
	ld	(hl),d
	lda	hl,8(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	c,a
	rla	
	sbc	a,a
	ld	b,a
	ld	a,c
	add	a,#0xD0
	ld	c,a
	ld	a,b
	adc	a,#0xFF
	ld	b,a
	push	bc
	call	___sint2fs
	lda	sp,2(sp)
	push	hl
	lda	hl,2(sp)
	ld	(hl),e
	inc	hl
	ld	(hl),d
	pop	de
	inc	hl
	ld	(hl),e
	inc	hl
	ld	(hl),d
	lda	hl,2(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	lda	hl,2(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	lda	hl,10(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	lda	hl,10(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	___fsadd
	lda	sp,8(sp)
	push	hl
	lda	hl,2(sp)
	ld	(hl),e
	inc	hl
	ld	(hl),d
	pop	de
	inc	hl
	ld	(hl),e
	inc	hl
	ld	(hl),d
	lda	hl,0(sp)
	ld	d,h
	ld	e,l
	lda	hl,15(sp)
	ld	a,(de)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl),a
;../_atof.c:45: for (value=0.0; isdigit(*s); s++)
	lda	hl,8(sp)
	inc	(hl)
	jr	NZ,00156$
	inc	hl
	inc	(hl)
00156$:
	jp	00121$
00149$:
	lda	hl,8(sp)
	ld	a,(hl+)
	ld	e,(hl)
	lda	hl,21(sp)
	ld	(hl+),a
	ld	(hl),e
;../_atof.c:51: if (*s == '.')
	lda	hl,8(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	c,a
	sub	a,#0x2E
	jp	NZ,00157$
	jr	00158$
00157$:
	jp	00110$
00158$:
;../_atof.c:53: s++;
	lda	hl,8(sp)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	inc	bc
;../_atof.c:54: for (fraction=0.1; isdigit(*s); s++)
	inc	hl
	inc	hl
	ld	(hl),#0xCD
	inc	hl
	ld	(hl),#0xCC
	inc	hl
	ld	(hl),#0xCC
	inc	hl
	ld	(hl),#0x3D
	lda	hl,0(sp)
	ld	(hl),c
	inc	hl
	ld	(hl),b
00125$:
	lda	hl,0(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	c,a
	push	af
	inc	sp
	call	_isdigit
	lda	sp,1(sp)
	ld	c,e
	xor	a,a
	or	a,c
	jp	Z,00150$
;../_atof.c:56: value+=(*s-'0')*fraction;
	lda	hl,0(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	c,a
	rla	
	sbc	a,a
	ld	b,a
	ld	a,c
	add	a,#0xD0
	ld	c,a
	ld	a,b
	adc	a,#0xFF
	ld	b,a
	push	bc
	call	___sint2fs
	lda	sp,2(sp)
	push	hl
	lda	hl,6(sp)
	ld	(hl),e
	inc	hl
	ld	(hl),d
	pop	de
	inc	hl
	ld	(hl),e
	inc	hl
	ld	(hl),d
	lda	hl,13(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	lda	hl,13(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	lda	hl,10(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	lda	hl,10(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	___fsmul
	lda	sp,8(sp)
	push	hl
	lda	hl,6(sp)
	ld	(hl),e
	inc	hl
	ld	(hl),d
	pop	de
	inc	hl
	ld	(hl),e
	inc	hl
	ld	(hl),d
	lda	hl,6(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	lda	hl,6(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	lda	hl,21(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	lda	hl,21(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	___fsadd
	lda	sp,8(sp)
	push	hl
	lda	hl,6(sp)
	ld	(hl),e
	inc	hl
	ld	(hl),d
	pop	de
	inc	hl
	ld	(hl),e
	inc	hl
	ld	(hl),d
	lda	hl,4(sp)
	ld	d,h
	ld	e,l
	lda	hl,15(sp)
	ld	a,(de)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl),a
;../_atof.c:57: fraction*=0.1;
	lda	hl,13(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	lda	hl,13(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	ld	hl,#0x3DCC
	push	hl
	ld	hl,#0xCCCD
	push	hl
	call	___fsmul
	lda	sp,8(sp)
	push	hl
	lda	hl,6(sp)
	ld	(hl),e
	inc	hl
	ld	(hl),d
	pop	de
	inc	hl
	ld	(hl),e
	inc	hl
	ld	(hl),d
	lda	hl,4(sp)
	ld	d,h
	ld	e,l
	lda	hl,11(sp)
	ld	a,(de)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl),a
;../_atof.c:54: for (fraction=0.1; isdigit(*s); s++)
	lda	hl,0(sp)
	inc	(hl)
	jr	NZ,00159$
	inc	hl
	inc	(hl)
00159$:
	jp	00125$
00150$:
	lda	hl,0(sp)
	ld	a,(hl+)
	ld	e,(hl)
	lda	hl,21(sp)
	ld	(hl+),a
	ld	(hl),e
00110$:
;../_atof.c:62: if (toupper(*s)=='E')
	lda	hl,21(sp)
	ld	a,(hl+)
	ld	e,(hl)
	lda	hl,0(sp)
	ld	(hl+),a
	ld	(hl),e
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	c,a
	push	af
	inc	sp
	call	_islower
	lda	sp,1(sp)
	ld	c,e
	xor	a,a
	or	a,c
	jp	Z,00131$
	lda	hl,0(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	c,a
	rla	
	sbc	a,a
	ld	b,a
	ld	a,c
	and	a,#0xDF
	ld	c,a
	jp	00132$
00131$:
	lda	hl,0(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	dec	hl
	ld	(hl),a
	ld	c,a
	ld	a,(hl)
	rla	
	sbc	a,a
	ld	b,a
00132$:
	ld	a,c
	sub	a,#0x45
	jp	NZ,00160$
	or	a,b
	jp	NZ,00160$
	jr	00161$
00160$:
	jp	00118$
00161$:
;../_atof.c:64: s++;
	lda	hl,21(sp)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	hl,#0x0001
	add	hl,bc
	ld	a,l
	ld	d,h
	lda	hl,21(sp)
	ld	(hl+),a
	ld	(hl),d
;../_atof.c:65: iexp=(char)atoi(s);
	dec	hl
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	_atoi
	lda	sp,2(sp)
	ld	b,d
	ld	c,e
;../_atof.c:67: while(iexp!=0)
00114$:
	xor	a,a
	or	a,c
	jp	Z,00118$
;../_atof.c:69: if(iexp<0)
	ld	a,c
	bit	7,a
	jp	Z,00112$
;../_atof.c:71: value*=0.1;
	push	bc
	lda	hl,19(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	lda	hl,19(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	ld	hl,#0x3DCC
	push	hl
	ld	hl,#0xCCCD
	push	hl
	call	___fsmul
	lda	sp,8(sp)
	push	hl
	lda	hl,4(sp)
	ld	(hl),e
	inc	hl
	ld	(hl),d
	pop	de
	inc	hl
	ld	(hl),e
	inc	hl
	ld	(hl),d
	pop	bc
	lda	hl,0(sp)
	ld	d,h
	ld	e,l
	lda	hl,15(sp)
	ld	a,(de)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl),a
;../_atof.c:72: iexp++;
	inc	c
	jp	00114$
00112$:
;../_atof.c:76: value*=10.0;
	push	bc
	lda	hl,19(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	lda	hl,19(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	ld	hl,#0x4120
	push	hl
	ld	hl,#0x0000
	push	hl
	call	___fsmul
	lda	sp,8(sp)
	push	hl
	lda	hl,4(sp)
	ld	(hl),e
	inc	hl
	ld	(hl),d
	pop	de
	inc	hl
	ld	(hl),e
	inc	hl
	ld	(hl),d
	pop	bc
	lda	hl,0(sp)
	ld	d,h
	ld	e,l
	lda	hl,15(sp)
	ld	a,(de)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl),a
;../_atof.c:77: iexp--;
	dec	c
	jp	00114$
00118$:
;../_atof.c:83: if(sign) value*=-1.0;
	xor	a,a
	lda	hl,10(sp)
	or	a,(hl)
	jp	Z,00120$
	lda	hl,18(sp)
	ld	a,(hl)
	xor	a,#0x80
	ld	(hl),a
	lda	hl,15(sp)
	ld	a,(hl)
	ld	(hl+),a
	ld	a,(hl)
	ld	(hl+),a
	ld	a,(hl)
	ld	(hl),a
00120$:
;../_atof.c:84: return (value);
	lda	hl,15(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	inc	hl
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
00129$:
	lda	sp,19(sp)
ret
	.area _CODE
	.area _CABS
