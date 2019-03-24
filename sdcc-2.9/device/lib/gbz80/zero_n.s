    .area _CODE
    
.zero_n::
    ;; hl address of data to initialize(destroyed)
    ;; b  #bytes to zero out (preserved)
    ld      c,b
    xor     a
0$: ld      (hl+),a
    dec     c
    jr      nz,0$
    ret
