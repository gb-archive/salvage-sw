;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.0 #5416 (Apr  7 2010) (MINGW32)
; This file was generated Fri Jun 11 23:46:58 2010
;--------------------------------------------------------
	.module _malloc
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl __sdcc_heap_init
	.globl _malloc
;--------------------------------------------------------
;  ram data
;--------------------------------------------------------
	.area _DATA
;--------------------------------------------------------
; overlayable items in  ram 
;--------------------------------------------------------
	.area _OVERLAY
;--------------------------------------------------------
; external initialized ram data
;--------------------------------------------------------
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;../_malloc.c:51: _sdcc_heap_init(void)
;	---------------------------------
; Function _sdcc_heap_init
; ---------------------------------
__sdcc_heap_init:
	
;../_malloc.c:53: MEMHEADER *pbase = &_sdcc_heap_start;
;../_malloc.c:54: unsigned int size = &_sdcc_heap_end - (char *)pbase;
	ld	a,#<__sdcc_heap_end
	sub	a,#<__sdcc_heap_start
	ld	c,a
	ld	a,#>__sdcc_heap_end
	sbc	a,#>__sdcc_heap_start
	ld	b,a
;../_malloc.c:56: pbase->next = (MEMHEADER *)((char *)pbase + size - HEADER_SIZE);
	ld	hl,#__sdcc_heap_start
	add	hl,bc
	ld	c,l
	ld	b,h
	ld	a,c
	add	a,#0xFA
	ld	c,a
	ld	a,b
	adc	a,#0xFF
	ld	b,a
	ld	de,#__sdcc_heap_start
	ld	a,c
	ld	(de),a
	inc	de
	ld	a,b
	ld	(de),a
;../_malloc.c:57: pbase->next->next = NULL; //And mark it as last
	ld	e,c
	ld	d,b
	ld	a,#0x00
	ld	(de),a
	inc	de
	ld	a,#0x00
	ld	(de),a
;../_malloc.c:58: pbase->prev       = NULL; //and mark first as first
	ld	bc,#__sdcc_heap_start + 2
	ld	e,c
	ld	d,b
	ld	a,#0x00
	ld	(de),a
	inc	de
	ld	a,#0x00
	ld	(de),a
;../_malloc.c:59: pbase->len        = 0;    //Empty and ready.
	ld	bc,#__sdcc_heap_start + 4
	ld	e,c
	ld	d,b
	ld	a,#0x00
	ld	(de),a
	inc	de
	ld	a,#0x00
	ld	(de),a
00101$:
	
ret
;../_malloc.c:63: malloc (unsigned int size)
;	---------------------------------
; Function malloc
; ---------------------------------
_malloc:
	lda	sp,-10(sp)
;../_malloc.c:69: if (size>(0xFFFF-HEADER_SIZE))
	ld	a,#0xF9
	lda	hl,12(sp)
	sub	a,(hl)
	ld	a,#0xFF
	inc	hl
	sbc	a,(hl)
	jp	NC,00102$
;../_malloc.c:71: return NULL; //To prevent overflow in next line
	ld	de,#0x0000
	jp	00117$
00102$:
;../_malloc.c:74: size += HEADER_SIZE; //We need a memory for header too
	lda	hl,12(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x0006
	add	hl,de
	ld	a,l
	ld	d,h
	lda	hl,12(sp)
	ld	(hl+),a
	ld	(hl),d
;../_malloc.c:75: current_header = &_sdcc_heap_start;
	lda	hl,8(sp)
	ld	(hl),#<__sdcc_heap_start
	inc	hl
	ld	(hl),#>__sdcc_heap_start
;../_malloc.c:124: }
	di
;../_malloc.c:79: while (1)
00108$:
;../_malloc.c:88: if ((((unsigned int)current_header->next) -
	lda	hl,8(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	lda	hl,2(sp)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl-),a
	ld	a,(hl)
	dec	hl
	dec	hl
	ld	(hl),a
	lda	hl,3(sp)
	ld	a,(hl)
	dec	hl
	dec	hl
	ld	(hl),a
;../_malloc.c:89: ((unsigned int)current_header) -
	lda	hl,8(sp)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	lda	hl,0(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,e
	sub	a,c
	ld	e,a
	ld	a,d
	sbc	a,b
	ld	(hl-),a
	ld	(hl),e
;../_malloc.c:90: current_header->len) >= size)
	lda	hl,8(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x0004
	add	hl,de
	ld	c,l
	ld	b,h
	ld	e,c
	ld	d,b
	ld	a,(de)
	ld	c,a
	inc	de
	ld	a,(de)
	ld	b,a
	lda	hl,0(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,e
	sub	a,c
	ld	e,a
	ld	a,d
	sbc	a,b
	ld	b,a
	ld	c,e
	ld	a,c
	lda	hl,12(sp)
	sub	a,(hl)
	ld	a,b
	inc	hl
	sbc	a,(hl)
	jp	C,00104$
;../_malloc.c:92: ret = &current_header->mem;
	lda	hl,8(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x0006
	add	hl,de
	ld	a,l
	ld	d,h
	lda	hl,4(sp)
	ld	(hl+),a
	ld	(hl),d
;../_malloc.c:93: break;
	jp	00109$
00104$:
;../_malloc.c:95: current_header = current_header->next;    //else try next
	lda	hl,2(sp)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	lda	hl,8(sp)
	ld	(hl),c
	inc	hl
	ld	(hl),b
;../_malloc.c:96: if (!current_header->next)
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	c,a
	inc	de
	ld	a,(de)
	ld	b,a
	or	a,c
	jp	NZ,00108$
;../_malloc.c:98: ret = NULL;
	lda	hl,4(sp)
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
;../_malloc.c:99: break;
00109$:
;../_malloc.c:103: if (ret)
	lda	hl,4(sp)
	ld	a,(hl+)
	or	a,(hl)
	jp	Z,00116$
;../_malloc.c:105: if (!current_header->len)
	lda	hl,8(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x0004
	add	hl,de
	ld	c,l
	ld	b,h
	ld	e,c
	ld	d,b
	ld	a,(de)
	lda	hl,0(sp)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl-),a
	ld	a,(hl+)
	or	a,(hl)
	jp	NZ,00113$
;../_malloc.c:107: current_header->len = size; //for first allocation
	ld	e,c
	ld	d,b
	lda	hl,12(sp)
	ld	a,(hl)
	ld	(de),a
	inc	de
	inc	hl
	ld	a,(hl)
	ld	(de),a
	jp	00116$
00113$:
;../_malloc.c:112: new_header = (MEMHEADER * )((char *)current_header + current_header->len);
	lda	hl,8(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	lda	hl,0(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	add	hl,de
	ld	c,l
	ld	b,h
	lda	hl,6(sp)
	ld	(hl),c
	inc	hl
	ld	(hl),b
;../_malloc.c:113: new_header->next = current_header->next; //and plug it into the chain
	inc	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	lda	hl,0(sp)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl),a
	lda	hl,6(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	lda	hl,0(sp)
	ld	a,(hl)
	ld	(de),a
	inc	de
	inc	hl
	ld	a,(hl)
	ld	(de),a
;../_malloc.c:114: new_header->prev = current_header;
	lda	hl,6(sp)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	inc	bc
	inc	bc
	ld	e,c
	ld	d,b
	inc	hl
	ld	a,(hl)
	ld	(de),a
	inc	de
	inc	hl
	ld	a,(hl)
	ld	(de),a
;../_malloc.c:115: current_header->next  = new_header;
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	lda	hl,6(sp)
	ld	a,(hl)
	ld	(de),a
	inc	de
	inc	hl
	ld	a,(hl)
	ld	(de),a
;../_malloc.c:116: if (new_header->next)
	lda	hl,0(sp)
	ld	a,(hl+)
	or	a,(hl)
	jp	Z,00111$
;../_malloc.c:118: new_header->next->prev = new_header;
	lda	hl,6(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	c,a
	inc	de
	ld	a,(de)
	ld	b,a
	inc	bc
	inc	bc
	ld	e,c
	ld	d,b
	dec	hl
	ld	a,(hl)
	ld	(de),a
	inc	de
	inc	hl
	ld	a,(hl)
	ld	(de),a
00111$:
;../_malloc.c:120: new_header->len  = size; //mark as used
	lda	hl,6(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x0004
	add	hl,de
	ld	c,l
	ld	b,h
	ld	e,c
	ld	d,b
	lda	hl,12(sp)
	ld	a,(hl)
	ld	(de),a
	inc	de
	inc	hl
	ld	a,(hl)
	ld	(de),a
;../_malloc.c:121: ret = &new_header->mem;
	lda	hl,6(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x0006
	add	hl,de
	ld	a,l
	ld	d,h
	lda	hl,4(sp)
	ld	(hl+),a
	ld	(hl),d
00116$:
	ei
;../_malloc.c:125: return ret;
	lda	hl,4(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
00117$:
	lda	sp,10(sp)
ret
	.area _CODE
	.area _CABS
