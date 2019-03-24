/* Floating point library in optimized assembly for gameboy processor
 * Copyright (c) 2009, Robert Ramey www.rrsd.com
 */

/* add two floats */
float __fsadd (float u, float v)
{
    //unsigned char exp;
    //unsigned char sign;
    __asm
    .globl  .fixsign
    .globl  .chkzero
    .globl  .unpack
    .globl  .add_n
    .globl  .sub_n
    .globl  .sra_n

    ;; stack displacements
	tos	=	0
	guard =	tos	+ 1	 ; just	so its	even for debugging
	sign =	guard +	1
	exp	=	sign + 1 ; difference between exponents
	ra	=	exp+1	 ; return address -	2 bytes
	u0	=	ra+2
	u1	=	u0+1
	u2	=	u1+1
	u3	=	u2+1
	v0	=	u3+1
	v1	=	v0+1
	v2	=	v1+1
	v3	=	v2+1

    locals = ra - tos

    signbitu  = 0
    signbitv  = 1

    lda     sp,-locals(sp)   ; save space for exp and sign

    xor     a
    lda     hl,sign(sp)
    ld      (hl),a

    ;; filter out the case where one of the operands is zero
    lda     hl,u0+3(sp) ; if u is zero
    call    .fixsign
    jr      nz,0$

    lda     hl,v0+3(sp) ; return v
    call    .fixsign    ; after fixing sign of v
    lda     hl,v0 (sp)  ; return v
    jp      exit

0$: lda     hl,v0+3(sp) ; if v is zero
    call    .fixsign
    jr      nz,1$

    lda     hl,u0(sp)   ; return u
    jp      exit
1$:

unpack_u:
    ;; unpack bits of u
    lda     hl,u3(sp)   ; sign + exp
    call    .unpack
    jr      nc,0$
    lda     hl,sign(sp)
    set     signbitu,(hl); save sign of u
0$:

unpack_v:
    ;; unpack bits of v and calculate exp
    lda     hl,v3(sp)   ; sign + exp
    call    .unpack
    jr      nc,0$
    lda     hl,sign(sp)
    set     signbitv,(hl); save sign of v
0$:

shift0:
    ;; subtract exp(u) from exp(v)
    lda     hl,v3(sp)
    ld      a,(hl)
    lda     hl,u3(sp)
    sub     (hl)
    lda     hl,exp(sp)
    ld      (hl),a
    ld      c,a
    and     a           ; properly set the z flag

    ;; shift the smaller of the two numbers to the right
    ;; until exponents match so that can be summed
    jr      z,invoke    ; if exp(v) - exp(u) == 0 jump to add
    sub     #24         ; if exp(v) - exp(u) > 24
    bit     7,a
    jp      nz,0$       
    lda     hl,v0(sp)   ; return v
    jp      pack
0$: bit     7,c         ; if exp(v) - exp(u) > 0
    jr      nz,1$
    ld      a,c
    lda     hl,u0(sp)   ; shift u to the right and add
    jr      shift
1$: ld      a,c         ; if exp(v) - exp(u) > -25
    sub     #-25
    bit     7,a
    jr      nz,$2
    ld      a,c
    cpl                 ; make shift count positive
    inc     a
    lda     hl,v0(sp)   ; shift v to the right and add
    jr      shift
$2: lda     hl,u0(sp)   ; exp(v) - exp(u) =< -25
    jp      pack        ; return u

shift:
    ; hl address of data to shift
    ;  a  number of bits to shift to the right
    ld      e,(hl)
    inc     hl
    ld      d,(hl)
    inc     hl
    ld      c,(hl)
    ld      b,a
    inc     hl
    add     (hl)        ; update exponent for shift
    ld      (hl),a
0$: and     a           ; reset carry flag
    rr      c
    rr      d
    rr      e
    dec     b
    jr      nz,0$
    ;; guard bit now found in carry flag
    dec     hl
    ld      (hl),c
    dec     hl
    ld      (hl),d
    dec     hl
    ld      (hl),e

invoke:
    ;; put the guard bit in a safe place
    rr      a
    lda     hl,guard(sp)
    ld      (hl),a

    lda     hl,sign(sp)
    ld      a,(hl)
    and     a           ; if signs are the same
    jr      z,add       ; add
    cp      #3
    jr      z,add       ; else subtract

subtract:
    lda     hl,guard(sp)
    ld      a,(hl)
    ;; u = u - v
    lda     hl,u0(sp)
    ld      d,h
    ld      e,l
    lda     hl,v0(sp)
    ld      b,#3
    rl      a           ; put guard into carry
    call    .sub_n

    jr      c,negate    ; result < 0
    lda     hl,guard(sp)
    ld      a,(hl)
    rl      a           ; put guard into carry
    jp      c,normalize ; if guard not = 0 cant be zero
    lda     hl,u0(sp)
    call    .chkzero
    jr      z,zero      ; result = 0
    jp      normalize   ; result > 0

zero:
    xor     a
    lda     hl,u3(sp)
    ld      (hl),a
    lda     hl,u0(sp)
    jp      exit

negate:
    lda     hl,sign(sp) ; reverse the result sign
    ld      a,(hl)
    cpl
    ld      (hl),a

    lda     hl,u0(sp)   ; negate the result
    xor     a        
    ld      b,a
    ld      c,#3
0$: sbc     (hl)    ; u?
    ld      (hl+),a
    ld      a,b
    dec     c
    jr      nz,0$
    dec     hl

    jp      normalize

add:
    lda     hl,guard(sp)
    ld      a,(hl)
    ;; u = u + v
    lda     hl,u0(sp)
    ld      d,h
    ld      e,l
    lda     hl,v0(sp)
    ld      b,#3
    rl      a           ; put guard into carry
    call    .add_n

    jr      nc,normalize

    ;; overflow - just shift one bit to the right
    lda     hl,u0+2(sp)
    call    .sra_n
    lda     hl,u0+3(sp)  ; increment the exponent
    inc     (hl)
    lda     hl,u0(sp)
    jr      pack

normalize:
    ;; shift left to eliminate leading zeros
    lda     hl,u0(sp)
    ld      e,(hl)
    inc     hl
    ld      d,(hl)
    inc     hl
    ld      c,(hl)
    inc     hl
    ld      b,(hl)

    lda     hl,guard(sp)
    ld      a,(hl)
    rl      a           ; put guard into carry
0$: bit     7,c
    jr      nz,1$
    rl      e
    rl      d
    rl      c
    dec     b
    jr      0$
1$: lda     hl,u0+3(sp)
    ld      (hl),b
    dec     hl
    ld      (hl),c
    dec     hl
    ld      (hl),d
    dec     hl
    ld      (hl),e

pack:
    ;; put back into ieee format
    ;; entry hl = address of u0 or v0
    ld      d,h
    ld      e,l
    lda     hl,sign(sp) ; retrieve the new sign
    ld      c,(hl)
    ld      hl,#3       ; leave u3 (v3) address in hl
    add     hl,de
    rr      c           ; leave sign in carry
    ld      a,(hl)      ; load exp
    rr      a           ; insert sign in msb of exp and leave lsb of exp in carry
    ld     (hl-),a      ; save exponent in u3 (v3)
    jr      c,1$
    res     7,(hl)      ; reset msb of u2 (v2)
    jr      2$
1$: set     7,(hl)      
2$: dec     hl
    dec     hl          ; u0 (or v0)

exit:
    ;; return the result in the appropriate registers
    ;; entry hl = address of low order byte (u0 or v0)
    ld      a,(hl+)
    ld      e,a
    ld      a,(hl+)
    ld      d,a
    ld      a,(hl+)
    ld      h,(hl)
    ld      l,a

	lda		sp,+locals(sp)
	__endasm;
}
