;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.0 #5416 (Apr  7 2010) (MINGW32)
; This file was generated Sun Apr 11 14:38:06 2010
;--------------------------------------------------------
	.module _atof
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _atof
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
;../_atof.c:23: float atof(char * s)
;	---------------------------------
; Function atof
; ---------------------------------
_atof:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-16
	add	hl,sp
	ld	sp,hl
;../_atof.c:30: while (isspace(*s)) s++;
	ld	c,4 (ix)
	ld	b,5 (ix)
00101$:
	ld	a,(bc)
	ld	e,a
	push	bc
	ld	a,e
	push	af
	inc	sp
	call	_isspace
	inc	sp
	ld	e,l
	pop	bc
	xor	a,a
	or	a,e
	jr	Z,00148$
	inc	bc
	jr	00101$
00148$:
	ld	4 (ix),c
	ld	5 (ix),b
;../_atof.c:33: if (*s == '-')
	ld	a,(bc)
	ld	e,a
	sub	a,#0x2D
	jr	NZ,00107$
;../_atof.c:35: sign=1;
	ld	-10 (ix),#0x01
;../_atof.c:36: s++;
	ld	hl,#0x0001
	add	hl,bc
	ld	4 (ix),l
	ld	5 (ix),h
	jr	00108$
00107$:
;../_atof.c:40: sign=0;
	ld	-10 (ix),#0x00
;../_atof.c:41: if (*s == '+') s++;
	ld	a,e
	sub	a,#0x2B
	jr	NZ,00108$
	ld	hl,#0x0001
	add	hl,bc
	ld	4 (ix),l
	ld	5 (ix),h
00108$:
;../_atof.c:45: for (value=0.0; isdigit(*s); s++)
	ld	-4 (ix),#0x00
	ld	-3 (ix),#0x00
	ld	-2 (ix),#0x00
	ld	-1 (ix),#0x00
	ld	a,4 (ix)
	ld	-12 (ix),a
	ld	a,5 (ix)
	ld	-11 (ix),a
00121$:
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	ld	a,(hl)
	push	af
	inc	sp
	call	_isdigit
	inc	sp
	xor	a,a
	or	a,l
	jp	Z,00149$
;../_atof.c:47: value=10.0*value+(*s-'0');
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	push	hl
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	push	hl
	ld	hl,#0x4120
	push	hl
	ld	hl,#0x0000
	push	hl
	call	___fsmul
	pop	af
	pop	af
	pop	af
	pop	af
	ld	-13 (ix),d
	ld	-14 (ix),e
	ld	-15 (ix),h
	ld	-16 (ix),l
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	ld	c,(hl)
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
	push	bc
	call	___sint2fs
	pop	af
	ld	b,h
	ld	c,l
	push	de
	push	bc
	ld	l,-14 (ix)
	ld	h,-13 (ix)
	push	hl
	ld	l,-16 (ix)
	ld	h,-15 (ix)
	push	hl
	call	___fsadd
	pop	af
	pop	af
	pop	af
	pop	af
	ld	b,h
	ld	-4 (ix),l
	ld	-3 (ix),b
	ld	-2 (ix),e
	ld	-1 (ix),d
;../_atof.c:45: for (value=0.0; isdigit(*s); s++)
	inc	-12 (ix)
	jr	NZ,00155$
	inc	-11 (ix)
00155$:
	jp	00121$
00149$:
	ld	a,-12 (ix)
	ld	4 (ix),a
	ld	a,-11 (ix)
	ld	5 (ix),a
;../_atof.c:51: if (*s == '.')
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	ld	a,(hl)
	sub	a,#0x2E
	jp	NZ,00110$
;../_atof.c:53: s++;
	ld	c,-12 (ix)
	ld	b,-11 (ix)
	inc	bc
;../_atof.c:54: for (fraction=0.1; isdigit(*s); s++)
	ld	-8 (ix),#0xCD
	ld	-7 (ix),#0xCC
	ld	-6 (ix),#0xCC
	ld	-5 (ix),#0x3D
	ld	-16 (ix),c
	ld	-15 (ix),b
00125$:
	ld	l,-16 (ix)
	ld	h,-15 (ix)
	ld	a,(hl)
	push	af
	inc	sp
	call	_isdigit
	inc	sp
	xor	a,a
	or	a,l
	jp	Z,00150$
;../_atof.c:56: value+=(*s-'0')*fraction;
	ld	l,-16 (ix)
	ld	h,-15 (ix)
	ld	e,(hl)
	ld	a,e
	rla	
	sbc	a,a
	ld	d,a
	ld	a,e
	add	a,#0xD0
	ld	e,a
	ld	a,d
	adc	a,#0xFF
	ld	d,a
	push	de
	call	___sint2fs
	pop	af
	ld	b,d
	ld	c,e
	ex	de,hl
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	push	hl
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	push	hl
	push	bc
	push	de
	call	___fsmul
	pop	af
	pop	af
	pop	af
	pop	af
	ld	b,h
	ld	c,l
	push	de
	push	bc
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	push	hl
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	push	hl
	call	___fsadd
	pop	af
	pop	af
	pop	af
	pop	af
	ld	b,h
	ld	-4 (ix),l
	ld	-3 (ix),b
	ld	-2 (ix),e
	ld	-1 (ix),d
;../_atof.c:57: fraction*=0.1;
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	push	hl
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	push	hl
	ld	hl,#0x3DCC
	push	hl
	ld	hl,#0xCCCD
	push	hl
	call	___fsmul
	pop	af
	pop	af
	pop	af
	pop	af
	ld	b,h
	ld	-8 (ix),l
	ld	-7 (ix),b
	ld	-6 (ix),e
	ld	-5 (ix),d
;../_atof.c:54: for (fraction=0.1; isdigit(*s); s++)
	inc	-16 (ix)
	jr	NZ,00158$
	inc	-15 (ix)
00158$:
	jp	00125$
00150$:
	ld	a,-16 (ix)
	ld	4 (ix),a
	ld	a,-15 (ix)
	ld	5 (ix),a
00110$:
;../_atof.c:62: if (toupper(*s)=='E')
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	a,(bc)
	ld	e,a
	push	bc
	ld	a,e
	push	af
	inc	sp
	call	_islower
	inc	sp
	ld	e,l
	pop	bc
	xor	a,a
	or	a,e
	jr	Z,00131$
	ld	a,(bc)
	ld	e,a
	rla	
	sbc	a,a
	ld	d,a
	ld	a,e
	and	a,#0xDF
	ld	e,a
	jr	00132$
00131$:
	ld	a,(bc)
	ld	c,a
	ld	e,a
	rla	
	sbc	a,a
	ld	d,a
00132$:
	ld	a,e
	sub	a,#0x45
	jr	NZ,00159$
	ld	a,d
	or	a,a
	jr	Z,00160$
00159$:
	jp	00118$
00160$:
;../_atof.c:64: s++;
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	hl,#0x0001
	add	hl,bc
;../_atof.c:65: iexp=(char)atoi(s);
	ld	4 (ix),l
	ld	5 (ix),h
	push	hl
	call	_atoi
	pop	af
	ld	b,h
	ld	c,l
	ld	-9 (ix),c
;../_atof.c:67: while(iexp!=0)
00114$:
	xor	a,a
	or	a,-9 (ix)
	jp	Z,00118$
;../_atof.c:69: if(iexp<0)
	bit	7,-9 (ix)
	jr	Z,00112$
;../_atof.c:71: value*=0.1;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	push	hl
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	push	hl
	ld	hl,#0x3DCC
	push	hl
	ld	hl,#0xCCCD
	push	hl
	call	___fsmul
	pop	af
	pop	af
	pop	af
	pop	af
	ld	c,d
	ld	d,e
	ld	e,h
	ld	b,l
	ld	-4 (ix),b
	ld	-3 (ix),e
	ld	-2 (ix),d
	ld	-1 (ix),c
;../_atof.c:72: iexp++;
	inc	-9 (ix)
	jr	00114$
00112$:
;../_atof.c:76: value*=10.0;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	push	hl
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	push	hl
	ld	hl,#0x4120
	push	hl
	ld	hl,#0x0000
	push	hl
	call	___fsmul
	pop	af
	pop	af
	pop	af
	pop	af
	ld	b,h
	ld	c,l
	ld	-4 (ix),c
	ld	-3 (ix),b
	ld	-2 (ix),e
	ld	-1 (ix),d
;../_atof.c:77: iexp--;
	dec	-9 (ix)
	jp	00114$
00118$:
;../_atof.c:83: if(sign) value*=-1.0;
	xor	a,a
	or	a,-10 (ix)
	jr	Z,00120$
	ld	a,-1 (ix)
	xor	a,#0x80
	ld	-1 (ix),a
	ld	a,-4 (ix)
	ld	-4 (ix),a
	ld	a,-3 (ix)
	ld	-3 (ix),a
	ld	a,-2 (ix)
	ld	-2 (ix),a
00120$:
;../_atof.c:84: return (value);
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	e,-2 (ix)
	ld	d,-1 (ix)
	ld	sp,ix
	pop	ix
ret
	.area _CODE
	.area _CABS
