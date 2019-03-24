;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.0 #5416 (Apr  7 2010) (MINGW32)
; This file was generated Fri Jun 11 23:47:37 2010
;--------------------------------------------------------
	.module scalef
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _scalef
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
;scalef.c:4: float scalef(float x, char s)
;	---------------------------------
; Function scalef
; ---------------------------------
_scalef:
	
;scalef.c:34: __endasm;
	
		ra = 0
		   s = ra + 2
		x0 = s + 2
	
		   lda hl,s(sp);
		   ld a,(hl)
	
		lda hl,x0+3(sp)
		   ld d,(hl)
		   dec hl
		   ld e,(hl)
		   rl e ; put lsb of exponent in carry
		   rl d ; save sign in carry
		   push af
		   add d ; a contains the new exponent
		   pop af ; recover original sign
		   ld d,a
		   rr d ; put sign back into msb
		   rr e ; move lsb to 2nd byte
	
		lda hl,x0(sp)
		   ld c,(hl)
		   inc hl
		   ld b,(hl)
		   ld h,b
		   ld l,c
	
		
00101$:
	
ret
	.area _CODE
	.area _CABS
