;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.0 #5416 (Apr  7 2010) (MINGW32)
; This file was generated Fri Jun 11 23:46:51 2010
;--------------------------------------------------------
	.module _atol
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _atol
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
;../_atol.c:25: long atol(char * s)
;	---------------------------------
; Function atol
; ---------------------------------
_atol:
	lda	sp,-17(sp)
;../_atol.c:27: register long rv=0; 
	xor	a,a
	lda	hl,13(sp)
	ld	(hl+),a
	ld	(hl+),a
	ld	(hl+),a
	ld	(hl),a
;../_atol.c:31: while (*s) {
	lda	hl,19(sp)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
00107$:
	ld	a,(bc)
	lda	hl,11(sp)
	ld	(hl),a
	or	a,a
	jp	Z,00133$
;../_atol.c:32: if (*s <= '9' && *s >= '0')
	ld	a,#0x39
	sub	a,(hl)
	rlca
	jp	C,00102$
	ld	a,(hl)
	sub	a,#0x30
	rlca
	jp	NC,00133$
;../_atol.c:33: break;
00102$:
;../_atol.c:34: if (*s == '-' || *s == '+') 
	ld	a,(bc)
	lda	hl,11(sp)
	ld	(hl),a
	sub	a,#0x2D
	jp	Z,00133$
00135$:
	lda	hl,11(sp)
	ld	a,(hl)
	sub	a,#0x2B
	jp	Z,00133$
00136$:
;../_atol.c:36: s++;
	inc	bc
	jp	00107$
00133$:
	lda	hl,19(sp)
	ld	(hl),c
	inc	hl
	ld	(hl),b
;../_atol.c:39: sign = (*s == '-');
	ld	a,(bc)
	lda	hl,11(sp)
	ld	(hl),a
	sub	a,#0x2D
	jp	NZ,00137$
	ld	a,#0x01
	jr	00138$
00137$:
	xor	a,a
00138$:
	lda	hl,12(sp)
	ld	(hl-),a
	dec	hl
	ld	(hl),a
;../_atol.c:40: if (*s == '-' || *s == '+') s++;
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
	lda	hl,19(sp)
	ld	(hl+),a
	ld	(hl),d
;../_atol.c:42: while (*s && *s >= '0' && *s <= '9') {
00131$:
	lda	hl,19(sp)
	ld	a,(hl+)
	ld	e,(hl)
	lda	hl,8(sp)
	ld	(hl+),a
	ld	(hl),e
00115$:
	lda	hl,8(sp)
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
;../_atol.c:43: rv = (rv * 10) + (*s - '0');
	push	bc
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
	ld	hl,#0x0000
	push	hl
	ld	hl,#0x000A
	push	hl
	call	__mullong_rrx_s
	lda	sp,8(sp)
	push	hl
	lda	hl,8(sp)
	ld	(hl),e
	inc	hl
	ld	(hl),d
	pop	de
	inc	hl
	ld	(hl),e
	inc	hl
	ld	(hl),d
	pop	bc
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
	lda	hl,0(sp)
	ld	(hl),c
	inc	hl
	ld	(hl),b
	ld	a,b
	rla	
	sbc	a,a
	inc	hl
	ld	(hl+),a
	ld	(hl+),a
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,e
	lda	hl,0(sp)
	add	a,(hl)
	ld	e,a
	ld	a,d
	inc	hl
	adc	a,(hl)
	push	af
	ld	(hl-),a
	ld	(hl),e
	lda	hl,8(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	lda	hl,4(sp)
	pop	af
	ld	a,e
	adc	a,(hl)
	ld	e,a
	ld	a,d
	inc	hl
	adc	a,(hl)
	ld	(hl-),a
	ld	(hl),e
	dec	hl
	dec	hl
	ld	d,h
	ld	e,l
	lda	hl,13(sp)
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
;../_atol.c:44: s++;
	lda	hl,8(sp)
	inc	(hl)
	jr	NZ,00141$
	inc	hl
	inc	(hl)
00141$:
	jp	00115$
00117$:
;../_atol.c:47: return (sign ? -rv : rv);
	xor	a,a
	lda	hl,10(sp)
	or	a,(hl)
	jp	Z,00120$
	ld	de,#0x0000
	ld	a,e
	lda	hl,13(sp)
	sub	a,(hl)
	ld	e,a
	ld	a,d
	inc	hl
	sbc	a,(hl)
	push	af
	lda	hl,3(sp)
	ld	(hl-),a
	ld	(hl),e
	ld	de,#0x0000
	lda	hl,17(sp)
	pop	af
	ld	a,e
	sbc	a,(hl)
	ld	e,a
	ld	a,d
	inc	hl
	sbc	a,(hl)
	lda	hl,3(sp)
	ld	(hl-),a
	ld	(hl),e
	jp	00121$
00120$:
	lda	hl,13(sp)
	ld	d,h
	ld	e,l
	lda	hl,0(sp)
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
00121$:
	lda	hl,0(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	inc	hl
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
00118$:
	lda	sp,17(sp)
ret
	.area _CODE
	.area _CABS
