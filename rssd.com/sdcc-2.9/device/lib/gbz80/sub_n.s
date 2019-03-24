    .area _CODE
    
.sub_n::
    ; de address of the value from which we're subtracting & result
    ; hl address of the value which is being subtracted
    ; b  number of bytes to compare (preserved)
    ; enter with carry bit set/reset as desired
    ld      c,b
0$: ld      a,(de)
    sbc     (hl)
    ld      (de),a
    inc     hl
    inc     de
    dec     c
    jr      nz,0$
    ret
