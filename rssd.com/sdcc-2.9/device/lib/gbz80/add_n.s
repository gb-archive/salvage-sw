    .area _CODE
    
.add_n::
    ; hl address of the value added
    ; de address of the value added to and result
    ; b  number of bytes to compare (preserved)
    ; enter with carry bit set/reset as desired
    ld      c,b
    xor     a           ; reset carry flag
0$: ld      a,(de)
    adc     (hl)
    ld      (de),a
    inc     hl
    inc     de
    dec     c
    jr      nz,0$
    ret
