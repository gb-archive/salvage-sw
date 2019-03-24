    .area _CODE
    
.set_n::
    ;; hl address of data to initialize(destroyed)
    ;; b  #bytes to zero out (preserved)
    ;; a  value to be used for initialization
    ld      c,b
0$: ld      (hl+),a
    dec     c
    jr      nz,0$
    ret
