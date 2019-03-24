	.area	_CODE

__mulschar_rrx_s::
    lda     hl,2(sp)    ; get arguments address
    ld      a,(hl+)
    ld      c,a         ; load multiplier
    ld      e,(hl)      ; and multiplicand
    
    ld      a,c         ; extend sign of multiplier
    rla
    sbc     a,a
    ld      b,a
    
    ld      a,e         ; extend sign of multiplicand
    rla
    sbc     a,a
    ld      d,a
    jr     .mul16

__muluchar_rrx_s::
    lda     hl,2(sp)    ; get from stack
    ld      a,(hl+)     ; load multiplier
    ld      c,a
    ld      e,(hl)      ; and multiplicand
    ; fall through

.mul8::
;; 8-bit multiplication
;;
;; Entry conditions
;;   C = multiplier
;;   E = multiplicand
;;
;; Exit conditions
;;   DE = product
;;
;; Register used: AF,BC,DE,HL

        xor     a
        ld      h,a
        ld      l,a
        ld      d,a
               
1$:     xor     a       ; reset carry bit
        rr      c       ; shift high order byte 
        jr      nc,4$
        add     hl,de   ; add in multiplicand

4$:     sla     e       ; multiply multiplicand by 2
        jr      z,5$    ; if it's zero we're done
        rl      d       ; 
        jr      1$
5$:     rl      d
        jr      nz,1$
        
6$:     ld      e,l     ; Return in DE
        ld      d,h
        ret

__mulint_rrx_s::
        lda     hl,2(sp)
        ld      e,(hl)
        inc     hl
        ld      d,(hl)
        inc     hl
        ld      c,(hl)
        inc     hl
        ld      b,(hl)

.mul16:
;; 16-bit multiplication
;;
;; Entry conditions
;;   BC = multiplier
;;   DE = multiplicand
;;
;; Exit conditions
;;   DE = product
;;
;; Register used: AF,BC,DE,HL
;;
;; note: this implementation is designed to be
;; faster on smaller numbers.  for example, in the case
;; where the arguments are 1 x 1, there will only be
;; one iteration. The worst case would be the normal
;; 16 iterations.

        ld      hl,#0
1$:     sra     b       ; shift high order byte 
        jr      nz,3$
        
        rr      c       ; shift low order byte
        jr      nc,2$
        add     hl,de   ; add in multiplicand
2$:     jr      z,9$
        jr      4$

3$:     rr      c       ; shift low order byte
        jr      nc,4$
        add     hl,de   ; add in multiplicand
                
4$:     sla     e       ; multiply multiplicand by 2
        jr      z,5$    ; if it's zero
        rl      d       ; 
        jr      1$
5$:     rl      d
        jr      nz,1$
        
9$:     ld      e,l     ; Return in DE
        ld      d,h
        ret

