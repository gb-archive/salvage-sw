;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.0 #5416 (Apr  7 2010) (MINGW32)
; This file was generated Fri Jun 11 23:47:00 2010
;--------------------------------------------------------
	.module _setjmp
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _setjmp
	.globl _longjmp
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
;_setjmp.c:26: int setjmp (jmp_buf bufx)
;	---------------------------------
; Function setjmp
; ---------------------------------
_setjmp:
	
;_setjmp.c:42: __endasm;
	
		   ra = 0
		   buf = ra+2
	
	
		   lda hl,ra(sp)
		   ld d,h
		   ld e,l
		   lda hl,buf(sp)
		   ld a,(de)
		   inc de
		   ld (hl+),a
		   ld a,(de)
		   ld (hl),a
		   
;_setjmp.c:43: return 0;
	ld	de,#0x0000
00101$:
	
ret
;_setjmp.c:46: int longjmp (jmp_buf bufx, int rv)
;	---------------------------------
; Function longjmp
; ---------------------------------
_longjmp:
	
;_setjmp.c:62: __endasm;
	
		   ra = 0
		   buf = ra + 2
	
	
		   lda hl,buf(sp)
		   ld d,h
		   ld e,l
		   lda hl,buf(sp)
		   ld a,(de)
		   inc de
		   ld (hl+),a
		   ld a,(de)
		   ld (hl),a
		   
;_setjmp.c:63: return rv;
	lda	hl,4(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
00101$:
	
ret
	.area _CODE
	.area _CABS
