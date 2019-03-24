;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.0 #5416 (Apr  7 2010) (MINGW32)
; This file was generated Fri Jun 11 23:46:51 2010
;--------------------------------------------------------
	.module _atoi
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _atoi
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
	lda	sp,-9(sp)
;../_atoi.c:27: register int rv=0; 
	lda	hl,7(sp)
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
;../_atoi.c:31: while (*s) {
	lda	hl,11(sp)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
00107$:
	ld	a,(bc)
	lda	hl,5(sp)
	ld	(hl),a
	or	a,a
	jp	Z,00133$
;../_atoi.c:32: if (*s <= '9' && *s >= '0')
	ld	a,#0x39
	sub	a,(hl)
	rlca
	jp	C,00102$
	ld	a,(hl)
	sub	a,#0x30
	rlca
	jp	NC,00133$
;../_atoi.c:33: break;
00102$:
;../_atoi.c:34: if (*s == '-' || *s == '+') 
	ld	a,(bc)
	lda	hl,5(sp)
	ld	(hl),a
	sub	a,#0x2D
	jp	Z,00133$
00135$:
	lda	hl,5(sp)
	ld	a,(hl)
	sub	a,#0x2B
	jp	Z,00133$
00136$:
;../_atoi.c:36: s++;
	inc	bc
	jp	00107$
00133$:
	lda	hl,11(sp)
	ld	(hl),c
	inc	hl
	ld	(hl),b
;../_atoi.c:39: sign = (*s == '-');
	ld	a,(bc)
	lda	hl,5(sp)
	ld	(hl),a
	sub	a,#0x2D
	jp	NZ,00137$
	ld	a,#0x01
	jr	00138$
00137$:
	xor	a,a
00138$:
	lda	hl,6(sp)
	ld	(hl-),a
	dec	hl
	ld	(hl),a
;../_atoi.c:40: if (*s == '-' || *s == '+') s++;
	xor	a,a
	inc	hl
	inc	hl
	or	a,(hl)
	jp	NZ,00110$
	dec	hl
	ld	a,(hl)
	sub	a,#0x2B
	jp	NZ,00139$
	jr	00140$
00139$:
	jp	00131$
00140$:
00110$:
	ld	hl,#0x0001
	add	hl,bc
	ld	a,l
	ld	d,h
	lda	hl,11(sp)
	ld	(hl+),a
	ld	(hl),d
;../_atoi.c:42: while (*s && *s >= '0' && *s <= '9') {
00131$:
	lda	hl,11(sp)
	ld	a,(hl+)
	ld	e,(hl)
	lda	hl,2(sp)
	ld	(hl+),a
	ld	(hl),e
00115$:
	lda	hl,2(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	c,a
	or	a,a
	jp	Z,00117$
	ld	a,c
	sub	a,#0x30
	rlca
	jp	C,00117$
	ld	a,#0x39
	sub	a,c
	rlca
	jp	C,00117$
;../_atoi.c:43: rv = (rv * 10) + (*s - '0');
	lda	hl,7(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	l,e
	ld	h,d
	add	hl,hl
	add	hl,hl
	add	hl,de
	add	hl,hl
	ld	a,l
	ld	d,h
	lda	hl,0(sp)
	ld	(hl+),a
	ld	(hl),d
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
	dec	hl
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	add	hl,bc
	ld	c,l
	ld	b,h
	lda	hl,7(sp)
	ld	(hl),c
	inc	hl
	ld	(hl),b
;../_atoi.c:44: s++;
	lda	hl,2(sp)
	inc	(hl)
	jr	NZ,00141$
	inc	hl
	inc	(hl)
00141$:
	jp	00115$
00117$:
;../_atoi.c:47: return (sign ? -rv : rv);
	xor	a,a
	lda	hl,4(sp)
	or	a,(hl)
	jp	Z,00120$
	xor	a,a
	lda	hl,7(sp)
	ld	a,#0x00
	sbc	a,(hl)
	ld	c,a
	inc	hl
	ld	a,#0x00
	sbc	a,(hl)
	ld	b,a
	jp	00121$
00120$:
	lda	hl,7(sp)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
00121$:
	ld	e,c
	ld	d,b
00118$:
	lda	sp,9(sp)
ret
	.area _CODE
	.area _CABS
