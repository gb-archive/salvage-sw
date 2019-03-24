;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.0 #5416 (Apr  7 2010) (MINGW32)
; This file was generated Fri Jun 11 23:47:34 2010
;--------------------------------------------------------
	.module _fsmul
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl ___fsmul
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
;_fsmul.c:17: __fsmul (float u, float v) {
;	---------------------------------
; Function __fsmul
; ---------------------------------
___fsmul:
	
;_fsmul.c:253: __endasm;
	
		   .globl .mul8
		   .globl .chkzero
		   .globl .unpack
		   .globl .sla_n
	
		   ;; stack displacements
		   sign = 0
		   exp = sign + 1
		   ku = exp + 1
		   kv = ku + 1
		   up = kv + 1
		   vp = up + 2
		   rp = vp + 2
		   rp0 = rp + 2
	
		   r0 = rp0 + 2
		   r1 = r0 + 1
		   r2 = r1 + 1
		   r3 = r2 + 1
		   r4 = r3 + 1
		   r5 = r4 + 1
	
		   ra = r5 + 1 ; return address - 2 bytes
		   u0 = ra + 2
		   u1 = u0 + 1
		   u2 = u1 + 1
		   u3 = u2 + 1
		   v0 = u3 + 1
		   v1 = v0 + 1
		   v2 = v1 + 1
		   v3 = v2+1
	
		   u00 = u0 - ra
		   v00 = v0 - ra
	
		   ;; filter out the case where one of the operands is zero
		   lda hl,u00+3(sp)
		   call .fixsign
		   jp z,zexit
	
		   lda hl,v00+3(sp)
		   call .fixsign
		   jp z,zexit
	
		   lda sp,-18(sp)
	
		   ;; figure out the new sign and save it for later
		   lda hl,u3(sp)
		   ld a,(hl)
		   lda hl,v3(sp)
		   xor (hl) ; now the result sign is in the highorder bit
		   lda hl,sign(sp)
		   ld (hl),a
	
		   ;; unpack bits of u
		   lda hl,u3(sp) ; sign + exp
		   call .unpack
		   lda hl,exp(sp) ; save exp
		   ld (hl),a
	
		   ;; unpack bits of v and calculate exp
		   lda hl,v3(sp) ; sign + exp
		   call .unpack
		   lda hl,exp(sp) ; add exponents
		   add a,(hl)
		   sub a,#127 ; account for excess 127 notation
		   ld (hl),a ; save corrected exponent
	
		   lda hl,r0(sp) ; initialize result to zero
		   ld b,#6
		   call .zero_n
	
		   ;; start the actual multiplication
		   lda hl,r0(sp) ; rp0 = & r0;
		   ld d,h
		   ld e,l
		   lda hl,rp0(sp) ; rp0
		   ld (hl),e
		   inc hl
		   ld (hl),d
	
		   lda hl,kv(sp) ; kv = 3
		   ld (hl),#3
	
		   lda hl,v0(sp) ; vp = & v0;
		   ld d,h
		   ld e,l
		   lda hl,vp(sp)
		   ld (hl),e
		   inc hl
		   ld (hl),d
	
	0$:
;	loop{
		   lda hl,ku(sp) ; ku = 3
		   ld (hl),#3
	
		   lda hl,u0(sp) ; up = & u0;
		   ld d,h
		   ld e,l
		   lda hl,up(sp)
		   ld (hl),e
		   inc hl
		   ld (hl),d
	
		   lda hl,rp0(sp) ; rp = rp0;
		   ld e,(hl)
		   inc hl
		   ld d,(hl)
		   lda hl,rp(sp)
		   ld (hl),e
		   inc hl
		   ld (hl),d
	
	1$:
;	loop{
		   lda hl,up(sp)
		   ld a,(hl+) ;
		   ld h,(hl)
		   ld l,a
		   ld c,(hl)
	
		   lda hl,vp(sp)
		   ld a,(hl+) ;
		   ld h,(hl)
		   ld l,a
		   ld e,(hl)
	
		   call .mul8 ; x = *up * *vp;
	
		   lda hl,ku(sp)
		   ld c,(hl) ; int kt = ku
	
		   lda hl,rp(sp) ; UINT8 * rt = rp
		   ld a,(hl+)
		   ld h,(hl)
		   ld l,a ;
		   ld a,(hl)
		   add e ; *rt++ += x[0];
		   ld (hl+),a
	
		   ld a,(hl)
		   adc d ; *rt++ += x[1];
		   ld (hl+),a
		                       ;
	7$:
	jr	nc,2$ ; while(carry bit && --kt > 0)
		   dec c ;
		   jr z,2$
		   ld a,#0 ; *rt++ += carry;
		   adc (hl) ;
		   ld (hl+),a
		   jr 7$
	
	2$:
	lda	hl,ku(sp) ; if(--ku == 0)
		   dec (hl)
		   jr z,4$ ; break;
	
		   lda hl,rp(sp) ; ++rp;
		   inc (hl)
		   jr nz,6$
		   inc hl
		   inc (hl)
	
	6$:
	lda	hl,up(sp) ; ++up;
		   inc (hl)
		   jr nz,1$
		   inc hl
		   inc (hl)
	
		   jr 1$ ; }
	
	4$:
	lda	hl,kv(sp) ; if(--kv == 0)
		   dec (hl)
		   jr z,5$ ; break;
	
		   lda hl,rp0(sp) ; ++rp0;
		   inc (hl)
		   jr nz,11$
		   inc hl
		   inc (hl)
	
	11$:
	lda	hl,vp(sp) ; ++vp;
		   inc (hl)
		   jr nz,0$
		   inc hl
		   inc (hl)
		   jp 0$ ; }
	
	5$:
;;	leave result in normalized form with space for lsb of exponent
		   lda hl,r5(sp) ; if msb is 0
		   ld a,(hl)
		   rla
		   jr c,12$
		   ld b,#4
		   lda hl,r2(sp) ; shift significand 1 bit to the left
		   call .sla_n
		   jr 3$
	12$:
		   lda hl,exp(sp) ; increment the exponent
		   inc (hl)
	
	3$:
	lda	hl,sign(sp) ; retrieve the new sign
		   ld a,(hl+)
		   rl a ; and leave it in the carry bit
	
		   ;; put result back into ieee single precision format
		   ld a,(hl) ; load exp
		   rra ; insert sign in msb of exp and leave lsb of exp in carry
		   ld b,a
	
		   push af
		   lda hl,r3+2(sp) ; setup return value in h,l,d,e
		   ld a,(hl+)
		   ld e,a
		   ld a,(hl+)
		   ld d,a
		   ld l,(hl)
		   ld h,b
		   pop af
		   rl l ; put carry (lsb of exp) into bit zero
		   rrc l ; put bit zero back into high order bit
	
		   lda sp,18(sp)
	
		   ret
	
	zexit:
		   ;; return zero in the appropriate registers
		   xor a
		   ld e,a
		   ld d,a
		   ld l,a
		   ld h,a
		   
00101$:
	
ret
	.area _CODE
	.area _CABS
