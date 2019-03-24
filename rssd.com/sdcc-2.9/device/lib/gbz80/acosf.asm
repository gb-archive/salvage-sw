;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.0 #5416 (Apr  7 2010) (MINGW32)
; This file was generated Fri Jun 11 23:46:48 2010
;--------------------------------------------------------
	.module acosf
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _acosf
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
;../acosf.c:25: float acosf(const float x) _FLOAT_FUNC_REENTRANT
;	---------------------------------
; Function acosf
; ---------------------------------
_acosf:
	
	push	af
	push	af
;../acosf.c:27: if(x== 1.0) return 0.0;
	ld	hl,#0x3F80
	push	hl
	ld	hl,#0x0000
	push	hl
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
	call	___fseq
	lda	sp,8(sp)
	ld	c,e
	xor	a,a
	or	a,c
	jp	Z,00107$
	ld	de,#0x0000
	ld	hl,#0x0000
	jp	00109$
00107$:
;../acosf.c:28: else if(x==-1.0) return PI;
	ld	hl,#0xBF80
	push	hl
	ld	hl,#0x0000
	push	hl
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
	call	___fseq
	lda	sp,8(sp)
	ld	c,e
	xor	a,a
	or	a,c
	jp	Z,00104$
	ld	de,#0x0FDB
	ld	hl,#0x4049
	jp	00109$
00104$:
;../acosf.c:29: else if(x== 0.0) return HALF_PI;
	lda	hl,6(sp)
	ld	a,(hl+)
	or	a,(hl)
	inc	hl
	or	a,(hl)
	inc	hl
	or	a,(hl)
	jp	NZ,00108$
	ld	de,#0x0FDB
	ld	hl,#0x3FC9
	jp	00109$
00108$:
;../acosf.c:30: return asincosf(x,1);
	ld	hl,#0x0001
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
	call	_asincosf
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
00109$:
	lda	sp,4(sp)
ret
	.area _CODE
	.area _CABS
