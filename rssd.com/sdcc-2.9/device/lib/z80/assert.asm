;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.0 #5416 (Apr  7 2010) (MINGW32)
; This file was generated Sun Apr 11 14:38:29 2010
;--------------------------------------------------------
	.module assert
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl __assert
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
;../assert.c:4: void _assert(char *expr, const char *filename, unsigned int linenumber)
;	---------------------------------
; Function _assert
; ---------------------------------
__assert:
	push	ix
	ld	ix,#0
	add	ix,sp
;../assert.c:6: printf("Assert(%s) failed at line %u in file %s.\n",
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	ld	l,8 (ix)
	ld	h,9 (ix)
	push	hl
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	ld	hl,#__str_0
	push	hl
	call	_printf
	pop	af
	pop	af
	pop	af
	pop	af
;../assert.c:8: while(1);
00102$:
	jr	00102$
	pop	ix
ret
__str_0:
	.ascii "Assert(%s) failed at line %u in file %s."
	.db 0x0A
	.db 0x00
	.area _CODE
	.area _CABS
