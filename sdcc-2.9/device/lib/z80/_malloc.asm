;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.0 #5416 (Apr  7 2010) (MINGW32)
; This file was generated Sun Apr 11 14:38:26 2010
;--------------------------------------------------------
	.module _malloc
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl __sdcc_heap_init
	.globl _malloc
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
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
	ld	hl,#__sdcc_heap_start
	ld	(hl),c
	inc	hl
	ld	(hl),b
;../_malloc.c:57: pbase->next->next = NULL; //And mark it as last
	ld	l,c
	ld	h,b
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
;../_malloc.c:58: pbase->prev       = NULL; //and mark first as first
	ld	hl, #__sdcc_heap_start + 2
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
;../_malloc.c:59: pbase->len        = 0;    //Empty and ready.
	ld	bc,#__sdcc_heap_start + 4
	ld	l,c
	ld	h,b
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
ret
;../_malloc.c:63: malloc (unsigned int size)
;	---------------------------------
; Function malloc
; ---------------------------------
_malloc:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-6
	add	hl,sp
	ld	sp,hl
;../_malloc.c:69: if (size>(0xFFFF-HEADER_SIZE))
	ld	a,#0xF9
	sub	a,4 (ix)
	ld	a,#0xFF
	sbc	a,5 (ix)
	jr	NC,00102$
;../_malloc.c:71: return NULL; //To prevent overflow in next line
	ld	hl,#0x0000
	jp	00117$
00102$:
;../_malloc.c:74: size += HEADER_SIZE; //We need a memory for header too
	ld	a,4 (ix)
	add	a,#0x06
	ld	4 (ix),a
	ld	a,5 (ix)
	adc	a,#0x00
	ld	5 (ix),a
;../_malloc.c:75: current_header = &_sdcc_heap_start;
	ld	-2 (ix),#<__sdcc_heap_start
	ld	-1 (ix),#>__sdcc_heap_start
;../_malloc.c:124: }
	ld	a,i
	di
	push	af
;../_malloc.c:79: while (1)
00108$:
;../_malloc.c:88: if ((((unsigned int)current_header->next) -
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	-6 (ix),e
	ld	-5 (ix),d
;../_malloc.c:89: ((unsigned int)current_header) -
	ld	c,-2 (ix)
	ld	b,-1 (ix)
	ld	a,-6 (ix)
	sub	a,c
	ld	-6 (ix),a
	ld	a,-5 (ix)
	sbc	a,b
	ld	-5 (ix),a
;../_malloc.c:90: current_header->len) >= size)
	ld	a,-2 (ix)
	add	a,#0x04
	ld	l, a
	ld	a, -1 (ix)
	adc	a, #0x00
	ld	h,a
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	a,-6 (ix)
	sub	a,c
	ld	c,a
	ld	a,-5 (ix)
	sbc	a,b
	ld	b,a
	ld	a,c
	sub	a,4 (ix)
	ld	a,b
	sbc	a,5 (ix)
	jr	C,00104$
;../_malloc.c:92: ret = &current_header->mem;
	ld	a,-2 (ix)
	add	a,#0x06
	ld	c,a
	ld	a,-1 (ix)
	adc	a,#0x00
	ld	b,a
;../_malloc.c:93: break;
	jr	00109$
00104$:
;../_malloc.c:95: current_header = current_header->next;    //else try next
	ld	-2 (ix),e
	ld	-1 (ix),d
;../_malloc.c:96: if (!current_header->next)
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,e
	or	a,d
	jp	NZ,00108$
;../_malloc.c:98: ret = NULL;
	ld	bc,#0x0000
;../_malloc.c:99: break;
00109$:
;../_malloc.c:103: if (ret)
	ld	a,c
	or	a,b
	jp	Z,00116$
;../_malloc.c:105: if (!current_header->len)
	ld	a,-2 (ix)
	add	a,#0x04
	ld	e,a
	ld	a,-1 (ix)
	adc	a,#0x00
	ld	d,a
	ld	l,e
	ld	h,a
	ld	a,(hl)
	ld	-6 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-5 (ix),a
	ld	a,-6 (ix)
	or	a,-5 (ix)
	jr	NZ,00113$
;../_malloc.c:107: current_header->len = size; //for first allocation
	ld	l,e
	ld	h,d
	ld	a,4 (ix)
	ld	(hl),a
	inc	hl
	ld	a,5 (ix)
	ld	(hl),a
	jp	00116$
00113$:
;../_malloc.c:112: new_header = (MEMHEADER * )((char *)current_header + current_header->len);
	ld	a,-2 (ix)
	add	a,-6 (ix)
	ld	e,a
	ld	a,-1 (ix)
	adc	a,-5 (ix)
	ld	d,a
	ld	-4 (ix),e
	ld	-3 (ix),d
;../_malloc.c:113: new_header->next = current_header->next; //and plug it into the chain
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),c
	inc	hl
	ld	(hl),b
;../_malloc.c:114: new_header->prev = current_header;
	ld	e,-4 (ix)
	ld	d,-3 (ix)
	ex	de,hl
	inc	hl
	inc	hl
	ld	a,-2 (ix)
	ld	(hl),a
	inc	hl
	ld	a,-1 (ix)
	ld	(hl),a
;../_malloc.c:115: current_header->next  = new_header;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	a,-4 (ix)
	ld	(hl),a
	inc	hl
	ld	a,-3 (ix)
	ld	(hl),a
;../_malloc.c:116: if (new_header->next)
	ld	a,c
	or	a,b
	jr	Z,00111$
;../_malloc.c:118: new_header->next->prev = new_header;
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ex	de,hl
	inc	hl
	inc	hl
	ld	a,-4 (ix)
	ld	(hl),a
	inc	hl
	ld	a,-3 (ix)
	ld	(hl),a
00111$:
;../_malloc.c:120: new_header->len  = size; //mark as used
	ld	a,-4 (ix)
	add	a,#0x04
	ld	e,a
	ld	a,-3 (ix)
	adc	a,#0x00
	ld	d,a
	ld	l,e
	ld	h,a
	ld	a,4 (ix)
	ld	(hl),a
	inc	hl
	ld	a,5 (ix)
	ld	(hl),a
;../_malloc.c:121: ret = &new_header->mem;
	ld	a,-4 (ix)
	add	a,#0x06
	ld	c,a
	ld	a,-3 (ix)
	adc	a,#0x00
	ld	b,a
00116$:
	pop	af
	jp	PO,00127$
	ei
00127$:
;../_malloc.c:125: return ret;
	ld	l,c
	ld	h,b
00117$:
	ld	sp,ix
	pop	ix
ret
	.area _CODE
	.area _CABS
