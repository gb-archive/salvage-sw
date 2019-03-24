;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.0 #5416 (Apr  7 2010) (MINGW32)
; This file was generated Fri Jun 11 23:47:36 2010
;--------------------------------------------------------
	.module exponentf
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _exponentf
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
;exponentf.c:4: char exponentf(const float x)
;	---------------------------------
; Function exponentf
; ---------------------------------
_exponentf:
	
;exponentf.c:16: __endasm;
	
		ra = 0
		x0 = ra + 2
	
		lda hl,x0+3(sp)
		   ld e,(hl)
		   dec hl
		   ld a,(hl)
		   rl a ; put lsb of exponent in carry
		   rl e ; normalize exponent
		
00101$:
	
ret
	.area _CODE
	.area _CABS
