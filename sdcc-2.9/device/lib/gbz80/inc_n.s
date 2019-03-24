    .area _CODE

.inc_n::
    ; hl address of data to increment
    ; b  #bytes in integer to increment
    ld      c,b
0$: inc     (hl)
    ret     nz
    inc     hl
    dec     c
    jr      nz,0$
    ret
