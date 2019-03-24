;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.0 #5416 (Apr  7 2010) (MINGW32)
; This file was generated Fri Jun 11 23:47:34 2010
;--------------------------------------------------------
	.module _fsdiv
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl ___fsdiv
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
;_fsdiv.c:4: float __fsdiv (float u, float v)
;	---------------------------------
; Function __fsdiv
; ---------------------------------
___fsdiv:
	
;_fsdiv.c:176: __endasm;
	
		   .globl .fixsign
		   .globl .unpack
		   .globl .zero_n
		   .globl .cmp_n
		   .globl .sla_n
		   .globl .sra_n
		   .globl .inc_n
		   .globl .sub_n
	
		   ;; stack displacements
		   sign = 0
		   exp = sign+1
		   m0 = exp+1
		   r0 = m0+4
		   ra = r0+4 ; return address - 2 bytes
		   u0 = ra+2
		   v0 = u0+4
	
		   lda sp,-10(sp)
	
		   ld b,#4
		   lda hl,r0(sp) ; initialize result to all zero
		   call .zero_n
	
		   ;; filter out the case where numerator is zero
		   lda hl,u0+3(sp)
		   call .fixsign
		   jr nz,0$
		   xor a
		   ld e,a
		   ld d,a
		   ld l,a
		   ld h,a
		   jp exit
	
		   ;; filter out the case where denominator is zero
	0$:
	lda	hl,v0+3(sp)
		   call .fixsign
		   jr nz,1$
		   ld a,#33
		   ld (_errno),a
		   xor a
		   ld e,a
		   ld d,a
		   ld l,#0xc0
		   ld h,#0x7f
		   jp exit
	
		   ;; figure out the new sign and save it for later
	1$:
	xor	a ; set errno = 0
		   ld (_errno),a
		   lda hl,u0+3(sp)
		   ld a,(hl)
		   lda hl,v0+3(sp)
		   xor (hl) ; now the result sign is in the highorder bit
		   lda hl,sign(sp)
		   ld (hl),a
	
		   ;; unpack bits of v and calculate exp
		   lda hl,v0+3(sp) ; sign + exp
		   call .unpack
		   lda hl,exp(sp) ; save exponent
		   ld (hl),a
	
		   ;; unpack bits of u
		   lda hl,u0+3(sp) ; sign + exp
		   call .unpack
		   lda hl,exp(sp) ; subtract exp v from exp u
		   sub a,(hl)
		   add a,#127 ; account for excess 127 notation
		   ld (hl),a ; save corrected exponent
	
		   ;; initialize guard bits to zero
		   xor a
		   lda hl,u0+3(sp)
		   ld (hl),a
		   lda hl,v0+3(sp)
		   ld (hl),a
	
		   ld b,#4 ; set width
	
	adjust:
		   ;; adjustments to maximise final precision
		   lda hl,u0(sp) ; if u < v
		   ld d,h
		   ld e,l
		   lda hl,v0(sp)
		   call .cmp_n
		   jr nc,div
		   lda hl,u0(sp) ; u <<= 1
		   xor a ; reset carry bit
		   call .sla_n
		   lda hl,exp(sp) ; exp--
		   dec (hl)
	
	div:
		   ld c,#25
		   push bc
	2$:
	lda	hl,u0 + 2(sp)
		   ld d,h
		   ld e,l
		   lda hl,v0 + 2(sp)
		   call .cmp_n ; if (v <= u){
		   jr c,3$
		   lda hl,u0 + 2(sp)
		   ld d,h
		   ld e,l
		   lda hl,v0 + 2(sp)
		   call .sub_n ; u -= v;
	3$:
		   ccf ; carry bit indicates the v <= u
		   rl d
		   lda hl,r0 + 2(sp)
		   rr d
		   call .sla_n ; result <<= carry bit
	
		   pop bc
		   dec c
		   jr z,round
		   push bc
		   xor a ; clear carry
		   lda hl,u0 + 2(sp); u <<= 1;
		   call .sla_n
		   jr 2$ ;}
	
	round:
		   lda hl,r0(sp)
		   call .inc_n ; round off result
		   xor a
		   lda hl,r0+3(sp)
		   call .sra_n
		   lda hl,r0(sp)
	
	pack:
		   ;; put back into ieee format
		   ;; entry hl = address of value to be returned
		   ld d,h
		   ld e,l
		   lda hl,sign(sp) ; retrieve the new sign
		   ld a,(hl+)
		   rl a ; and leave it in the carry bit
		   ld a,(hl) ; load exp
		   rr a ; insert sign in msb of exp and leave lsb of exp in carry
		   push af
		   ld hl,#3 ; leave u3 (v3) address in hl
		   add hl,de
		   ld (hl-),a ; save exponent in u3
		   pop af
		   jr c,1$
		   res 7,(hl) ; set msb of u2
		   jr 2$
	1$:
	set	7,(hl)
	2$:
	dec	hl
		   dec hl ; u0 (or v0)
	
		   ;; return the result in the appropriate registers
		   ld a,(hl+)
		   ld e,a
		   ld a,(hl+)
		   ld d,a
		   ld a,(hl+)
		   ld h,(hl)
		   ld l,a
	
	exit:
		   lda sp,10(sp)
		   
00101$:
	
ret
	.area _CODE
	.area _CABS
