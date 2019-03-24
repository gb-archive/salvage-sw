    ;; Stubs to match between function names
    .area   _CODE
    .globl  .mul8
    .globl  .zero_n

.mul_n::
;   B = number of bytes to to multiply
;   (sp + 2) address of result u * v
;   (sp + 4) address of v
;   (sp + 6) address of u

    rp0 =   0
    up0 =   rp0 + 2
    kv  =   up0 + 2       ; counter to multiplicand
    ku  =   kv + 1        ;
    ra  =   ku + 1        ; return address
    rp  =   ra + 2        ; address of result
    vp  =   rp + 2        ; address of v (vptr)
    up  =   vp + 2        ; address of u (uptr)

    lda     sp,-6(sp); leave space for kv and ku
    
    lda     hl,up(sp)
    ld      e,(hl)       ;deref
    inc     hl
    ld      d,(hl)
    lda     hl,up0(sp)
    ld      (hl),e
    inc     hl
    ld      (hl),d
        
    lda     hl,rp(sp)
    ld      e,(hl)       ;deref
    inc     hl
    ld      d,(hl)
    lda     hl,rp0(sp)
    ld      (hl),e
    inc     hl
    ld      (hl),d
    
    ld      h,d         ; initialize result = 0
    ld      l,e
    call    .zero_n

    lda     hl,kv(sp); kv = n
    ld      (hl),b
    
0$:                 ;loop{
    lda     hl,kv(sp);   ku = kv
    ld      a,(hl)
    lda     hl,ku(sp)
    ld     (hl),a
1$:                 ;    loop{
                    ;        x = *up * *vp;
    lda     hl,up(sp);       up
    ld      a,(hl+) ;        deref up
    ld      h,(hl)
    ld      l,a
    ld      c,(hl)
    lda     hl,vp(sp)
    ld      a,(hl+) ;        deref vp
    ld      h,(hl)
    ld      l,a
    ld      e,(hl)
    call    .mul8

    lda     hl,ku(sp);       int kt = ku
    ld      c,(hl)
    
    lda     hl,rp(sp)
    ld      a,(hl+)  ;       deref
    ld      h,(hl)
    ld      l,a     ;        char * rt = rp;
    ld      a,(hl)  ;        *rt++ += x[0];
    add     e
    ld      (hl+),a
    dec     c       ;        if(--kt == 0)
    jr      z,4$    ;            break;   
    ld      a,(hl)  ;        *rt++ += x[1];
    adc     d
    ld      (hl+),a
    call    extend  ;        while(kt > 0)
                    ;           *rp++ += carry
                    
2$: lda     hl,ku(sp);       if(--ku == 0)
    dec     (hl)
    jr      z,4$    ;            break;
    
    lda     hl,up(sp);       ++up
    call    inc
    
    lda     hl,rp(sp);       ++rp
    call    inc
    
    jr      1$      ;     }
              
4$: lda     hl,kv(sp);    if(--kv == 0)
    dec     (hl)
    jr      z,5$    ;         break;
                    
    lda     hl,rp0(sp);   ++rp0
    call    inc
    
    lda     hl,vp(sp);}   ++vp
    call    inc
    
    push    bc
    ld      b,#2
    lda     hl,rp0+2(sp); rp0
    ld      d,h
    ld      e,l
    lda     hl,rp+2(sp);  rp = rp0
    call    copy
    
    lda     hl,up0+2(sp); up0
    ld      d,h
    ld      e,l
    lda     hl,up+2(sp);  up = up0
    call    copy
    pop     bc
    
    jp      0$      ;}

5$: lda     sp,6(sp); recover space for temporary variables
    ret

extend:
    dec     c       ;        while(--k > 0)
    ret     z   
    ld      a,#0    ;            *rp++ += carry;
    adc     (hl)    ;        
    ld      (hl+),a
    jr      extend
    
inc:
    inc     (hl)
    ret     nz
    inc     hl
    inc     (hl)
    ret

copy:               ;; copy data point to by DE to data pointed to by HL
    ld      c,b
0$:
    ld      a,(de)
    inc     de
    ld      (hl+),a
    dec     c
    jr      nz,0$
    ret
    
    