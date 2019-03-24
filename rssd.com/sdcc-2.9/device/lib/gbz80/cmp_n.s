    ;; Stubs to match between function names
    .area   _CODE
    
.cmp_n::
    ; de address of the value from which we're subtracting (lsb) (u)
    ; hl address of the value which is being subtracted          (v)
    ; b  number of bytes to compare (preserved)
    ; z  => u == (v
    ; c  => u < v

    ; z  return value in z flag and c flag c => < nc => >=
    ld      c,b
    xor     a           ; reset carry flag
0$: ld      a,(de)
    sbc     (hl)
    inc     hl
    inc     de
    dec     c
    jr      nz,0$
    ret

