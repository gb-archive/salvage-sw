    .area _CODE

; shift n bytes to the left by one bit
.sla_n::
    ; hl address of data to shift
    ; b  #bytes to shift (preserved)
    ; carry bit - rotated into lsb
    ld      c,b
0$: rl      (hl)
    inc     hl
    dec     c
    jr      nz,0$
    ret
