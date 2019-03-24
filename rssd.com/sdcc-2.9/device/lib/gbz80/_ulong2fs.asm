;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.0 #5416 (Apr  7 2010) (MINGW32)
; This file was generated Fri Jun 11 23:46:42 2010
;--------------------------------------------------------
	.module _ulong2fs
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl ___ulong2fs
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
;../_ulong2fs.c:73: float __ulong2fs (unsigned long a )
;	---------------------------------
; Function __ulong2fs
; ---------------------------------
___ulong2fs:
	lda	sp,-14(sp)
;../_ulong2fs.c:78: if (!a)
	lda	hl,16(sp)
	ld	a,(hl+)
	or	a,(hl)
	inc	hl
	or	a,(hl)
	inc	hl
	or	a,(hl)
	jp	NZ,00115$
;../_ulong2fs.c:80: return 0.0;
	ld	de,#0x0000
	ld	hl,#0x0000
	jp	00111$
;../_ulong2fs.c:83: while (a & NORM) 
00115$:
	ld	bc,#0x0096
00103$:
	lda	hl,19(sp)
	ld	a,(hl)
	or	a,a
	jr	NZ,00121$
	jp	00117$
00121$:
;../_ulong2fs.c:86: a >>= 1;
	push	bc
	ld	a,#0x01
	push	af
	inc	sp
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
	call	__rrulong_rrx_s
	lda	sp,5(sp)
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
	lda	hl,4(sp)
	ld	d,h
	ld	e,l
	lda	hl,16(sp)
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
;../_ulong2fs.c:87: exp++;
	inc	bc
	jp	00103$
;../_ulong2fs.c:90: while (a < HIDDEN)
00117$:
	lda	hl,12(sp)
	ld	(hl),c
	inc	hl
	ld	(hl),b
00106$:
	lda	hl,16(sp)
	ld	a,(hl)
	sub	a,#0x00
	inc	hl
	ld	a,(hl)
	sbc	a,#0x00
	inc	hl
	ld	a,(hl)
	sbc	a,#0x80
	inc	hl
	ld	a,(hl)
	sbc	a,#0x00
	jp	NC,00120$
;../_ulong2fs.c:92: a <<= 1;
	ld	a,#0x01
	push	af
	inc	sp
	dec	hl
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	lda	hl,19(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	__rlulong_rrx_s
	lda	sp,5(sp)
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
	lda	hl,16(sp)
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
;../_ulong2fs.c:93: exp--;
	lda	hl,12(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	dec	de
	dec	hl
	ld	(hl),e
	inc	hl
	ld	(hl),d
	jp	00106$
00120$:
	lda	hl,12(sp)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
;../_ulong2fs.c:97: if ((a&0x7fffff)==0x7fffff) {
	lda	hl,16(sp)
	ld	a,(hl)
	lda	hl,0(sp)
	ld	(hl),a
	lda	hl,17(sp)
	ld	a,(hl)
	lda	hl,1(sp)
	ld	(hl),a
	lda	hl,18(sp)
	ld	a,(hl)
	and	a,#0x7F
	lda	hl,2(sp)
	ld	(hl+),a
	ld	(hl),#0x00
	lda	hl,0(sp)
	ld	a,(hl)
	inc	a
	jp	NZ,00122$
	inc	hl
	ld	a,(hl)
	inc	a
	jp	NZ,00122$
	inc	hl
	ld	a,(hl)
	sub	a,#0x7F
	jp	NZ,00122$
	inc	hl
	ld	a,(hl)
	or	a,a
	jp	NZ,00122$
	jr	00123$
00122$:
	jp	00110$
00123$:
;../_ulong2fs.c:98: a=0;
	xor	a,a
	lda	hl,16(sp)
	ld	(hl+),a
	ld	(hl+),a
	ld	(hl+),a
	ld	(hl),a
;../_ulong2fs.c:99: exp++;
	lda	hl,12(sp)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	inc	bc
00110$:
;../_ulong2fs.c:103: a &= ~HIDDEN ;
	lda	hl,18(sp)
	ld	a,(hl)
	and	a,#0x7F
	ld	(hl),a
;../_ulong2fs.c:105: fl.l = PACK(0,(unsigned long)exp, a);
	lda	hl,8(sp)
	ld	a,l
	ld	d,h
	lda	hl,0(sp)
	ld	(hl+),a
	ld	(hl),d
	lda	hl,4(sp)
	ld	(hl),c
	inc	hl
	ld	(hl),b
	ld	a,b
	rla	
	sbc	a,a
	inc	hl
	ld	(hl+),a
	ld	(hl),a
	ld	a,#0x17
	push	af
	inc	sp
	dec	hl
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	lda	hl,7(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	__rlulong_rrx_s
	lda	sp,5(sp)
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
	ld	a,(hl)
	lda	hl,16(sp)
	or	a,(hl)
	lda	hl,4(sp)
	ld	(hl+),a
	ld	a,(hl)
	lda	hl,17(sp)
	or	a,(hl)
	lda	hl,5(sp)
	ld	(hl+),a
	ld	a,(hl)
	lda	hl,18(sp)
	or	a,(hl)
	lda	hl,6(sp)
	ld	(hl+),a
	ld	a,(hl)
	lda	hl,19(sp)
	or	a,(hl)
	lda	hl,7(sp)
	ld	(hl),a
	lda	hl,0(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	lda	hl,4(sp)
	ld	a,(hl)
	ld	(de),a
	inc	de
	inc	hl
	ld	a,(hl)
	ld	(de),a
	inc	de
	inc	hl
	ld	a,(hl)
	ld	(de),a
	inc	de
	inc	hl
	ld	a,(hl)
	ld	(de),a
;../_ulong2fs.c:107: return (fl.f);
	lda	hl,8(sp)
	ld	c,l
	ld	b,h
	ld	e,c
	ld	d,b
	ld	a,(de)
	lda	hl,0(sp)
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
	lda	hl,0(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	inc	hl
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
00111$:
	lda	sp,14(sp)
ret
	.area _CODE
	.area _CABS
