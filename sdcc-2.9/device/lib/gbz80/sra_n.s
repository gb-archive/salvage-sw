    .area _CODE

; shift n bytes to the right by one bit
.sra_n::
    ; hl address of data to shift - high order byte !!!
    ; b  #bytes to shift (preserved)
    ld      c,b     ; copy byte count to temporary
    scf             ; reset carry
    ccf
0$: rr      (hl)
    dec     hl
    dec     c
    jr      nz,0$
    ret
