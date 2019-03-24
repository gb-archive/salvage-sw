    .area _CODE

.neg_n::
    ; hl address of data to negate
    ; b  #bytes in integer
    ld      c,b
    xor     a
    ld      d,a
0$: ld      a,d
    sbc     (hl)
    ld      (hl+),a
    dec     c
    jr      nz,0$
    ret
