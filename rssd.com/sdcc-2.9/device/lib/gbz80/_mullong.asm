;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.0 #5416 (Apr  7 2010) (MINGW32)
; This file was generated Fri Jun 11 23:47:03 2010
;--------------------------------------------------------
	.module _mullong
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl __mullong
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
;_mullong.c:2: _mullong (unsigned long u, unsigned long v){
;	---------------------------------
; Function _mullong
; ---------------------------------
__mullong:
	
;_mullong.c:37: __endasm;
	
		   .globl .mul_n
	
		   ;; stack displacements before argument setup
		   r0 = 0
		   ra = r0+4 ; return address - 2 bytes
		   u0 = ra+2
		   v0 = u0+4
	
		   lda sp,-4(sp)
		   lda hl,v0(sp)
		   push hl
		   lda hl,u0+2(sp)
		   push hl
		   lda hl,r0+4(sp)
		   push hl
	
		   ld b,#4
		   call .mul_n
	
		   lda sp,6(sp)
	
		   lda hl,r0(sp) ; get address of result
		   ld a,(hl+) ; return result in dehl
		   ld e,a
		   ld a,(hl+)
		   ld d,a
		   ld a,(hl+)
		   ld h,(hl)
		   ld l,a
	
		   lda sp,4(sp)
		   ret
	
		   
00101$:
	
ret
	.area _CODE
	.area _CABS
