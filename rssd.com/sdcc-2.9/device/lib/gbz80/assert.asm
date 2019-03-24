;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.0 #5416 (Apr  7 2010) (MINGW32)
; This file was generated Fri Jun 11 23:46:59 2010
;--------------------------------------------------------
	.module assert
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl __assert
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
;../assert.c:4: void _assert(char *expr, const char *filename, unsigned int linenumber)
;	---------------------------------
; Function _assert
; ---------------------------------
__assert:
	
;../assert.c:6: printf("Assert(%s) failed at line %u in file %s.\n",
	lda	hl,4(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	lda	hl,8(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	lda	hl,6(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	ld	hl,#__str_0
	push	hl
	call	_printf
	lda	sp,8(sp)
;../assert.c:8: while(1);
00102$:
	jp	00102$
00104$:
	
ret
__str_0:
	.ascii "Assert(%s) failed at line %u in file %s."
	.db 0x0A
	.db 0x00
	.area _CODE
	.area _CABS
