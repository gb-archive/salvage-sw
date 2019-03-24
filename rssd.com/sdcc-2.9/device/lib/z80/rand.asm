;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.0 #5416 (Apr  7 2010) (MINGW32)
; This file was generated Sun Apr 11 14:38:20 2010
;--------------------------------------------------------
	.module rand
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _rand
	.globl _srand
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
;  ram data
;--------------------------------------------------------
	.area _DATA
_next:
	.ds 4
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
;../rand.c:27: static unsigned long int next = 1;
	ld	iy,#_next
	ld	0 (iy),#0x01
	xor	a,a
	ld	iy,#_next
	ld	1 (iy),a
	ld	iy,#_next
	ld	2 (iy),a
	ld	iy,#_next
	ld	3 (iy),a
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;../rand.c:29: int rand(void)
;	---------------------------------
; Function rand
; ---------------------------------
_rand:
;../rand.c:31: next = next * 1103515245UL + 12345;
	ld	hl,(_next + 2)
	push	hl
	ld	hl,(_next)
	push	hl
	ld	hl,#0x41C6
	push	hl
	ld	hl,#0x41C64E6D
	push	hl
	call	__mullong_rrx_s
	pop	af
	pop	af
	pop	af
	pop	af
	ld	b,h
	ld	c,l
	ld	hl,#_next
	ld	a,c
	add	a,#0x39
	ld	(hl),a
	ld	a,b
	adc	a,#0x30
	inc	hl
	ld	(hl),a
	ld	a,e
	adc	a,#0x00
	inc	hl
	ld	(hl),a
	ld	a,d
	adc	a,#0x00
	inc	hl
	ld	(hl),a
;../rand.c:32: return (unsigned int)(next/65536) % (RAND_MAX + 1U);
	ld	a,#0x10
	push	af
	inc	sp
	ld	hl,(_next + 2)
	push	hl
	ld	hl,(_next)
	push	hl
	call	__rrulong_rrx_s
	pop	af
	pop	af
	inc	sp
	ld	b,h
	ld	c,l
	ld	l,c
	ld	a,b
	and	a,#0x7F
	ld	h,a
ret
;../rand.c:35: void srand(unsigned int seed)
;	---------------------------------
; Function srand
; ---------------------------------
_srand:
	push	ix
	ld	ix,#0
	add	ix,sp
;../rand.c:37: next = seed;
	ld	a,4 (ix)
	ld	iy,#_next
	ld	0 (iy),a
	ld	a,5 (ix)
	ld	iy,#_next
	ld	1 (iy),a
	ld	iy,#_next
	ld	2 (iy),#0x00
	ld	iy,#_next
	ld	3 (iy),#0x00
	pop	ix
ret
	.area _CODE
	.area _CABS
