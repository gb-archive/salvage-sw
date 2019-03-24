;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.0 #5416 (Apr  7 2010) (MINGW32)
; This file was generated Fri Jun 11 23:46:47 2010
;--------------------------------------------------------
	.module cotf
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _cotf
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
;../cotf.c:26: float cotf(const float x) _FLOAT_FUNC_REENTRANT
;	---------------------------------
; Function cotf
; ---------------------------------
_cotf:
	lda	sp,-8(sp)
;../cotf.c:30: y=fabsf(x);
	lda	hl,12(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	lda	hl,12(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	_fabsf
	lda	sp,4(sp)
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
;../cotf.c:31: if (y<1.0E-30) //This one requires more thinking...
	ld	hl,#0x0DA2
	push	hl
	ld	hl,#0x4260
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
	call	___fslt
	lda	sp,8(sp)
	ld	c,e
	xor	a,a
	or	a,c
	jp	Z,00105$
;../cotf.c:33: errno = ERANGE;
	ld	hl,#_errno
	ld	(hl),#0x22
	ld	hl,#_errno + 1
	ld	(hl),#0x00
;../cotf.c:34: if (x<0.0)
	ld	hl,#0x0000
	push	hl
	ld	hl,#0x0000
	push	hl
	lda	hl,16(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	lda	hl,16(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	___fslt
	lda	sp,8(sp)
	ld	c,e
	xor	a,a
	or	a,c
	jp	Z,00102$
;../cotf.c:35: return -HUGE_VALF;
	ld	de,#0xFFFF
	ld	hl,#0xFF7F
	jp	00106$
00102$:
;../cotf.c:37: return +HUGE_VALF;
	ld	de,#0xFFFF
	ld	hl,#0x7F7F
	jp	00106$
00105$:
;../cotf.c:39: return tancotf(x, 1);
	ld	hl,#0x0001
	push	hl
	lda	hl,14(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	lda	hl,14(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	_tancotf
	lda	sp,6(sp)
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
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	inc	hl
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
00106$:
	lda	sp,8(sp)
ret
	.area _CODE
	.area _CABS
