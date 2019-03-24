;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.0 #5416 (Apr  7 2010) (MINGW32)
; This file was generated Fri Jun 11 23:47:33 2010
;--------------------------------------------------------
	.module printf_large
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl __print_format
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
;printf_large.c:73: static void output_digit( unsigned char n, BOOL lower_case, pfn_outputchar output_char, void* p )
;	---------------------------------
; Function output_digit
; ---------------------------------
_output_digit:
	
;printf_large.c:75: register unsigned char c = n + (unsigned char)'0';
	lda	hl,2(sp)
	ld	a,(hl)
	add	a,#0x30
	ld	c,a
;printf_large.c:77: if (c > (unsigned char)'9')
	ld	a,#0x39
	sub	a,c
	jp	NC,00104$
;printf_large.c:79: c += (unsigned char)('A' - '0' - 10);
	ld	a,c
	add	a,#0x07
	ld	c,a
;printf_large.c:80: if (lower_case)
	xor	a,a
	inc	hl
	or	a,(hl)
	jp	Z,00104$
;printf_large.c:81: c += (unsigned char)('a' - 'A');
	ld	a,c
	add	a,#0x20
	ld	c,a
00104$:
;printf_large.c:83: output_char( c, p );
	lda	hl,6(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	ld	a,c
	push	af
	inc	sp
	ld	hl,#00109$
	push	hl
	lda	hl,9(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	jp	(hl)
00109$:
	lda	sp,3(sp)
00105$:
	
	ret
;printf_large.c:89: static void output_2digits( unsigned char b, BOOL lower_case, pfn_outputchar output_char, void* p )
;	---------------------------------
; Function output_2digits
; ---------------------------------
_output_2digits:
	
;printf_large.c:91: output_digit( b>>4,   lower_case, output_char, p );
	lda	hl,2(sp)
	ld	c,(hl)
	srl	c
	srl	c
	srl	c
	srl	c
	lda	hl,6(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	lda	hl,6(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	lda	hl,7(sp)
	ld	a,(hl)
	push	af
	inc	sp
	ld	a,c
	push	af
	inc	sp
	call	_output_digit
	lda	sp,6(sp)
;printf_large.c:92: output_digit( b&0x0F, lower_case, output_char, p );
	lda	hl,2(sp)
	ld	a,(hl)
	and	a,#0x0F
	ld	c,a
	lda	hl,6(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	lda	hl,6(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	lda	hl,7(sp)
	ld	a,(hl)
	push	af
	inc	sp
	ld	a,c
	push	af
	inc	sp
	call	_output_digit
	lda	sp,6(sp)
00101$:
	
	ret
;printf_large.c:96: static void calculate_digit( value_t _AUTOMEM * value, unsigned char radix )
;	---------------------------------
; Function calculate_digit
; ---------------------------------
_calculate_digit:
	lda	sp,-13(sp)
;printf_large.c:98: unsigned long ul = value->ul;
	lda	hl,15(sp)
	ld	a,(hl+)
	ld	e,(hl)
	lda	hl,4(sp)
	ld	(hl+),a
	ld	(hl),e
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	lda	hl,9(sp)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl),a
;printf_large.c:99: unsigned char _AUTOMEM * pb4 = &value->byte[4];
	lda	hl,4(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x0004
	add	hl,de
	ld	a,l
	ld	d,h
	lda	hl,7(sp)
	ld	(hl+),a
	ld	(hl),d
;printf_large.c:102: do
	dec	hl
	dec	hl
	ld	(hl),#0x20
00103$:
;printf_large.c:104: *pb4 = (*pb4 << 1) | ((ul >> 31) & 0x01);
	lda	hl,7(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	c,a
	sla	c
	lda	hl,12(sp)
	ld	a,(hl)
	rlc	a
	and	a,#0x01
	ld	b,a
	or	a,c
	lda	hl,7(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	(de),a
;printf_large.c:105: ul <<= 1;
	ld	a,#0x01
	push	af
	inc	sp
	lda	hl,12(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	lda	hl,12(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	__rlulong_rrx_s
	lda	sp,5(sp)
	push	hl
	lda	hl,2(sp)
	ld	(hl),e
	inc	hl
	ld	(hl),d
	pop	de
	inc	hl
	ld	(hl),e
	inc	hl
	ld	(hl),d
	lda	hl,0(sp)
	ld	d,h
	ld	e,l
	lda	hl,9(sp)
	ld	a,(de)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl),a
;printf_large.c:107: if (radix <= *pb4 )
	lda	hl,7(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	c,a
	lda	hl,17(sp)
	sub	a,(hl)
	jp	C,00104$
;printf_large.c:109: *pb4 -= radix;
	lda	hl,7(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	c,a
	lda	hl,17(sp)
	sub	a,(hl)
	lda	hl,7(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	(de),a
;printf_large.c:110: ul |= 1;
	inc	hl
	ld	a,(hl)
	or	a,#0x01
	ld	(hl),a
00104$:
;printf_large.c:112: } while (--i);
	lda	hl,6(sp)
	dec	(hl)
	xor	a,a
	or	a,(hl)
	jp	NZ,00103$
;printf_large.c:113: value->ul = ul;
	dec	hl
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	lda	hl,9(sp)
	ld	a,(hl)
	ld	(de),a
	inc	de
	inc	hl
	ld	a,(hl)
	ld	(de),a
	inc	de
	inc	hl
	ld	a,(hl)
	ld	(de),a
	inc	de
	inc	hl
	ld	a,(hl)
	ld	(de),a
00106$:
	lda	sp,13(sp)
	ret
;printf_large.c:129: output_float (
;	---------------------------------
; Function output_float
; ---------------------------------
_output_float:
	ld	hl,#-164
	add	hl,sp
	ld	sp,hl
;printf_large.c:138: unsigned char charsOutputted = 0;
	ld	hl,#0x00A3
	add	hl,sp
	ld	(hl),#0x00
;printf_large.c:139: BOOL negative = 0;
	dec	hl
	ld	(hl),#0x00
;printf_large.c:143: char fpBI=0, fpBD;
	lda	hl,9(sp)
	ld	(hl),#0x00
;printf_large.c:147: if (f<0) {
	ld	hl,#0x0000
	push	hl
	ld	hl,#0x0000
	push	hl
	ld	hl,#0x00AC
	add	hl,sp
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	ld	hl,#0x00AC
	add	hl,sp
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	___fslt
	lda	sp,8(sp)
	ld	c,e
	xor	a,a
	or	a,c
	jp	Z,00102$
;printf_large.c:148: negative=1;
	ld	hl,#0x00A2
	add	hl,sp
	ld	(hl),#0x01
;printf_large.c:149: f=-f;
	ld	hl,#0x00A9
	add	hl,sp
	ld	a,(hl)
	xor	a,#0x80
	ld	(hl),a
	ld	hl,#0x00A6
	add	hl,sp
	ld	a,(hl)
	ld	(hl+),a
	ld	a,(hl)
	ld	(hl+),a
	ld	a,(hl)
	ld	(hl),a
00102$:
;printf_large.c:152: if (f>0x00ffffff) {
	ld	hl,#0x4B7F
	push	hl
	ld	hl,#0xFFFF
	push	hl
	ld	hl,#0x00AC
	add	hl,sp
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	ld	hl,#0x00AC
	add	hl,sp
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	___fsgt
	lda	sp,8(sp)
	ld	c,e
	xor	a,a
	or	a,c
	jp	Z,00111$
;printf_large.c:156: for (exp = 0; f >= 10.0; exp++) f /=10.0;
	ld	b,#0x00
00176$:
	push	bc
	ld	hl,#0x4120
	push	hl
	ld	hl,#0x0000
	push	hl
	ld	hl,#0x00AE
	add	hl,sp
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	ld	hl,#0x00AE
	add	hl,sp
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	___fslt
	lda	sp,8(sp)
	ld	c,e
	pop	af
	ld	b,a
	xor	a,a
	or	a,c
	jp	NZ,00197$
	push	bc
	ld	hl,#0x4120
	push	hl
	ld	hl,#0x0000
	push	hl
	ld	hl,#0x00AE
	add	hl,sp
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	ld	hl,#0x00AE
	add	hl,sp
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	___fsdiv
	lda	sp,8(sp)
	push	hl
	lda	hl,19(sp)
	ld	(hl),e
	inc	hl
	ld	(hl),d
	pop	de
	inc	hl
	ld	(hl),e
	inc	hl
	ld	(hl),d
	pop	bc
	lda	hl,15(sp)
	ld	d,h
	ld	e,l
	ld	hl,#0x00A6
	add	hl,sp
	ld	a,(de)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl),a
	inc	b
	jp	00176$
00197$:
00180$:
;printf_large.c:157: for (       ; f < 1.0;   exp--) f *=10.0;
	push	bc
	ld	hl,#0x3F80
	push	hl
	ld	hl,#0x0000
	push	hl
	ld	hl,#0x00AE
	add	hl,sp
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	ld	hl,#0x00AE
	add	hl,sp
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	___fslt
	lda	sp,8(sp)
	ld	c,e
	pop	af
	ld	b,a
	xor	a,a
	or	a,c
	jp	Z,00236$
	push	bc
	ld	hl,#0x00AA
	add	hl,sp
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	ld	hl,#0x00AA
	add	hl,sp
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	ld	hl,#0x4120
	push	hl
	ld	hl,#0x0000
	push	hl
	call	___fsmul
	lda	sp,8(sp)
	push	hl
	lda	hl,19(sp)
	ld	(hl),e
	inc	hl
	ld	(hl),d
	pop	de
	inc	hl
	ld	(hl),e
	inc	hl
	ld	(hl),d
	pop	bc
	lda	hl,15(sp)
	ld	d,h
	ld	e,l
	ld	hl,#0x00A6
	add	hl,sp
	ld	a,(de)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl),a
	dec	b
	jp	00180$
00236$:
;printf_large.c:159: if (negative) {
	xor	a,a
	ld	hl,#0x00A2
	add	hl,sp
	or	a,(hl)
	jp	Z,00106$
;printf_large.c:160: OUTPUT_CHAR ('-', p);
	push	bc
	ld	hl,#0x00B4
	add	hl,sp
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	ld	a,#0x2D
	push	af
	inc	sp
	ld	hl,#00244$
	push	hl
	ld	hl,#0x00B7
	add	hl,sp
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	jp	(hl)
00244$:
	lda	sp,3(sp)
	pop	bc
	ld	hl,#0x00A3
	add	hl,sp
	ld	(hl),#0x01
	jp	00107$
00106$:
;printf_large.c:162: if (sign) {
	xor	a,a
	ld	hl,#0x00AE
	add	hl,sp
	or	a,(hl)
	jp	Z,00107$
;printf_large.c:163: OUTPUT_CHAR ('+', p);
	push	bc
	ld	hl,#0x00B4
	add	hl,sp
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	ld	a,#0x2B
	push	af
	inc	sp
	ld	hl,#00245$
	push	hl
	ld	hl,#0x00B7
	add	hl,sp
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	jp	(hl)
00245$:
	lda	sp,3(sp)
	pop	bc
	ld	hl,#0x00A3
	add	hl,sp
	ld	(hl),#0x01
00107$:
;printf_large.c:166: charsOutputted += OUTPUT_FLOAT(f, 0, reqDecimals, 0, 0, 0, 0);
	push	bc
	ld	hl,#0x00B4
	add	hl,sp
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	ld	hl,#0x00B4
	add	hl,sp
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	ld	hl,#0x0000
	push	hl
	ld	l, #0x00
	push	hl
	ld	hl,#0x00B5
	add	hl,sp
	ld	a,(hl)
	push	af
	inc	sp
	ld	a,#0x00
	push	af
	inc	sp
	ld	hl,#0x00B4
	add	hl,sp
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	ld	hl,#0x00B4
	add	hl,sp
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	_output_float
	lda	sp,14(sp)
	ld	c,e
	pop	af
	ld	b,a
	ld	hl,#0x00A3
	add	hl,sp
	ld	a,(hl)
	add	a,c
	ld	(hl),a
;printf_large.c:167: OUTPUT_CHAR ('e', p);
	push	bc
	ld	hl,#0x00B4
	add	hl,sp
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	ld	a,#0x65
	push	af
	inc	sp
	ld	hl,#00246$
	push	hl
	ld	hl,#0x00B7
	add	hl,sp
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	jp	(hl)
00246$:
	lda	sp,3(sp)
	pop	bc
	ld	hl,#0x00A3
	add	hl,sp
	inc	(hl)
;printf_large.c:168: if (exp<0) {
	ld	a,b
	bit	7,a
	jp	Z,00109$
;printf_large.c:169: OUTPUT_CHAR ('-', p);
	push	bc
	ld	hl,#0x00B4
	add	hl,sp
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	ld	a,#0x2D
	push	af
	inc	sp
	ld	hl,#00247$
	push	hl
	ld	hl,#0x00B7
	add	hl,sp
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	jp	(hl)
00247$:
	lda	sp,3(sp)
	pop	bc
	ld	hl,#0x00A3
	add	hl,sp
	inc	(hl)
;printf_large.c:170: exp = -exp;
	xor	a,a
	sbc	a,b
	ld	b,a
00109$:
;printf_large.c:172: OUTPUT_CHAR ('0'+exp/10, p);
	push	bc
	ld	a,#0x0A
	push	af
	inc	sp
	push	bc
	inc	sp
	call	__divuschar_rrx_s
	lda	sp,2(sp)
	ld	c,e
	pop	af
	ld	b,a
	ld	a,c
	add	a,#0x30
	ld	c,a
	push	bc
	ld	hl,#0x00B4
	add	hl,sp
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	ld	a,c
	push	af
	inc	sp
	ld	hl,#00248$
	push	hl
	ld	hl,#0x00B7
	add	hl,sp
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	jp	(hl)
00248$:
	lda	sp,3(sp)
	pop	bc
	ld	hl,#0x00A3
	add	hl,sp
	inc	(hl)
;printf_large.c:173: OUTPUT_CHAR ('0'+exp%10, p);
	ld	a,#0x0A
	push	af
	inc	sp
	push	bc
	inc	sp
	call	__moduschar_rrx_s
	lda	sp,2(sp)
	ld	c,e
	ld	a,c
	add	a,#0x30
	ld	c,a
	ld	hl,#0x00B2
	add	hl,sp
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	ld	a,c
	push	af
	inc	sp
	ld	hl,#00249$
	push	hl
	ld	hl,#0x00B5
	add	hl,sp
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	jp	(hl)
00249$:
	lda	sp,3(sp)
	ld	hl,#0x00A3
	add	hl,sp
	inc	(hl)
;printf_large.c:174: return charsOutputted;
	ld	e,(hl)
	jp	00188$
00111$:
;printf_large.c:178: integerPart=f;
	ld	hl,#0x00A8
	add	hl,sp
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	ld	hl,#0x00A8
	add	hl,sp
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	___fs2ulong
	lda	sp,4(sp)
	push	hl
	ld	hl,#0x00A0
	add	hl,sp
	ld	(hl),e
	inc	hl
	ld	(hl),d
	pop	de
	inc	hl
	ld	(hl),e
	inc	hl
	ld	(hl),d
;printf_large.c:179: decimalPart=f-integerPart;
	ld	hl,#0x00A0
	add	hl,sp
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	ld	hl,#0x00A0
	add	hl,sp
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	___ulong2fs
	lda	sp,4(sp)
	push	hl
	lda	hl,17(sp)
	ld	(hl),e
	inc	hl
	ld	(hl),d
	pop	de
	inc	hl
	ld	(hl),e
	inc	hl
	ld	(hl),d
	lda	hl,17(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	lda	hl,17(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	ld	hl,#0x00AC
	add	hl,sp
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	ld	hl,#0x00AC
	add	hl,sp
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	___fssub
	lda	sp,8(sp)
	push	hl
	ld	hl,#0x009C
	add	hl,sp
	ld	(hl),e
	inc	hl
	ld	(hl),d
	pop	de
	inc	hl
	ld	(hl),e
	inc	hl
	ld	(hl),d
;printf_large.c:182: while (integerPart) {
	lda	hl,26(sp)
	ld	a,l
	ld	d,h
	lda	hl,15(sp)
	ld	(hl+),a
	ld	(hl),d
	ld	b,#0x00
00112$:
	ld	hl,#0x009E
	add	hl,sp
	ld	a,(hl+)
	or	a,(hl)
	inc	hl
	or	a,(hl)
	inc	hl
	or	a,(hl)
	jp	Z,00237$
;printf_large.c:183: fpBuffer[fpBI++]='0' + integerPart%10;
	ld	c,b
	inc	b
	lda	hl,9(sp)
	ld	(hl),b
	lda	hl,15(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	l,c
	ld	h,#0x00
	add	hl,de
	ld	a,l
	ld	d,h
	lda	hl,13(sp)
	ld	(hl+),a
	ld	(hl),d
	push	bc
	ld	hl,#0x0000
	push	hl
	ld	hl,#0x000A
	push	hl
	ld	hl,#0x00A6
	add	hl,sp
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	ld	hl,#0x00A6
	add	hl,sp
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	__modulong_rrx_s
	lda	sp,8(sp)
	push	hl
	lda	hl,13(sp)
	ld	(hl),e
	inc	hl
	ld	(hl),d
	pop	de
	inc	hl
	ld	(hl),e
	inc	hl
	ld	(hl),d
	pop	bc
	lda	hl,9(sp)
	ld	c,(hl)
	ld	a,c
	add	a,#0x30
	lda	hl,13(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	(de),a
;printf_large.c:184: integerPart /= 10;
	push	bc
	ld	hl,#0x0000
	push	hl
	ld	hl,#0x000A
	push	hl
	ld	hl,#0x00A6
	add	hl,sp
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	ld	hl,#0x00A6
	add	hl,sp
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	__divulong_rrx_s
	lda	sp,8(sp)
	push	hl
	lda	hl,13(sp)
	ld	(hl),e
	inc	hl
	ld	(hl),d
	pop	de
	inc	hl
	ld	(hl),e
	inc	hl
	ld	(hl),d
	pop	bc
	lda	hl,9(sp)
	ld	d,h
	ld	e,l
	ld	hl,#0x009E
	add	hl,sp
	ld	a,(de)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl),a
	jp	00112$
00237$:
	lda	hl,9(sp)
	ld	(hl),b
;printf_large.c:186: if (!fpBI) {
	xor	a,a
	or	a,b
	jp	NZ,00116$
;printf_large.c:188: fpBuffer[fpBI++]='0';
	ld	a,b
	inc	a
	ld	(hl),a
	lda	hl,15(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	l,b
	ld	h,#0x00
	add	hl,de
	ld	c,l
	ld	b,h
	ld	a,#0x30
	ld	(bc),a
00116$:
;printf_large.c:192: if (reqDecimals==-1)
	ld	hl,#0x00AB
	add	hl,sp
	ld	a,(hl)
	inc	a
	jp	NZ,00250$
	jr	00251$
00250$:
	jp	00118$
00251$:
;printf_large.c:193: reqDecimals=DEFAULT_FLOAT_PRECISION;
	ld	hl,#0x00AB
	add	hl,sp
	ld	(hl),#0x06
00118$:
;printf_large.c:198: for (i=reqDecimals; i>1; i--) {
	ld	hl,#0x00AB
	add	hl,sp
	ld	c,(hl)
	lda	hl,9(sp)
	ld	b,(hl)
	lda	hl,24(sp)
	ld	(hl),c
00184$:
	ld	a,#0x01
	lda	hl,24(sp)
	sub	a,(hl)
	jp	NC,00238$
;printf_large.c:199: decimalPart *= 10.0;
	push	bc
	ld	hl,#0x009E
	add	hl,sp
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	ld	hl,#0x009E
	add	hl,sp
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	ld	hl,#0x4120
	push	hl
	ld	hl,#0x0000
	push	hl
	call	___fsmul
	lda	sp,8(sp)
	push	hl
	lda	hl,9(sp)
	ld	(hl),e
	inc	hl
	ld	(hl),d
	pop	de
	inc	hl
	ld	(hl),e
	inc	hl
	ld	(hl),d
	pop	bc
	lda	hl,5(sp)
	ld	d,h
	ld	e,l
	ld	hl,#0x009A
	add	hl,sp
	ld	a,(de)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl),a
;printf_large.c:201: integerPart=decimalPart;
	push	bc
	ld	hl,#0x009E
	add	hl,sp
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	ld	hl,#0x009E
	add	hl,sp
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	___fs2ulong
	lda	sp,4(sp)
	push	hl
	lda	hl,9(sp)
	ld	(hl),e
	inc	hl
	ld	(hl),d
	pop	de
	inc	hl
	ld	(hl),e
	inc	hl
	ld	(hl),d
	pop	bc
	lda	hl,5(sp)
	ld	d,h
	ld	e,l
	ld	hl,#0x009E
	add	hl,sp
	ld	a,(de)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl),a
;printf_large.c:202: fpBuffer[fpBD++]='0' + integerPart;
	ld	c,b
	inc	b
	lda	hl,15(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	l,c
	ld	h,#0x00
	add	hl,de
	ld	a,l
	ld	d,h
	lda	hl,5(sp)
	ld	(hl+),a
	ld	(hl),d
	ld	hl,#0x009E
	add	hl,sp
	ld	c,(hl)
	ld	a,c
	add	a,#0x30
	lda	hl,5(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	(de),a
;printf_large.c:203: decimalPart-=integerPart;
	push	bc
	ld	hl,#0x00A2
	add	hl,sp
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	ld	hl,#0x00A2
	add	hl,sp
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	___ulong2fs
	lda	sp,4(sp)
	push	hl
	lda	hl,9(sp)
	ld	(hl),e
	inc	hl
	ld	(hl),d
	pop	de
	inc	hl
	ld	(hl),e
	inc	hl
	ld	(hl),d
	pop	bc
	push	bc
	lda	hl,9(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	lda	hl,9(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	ld	hl,#0x00A2
	add	hl,sp
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	ld	hl,#0x00A2
	add	hl,sp
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	___fssub
	lda	sp,8(sp)
	push	hl
	lda	hl,9(sp)
	ld	(hl),e
	inc	hl
	ld	(hl),d
	pop	de
	inc	hl
	ld	(hl),e
	inc	hl
	ld	(hl),d
	pop	bc
	lda	hl,5(sp)
	ld	d,h
	ld	e,l
	ld	hl,#0x009A
	add	hl,sp
	ld	a,(de)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl),a
;printf_large.c:198: for (i=reqDecimals; i>1; i--) {
	lda	hl,24(sp)
	dec	(hl)
	jp	00184$
00238$:
	lda	hl,24(sp)
	ld	a,(hl)
	lda	hl,5(sp)
	ld	(hl),a
;printf_large.c:205: if (i) {
	xor	a,a
	lda	hl,24(sp)
	or	a,(hl)
	jp	Z,00120$
;printf_large.c:208: decimalPart *= 10.0;
	push	bc
	ld	hl,#0x009E
	add	hl,sp
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	ld	hl,#0x009E
	add	hl,sp
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	ld	hl,#0x4120
	push	hl
	ld	hl,#0x0000
	push	hl
	call	___fsmul
	lda	sp,8(sp)
	push	hl
	lda	hl,5(sp)
	ld	(hl),e
	inc	hl
	ld	(hl),d
	pop	de
	inc	hl
	ld	(hl),e
	inc	hl
	ld	(hl),d
	pop	bc
	lda	hl,1(sp)
	ld	d,h
	ld	e,l
	ld	hl,#0x009A
	add	hl,sp
	ld	a,(de)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl),a
;printf_large.c:210: x = decimalPart + 0.5;
	push	bc
	ld	hl,#0x3F00
	push	hl
	ld	hl,#0x0000
	push	hl
	ld	hl,#0x00A2
	add	hl,sp
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	ld	hl,#0x00A2
	add	hl,sp
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	___fsadd
	lda	sp,8(sp)
	push	hl
	lda	hl,23(sp)
	ld	(hl),e
	inc	hl
	ld	(hl),d
	pop	de
	inc	hl
	ld	(hl),e
	inc	hl
	ld	(hl),d
	pop	bc
;printf_large.c:211: c = (unsigned char)x;
	push	bc
	lda	hl,23(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	lda	hl,23(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	___fs2uchar
	lda	sp,4(sp)
	ld	c,e
	pop	af
	ld	b,a
	lda	hl,23(sp)
	ld	(hl),c
;printf_large.c:212: fpBuffer[fpBD++] = '0' + c;
	lda	hl,15(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	l,b
	ld	h,#0x00
	add	hl,de
	ld	c,l
	ld	b,h
	lda	hl,23(sp)
	ld	a,(hl)
	add	a,#0x30
	ld	(bc),a
00120$:
;printf_large.c:215: minWidth=fpBI; // we need at least these
	lda	hl,9(sp)
	ld	a,(hl)
	lda	hl,25(sp)
	ld	(hl),a
;printf_large.c:216: minWidth+=reqDecimals?reqDecimals+1:0; // maybe these
	xor	a,a
	ld	hl,#0x00AB
	add	hl,sp
	or	a,(hl)
	jp	Z,00190$
	ld	b,(hl)
	inc	b
	jp	00191$
00190$:
	ld	b,#0x00
00191$:
	lda	hl,25(sp)
	ld	a,(hl)
	add	a,b
	ld	(hl),a
;printf_large.c:217: if (negative || sign || space)
	xor	a,a
	ld	hl,#0x00A2
	add	hl,sp
	or	a,(hl)
	jp	NZ,00121$
	xor	a,a
	ld	hl,#0x00AE
	add	hl,sp
	or	a,(hl)
	jp	NZ,00121$
	xor	a,a
	inc	hl
	or	a,(hl)
	jp	Z,00122$
00121$:
;printf_large.c:218: minWidth++; // and maybe even this :)
	lda	hl,25(sp)
	inc	(hl)
00122$:
;printf_large.c:220: if (!left && reqWidth>i) {
	xor	a,a
	ld	hl,#0x00AC
	add	hl,sp
	or	a,(hl)
	jp	NZ,00159$
	lda	hl,5(sp)
	ld	a,(hl)
	ld	hl,#0x00AA
	add	hl,sp
	sub	a,(hl)
	jp	NC,00159$
;printf_large.c:221: if (zero) {
	xor	a,a
	ld	hl,#0x00AD
	add	hl,sp
	or	a,(hl)
	jp	Z,00220$
;printf_large.c:222: if (negative)
	xor	a,a
	ld	hl,#0x00A2
	add	hl,sp
	or	a,(hl)
	jp	Z,00131$
;printf_large.c:224: OUTPUT_CHAR('-', p);
	ld	hl,#0x00B2
	add	hl,sp
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	ld	a,#0x2D
	push	af
	inc	sp
	ld	hl,#00252$
	push	hl
	ld	hl,#0x00B5
	add	hl,sp
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	jp	(hl)
00252$:
	lda	sp,3(sp)
	ld	hl,#0x00A3
	add	hl,sp
	ld	(hl),#0x01
	jp	00218$
00131$:
;printf_large.c:226: else if (sign)
	xor	a,a
	ld	hl,#0x00AE
	add	hl,sp
	or	a,(hl)
	jp	Z,00128$
;printf_large.c:228: OUTPUT_CHAR('+', p);
	ld	hl,#0x00B2
	add	hl,sp
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	ld	a,#0x2B
	push	af
	inc	sp
	ld	hl,#00253$
	push	hl
	ld	hl,#0x00B5
	add	hl,sp
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	jp	(hl)
00253$:
	lda	sp,3(sp)
	ld	hl,#0x00A3
	add	hl,sp
	ld	(hl),#0x01
	jp	00218$
00128$:
;printf_large.c:230: else if (space)
	xor	a,a
	ld	hl,#0x00AF
	add	hl,sp
	or	a,(hl)
	jp	Z,00218$
;printf_large.c:232: OUTPUT_CHAR(' ', p);
	ld	hl,#0x00B2
	add	hl,sp
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	ld	a,#0x20
	push	af
	inc	sp
	ld	hl,#00254$
	push	hl
	ld	hl,#0x00B5
	add	hl,sp
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	jp	(hl)
00254$:
	lda	sp,3(sp)
	ld	hl,#0x00A3
	add	hl,sp
	ld	(hl),#0x01
;printf_large.c:234: while (reqWidth-->minWidth)
00218$:
	ld	hl,#0x00A3
	add	hl,sp
	ld	b,(hl)
	ld	hl,#0x00AA
	add	hl,sp
	ld	a,(hl)
	lda	hl,1(sp)
	ld	(hl),a
00133$:
	lda	hl,1(sp)
	ld	c,(hl)
	dec	(hl)
	ld	a,(hl)
	ld	hl,#0x00AA
	add	hl,sp
	ld	(hl),a
	lda	hl,25(sp)
	ld	a,(hl)
	sub	a,c
	jp	NC,00239$
;printf_large.c:236: OUTPUT_CHAR('0', p);
	push	bc
	ld	hl,#0x00B4
	add	hl,sp
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	ld	a,#0x30
	push	af
	inc	sp
	ld	hl,#00255$
	push	hl
	ld	hl,#0x00B7
	add	hl,sp
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	jp	(hl)
00255$:
	lda	sp,3(sp)
	pop	bc
	inc	b
	jp	00133$
;printf_large.c:239: while (reqWidth-->minWidth)
00220$:
	lda	hl,0(sp)
	ld	(hl),#0x00
	ld	hl,#0x00AA
	add	hl,sp
	ld	b,(hl)
00136$:
	ld	c,b
	dec	b
	ld	hl,#0x00AA
	add	hl,sp
	ld	(hl),b
	lda	hl,25(sp)
	ld	a,(hl)
	sub	a,c
	jp	NC,00240$
;printf_large.c:241: OUTPUT_CHAR(' ', p);
	push	bc
	ld	hl,#0x00B4
	add	hl,sp
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	ld	a,#0x20
	push	af
	inc	sp
	ld	hl,#00256$
	push	hl
	ld	hl,#0x00B7
	add	hl,sp
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	jp	(hl)
00256$:
	lda	sp,3(sp)
	pop	bc
	lda	hl,0(sp)
	inc	(hl)
	jp	00136$
00240$:
	lda	hl,0(sp)
	ld	a,(hl)
	ld	hl,#0x00A3
	add	hl,sp
	ld	(hl),a
	ld	hl,#0x00AA
	add	hl,sp
	ld	(hl),b
;printf_large.c:243: if (negative)
	xor	a,a
	ld	hl,#0x00A2
	add	hl,sp
	or	a,(hl)
	jp	Z,00145$
;printf_large.c:245: OUTPUT_CHAR('-', p);
	ld	hl,#0x00B2
	add	hl,sp
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	ld	a,#0x2D
	push	af
	inc	sp
	ld	hl,#00257$
	push	hl
	ld	hl,#0x00B5
	add	hl,sp
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	jp	(hl)
00257$:
	lda	sp,3(sp)
	lda	hl,0(sp)
	ld	a,(hl)
	inc	a
	ld	hl,#0x00A3
	add	hl,sp
	ld	(hl),a
	jp	00160$
00145$:
;printf_large.c:247: else if (sign)
	xor	a,a
	ld	hl,#0x00AE
	add	hl,sp
	or	a,(hl)
	jp	Z,00142$
;printf_large.c:249: OUTPUT_CHAR('+', p);
	ld	hl,#0x00B2
	add	hl,sp
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	ld	a,#0x2B
	push	af
	inc	sp
	ld	hl,#00258$
	push	hl
	ld	hl,#0x00B5
	add	hl,sp
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	jp	(hl)
00258$:
	lda	sp,3(sp)
	lda	hl,0(sp)
	ld	a,(hl)
	inc	a
	ld	hl,#0x00A3
	add	hl,sp
	ld	(hl),a
	jp	00160$
00142$:
;printf_large.c:251: else if (space)
	xor	a,a
	ld	hl,#0x00AF
	add	hl,sp
	or	a,(hl)
	jp	Z,00160$
;printf_large.c:253: OUTPUT_CHAR(' ', p);
	ld	hl,#0x00B2
	add	hl,sp
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	ld	a,#0x20
	push	af
	inc	sp
	ld	hl,#00259$
	push	hl
	ld	hl,#0x00B5
	add	hl,sp
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	jp	(hl)
00259$:
	lda	sp,3(sp)
	lda	hl,0(sp)
	ld	a,(hl)
	inc	a
	ld	hl,#0x00A3
	add	hl,sp
	ld	(hl),a
	jp	00160$
00159$:
;printf_large.c:257: if (negative)
	xor	a,a
	ld	hl,#0x00A2
	add	hl,sp
	or	a,(hl)
	jp	Z,00156$
;printf_large.c:259: OUTPUT_CHAR('-', p);
	ld	hl,#0x00B2
	add	hl,sp
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	ld	a,#0x2D
	push	af
	inc	sp
	ld	hl,#00260$
	push	hl
	ld	hl,#0x00B5
	add	hl,sp
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	jp	(hl)
00260$:
	lda	sp,3(sp)
	ld	hl,#0x00A3
	add	hl,sp
	ld	(hl),#0x01
	jp	00160$
00156$:
;printf_large.c:261: else if (sign)
	xor	a,a
	ld	hl,#0x00AE
	add	hl,sp
	or	a,(hl)
	jp	Z,00153$
;printf_large.c:263: OUTPUT_CHAR('+', p);
	ld	hl,#0x00B2
	add	hl,sp
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	ld	a,#0x2B
	push	af
	inc	sp
	ld	hl,#00261$
	push	hl
	ld	hl,#0x00B5
	add	hl,sp
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	jp	(hl)
00261$:
	lda	sp,3(sp)
	ld	hl,#0x00A3
	add	hl,sp
	ld	(hl),#0x01
	jp	00160$
00153$:
;printf_large.c:265: else if (space)
	xor	a,a
	ld	hl,#0x00AF
	add	hl,sp
	or	a,(hl)
	jp	Z,00160$
;printf_large.c:267: OUTPUT_CHAR(' ', p);
	ld	hl,#0x00B2
	add	hl,sp
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	ld	a,#0x20
	push	af
	inc	sp
	ld	hl,#00262$
	push	hl
	ld	hl,#0x00B5
	add	hl,sp
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	jp	(hl)
00262$:
	lda	sp,3(sp)
	ld	hl,#0x00A3
	add	hl,sp
	ld	(hl),#0x01
;printf_large.c:293: return charsOutputted;
	jp	00160$
;printf_large.c:267: OUTPUT_CHAR(' ', p);
00239$:
	ld	hl,#0x00A3
	add	hl,sp
	ld	(hl),b
	lda	hl,1(sp)
	ld	a,(hl)
	ld	hl,#0x00AA
	add	hl,sp
	ld	(hl),a
00160$:
;printf_large.c:272: i=fpBI-1;
	lda	hl,9(sp)
	ld	a,(hl)
	dec	a
	lda	hl,5(sp)
	ld	(hl),a
;printf_large.c:273: do {
	ld	hl,#0x00A3
	add	hl,sp
	ld	a,(hl)
	lda	hl,0(sp)
	ld	(hl),a
	lda	hl,5(sp)
	ld	a,(hl)
	lda	hl,1(sp)
	ld	(hl),a
00162$:
;printf_large.c:274: OUTPUT_CHAR (fpBuffer[i], p);
	lda	hl,15(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	lda	hl,1(sp)
	ld	l,(hl)
	ld	h,#0x00
	add	hl,de
	ld	c,l
	ld	b,h
	ld	a,(bc)
	ld	c,a
	ld	hl,#0x00B2
	add	hl,sp
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	ld	a,c
	push	af
	inc	sp
	ld	hl,#00263$
	push	hl
	ld	hl,#0x00B5
	add	hl,sp
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	jp	(hl)
00263$:
	lda	sp,3(sp)
	lda	hl,0(sp)
	inc	(hl)
;printf_large.c:275: } while (i--);
	inc	hl
	ld	c,(hl)
	dec	(hl)
	xor	a,a
	or	a,c
	jp	NZ,00162$
;printf_large.c:278: if (reqDecimals) {
	dec	hl
	ld	a,(hl)
	ld	hl,#0x00A3
	add	hl,sp
	ld	(hl),a
	xor	a,a
	ld	hl,#0x00AB
	add	hl,sp
	or	a,(hl)
	jp	Z,00169$
;printf_large.c:279: OUTPUT_CHAR ('.', p);
	ld	hl,#0x00B2
	add	hl,sp
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	ld	a,#0x2E
	push	af
	inc	sp
	ld	hl,#00264$
	push	hl
	ld	hl,#0x00B5
	add	hl,sp
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	jp	(hl)
00264$:
	lda	sp,3(sp)
	lda	hl,0(sp)
	ld	a,(hl)
	inc	a
	ld	hl,#0x00A3
	add	hl,sp
	ld	(hl),a
;printf_large.c:281: while (reqDecimals--)
	lda	hl,9(sp)
	ld	a,(hl)
	lda	hl,24(sp)
	ld	(hl),a
	ld	hl,#0x00A3
	add	hl,sp
	ld	a,(hl)
	lda	hl,1(sp)
	ld	(hl),a
	ld	hl,#0x00AB
	add	hl,sp
	ld	a,(hl)
	lda	hl,0(sp)
	ld	(hl),a
00165$:
	lda	hl,0(sp)
	ld	c,(hl)
	dec	(hl)
	xor	a,a
	or	a,c
	jp	Z,00242$
;printf_large.c:283: OUTPUT_CHAR (fpBuffer[i++], p);
	lda	hl,24(sp)
	ld	c,(hl)
	inc	(hl)
	lda	hl,15(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	l,c
	ld	h,#0x00
	add	hl,de
	ld	c,l
	ld	b,h
	ld	a,(bc)
	ld	c,a
	ld	hl,#0x00B2
	add	hl,sp
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	ld	a,c
	push	af
	inc	sp
	ld	hl,#00265$
	push	hl
	ld	hl,#0x00B5
	add	hl,sp
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	jp	(hl)
00265$:
	lda	sp,3(sp)
	lda	hl,1(sp)
	inc	(hl)
	jp	00165$
00242$:
	lda	hl,1(sp)
	ld	a,(hl)
	ld	hl,#0x00A3
	add	hl,sp
	ld	(hl),a
00169$:
;printf_large.c:287: if (left && reqWidth>minWidth) {
	xor	a,a
	ld	hl,#0x00AC
	add	hl,sp
	or	a,(hl)
	jp	Z,00174$
	lda	hl,25(sp)
	ld	a,(hl)
	ld	hl,#0x00AA
	add	hl,sp
	sub	a,(hl)
	jp	NC,00174$
;printf_large.c:288: while (reqWidth-->minWidth)
	ld	hl,#0x00A3
	add	hl,sp
	ld	a,(hl)
	lda	hl,0(sp)
	ld	(hl),a
	ld	hl,#0x00AA
	add	hl,sp
	ld	b,(hl)
00170$:
	ld	c,b
	dec	b
	lda	hl,25(sp)
	ld	a,(hl)
	sub	a,c
	jp	NC,00243$
;printf_large.c:290: OUTPUT_CHAR(' ', p);
	push	bc
	ld	hl,#0x00B4
	add	hl,sp
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	ld	a,#0x20
	push	af
	inc	sp
	ld	hl,#00266$
	push	hl
	ld	hl,#0x00B7
	add	hl,sp
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	jp	(hl)
00266$:
	lda	sp,3(sp)
	pop	bc
	lda	hl,0(sp)
	inc	(hl)
	jp	00170$
00243$:
	lda	hl,0(sp)
	ld	a,(hl)
	ld	hl,#0x00A3
	add	hl,sp
	ld	(hl),a
00174$:
;printf_large.c:293: return charsOutputted;
	ld	hl,#0x00A3
	add	hl,sp
	ld	e,(hl)
00188$:
	ld	hl,#164
	add	hl,sp
	ld	sp,hl
	ret
;printf_large.c:296: int _print_format (pfn_outputchar pfn, void* pvoid, const char *format, va_list ap)
;	---------------------------------
; Function _print_format
; ---------------------------------
__print_format:
	lda	sp,-50(sp)
;printf_large.c:321: charsOutputted = 0;
	lda	hl,18(sp)
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
;printf_large.c:323: while( c=*format++ )
	lda	hl,22(sp)
	ld	c,l
	ld	b,h
	ld	hl,#0x0005
	add	hl,bc
	ld	a,l
	ld	d,h
	lda	hl,16(sp)
	ld	(hl+),a
	ld	(hl),d
00220$:
	lda	hl,56(sp)
	ld	a,(hl+)
	ld	e,(hl)
	lda	hl,14(sp)
	ld	(hl+),a
	ld	(hl),e
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	c,a
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x0001
	add	hl,de
	ld	a,l
	ld	d,h
	lda	hl,56(sp)
	ld	(hl+),a
	ld	(hl),d
	lda	hl,28(sp)
	ld	(hl),c
	xor	a,a
	or	a,c
	jp	Z,00222$
;printf_large.c:325: if ( c=='%' )
	ld	a,(hl)
	sub	a,#0x25
	jp	NZ,00300$
	jr	00301$
00300$:
	jp	00218$
00301$:
;printf_large.c:327: left_justify    = 0;
	lda	hl,49(sp)
	ld	(hl),#0x00
;printf_large.c:328: zero_padding    = 0;
	dec	hl
	ld	(hl),#0x00
;printf_large.c:329: prefix_sign     = 0;
	dec	hl
	ld	(hl),#0x00
;printf_large.c:330: prefix_space    = 0;
	dec	hl
	ld	(hl),#0x00
;printf_large.c:331: signed_argument = 0;
	dec	hl
	ld	(hl),#0x00
;printf_large.c:332: char_argument   = 0;
	dec	hl
	ld	(hl),#0x00
;printf_large.c:333: long_argument   = 0;
	dec	hl
	ld	(hl),#0x00
;printf_large.c:334: float_argument  = 0;
	dec	hl
	ld	(hl),#0x00
;printf_large.c:335: radix           = 0;
	lda	hl,32(sp)
	ld	(hl),#0x00
;printf_large.c:336: width           = 0;
	dec	hl
	ld	(hl),#0x00
;printf_large.c:337: decimals        = -1;
	dec	hl
	ld	(hl),#0xFF
;printf_large.c:339: get_conversion_spec:
	lda	hl,56(sp)
	ld	a,(hl+)
	ld	e,(hl)
	lda	hl,14(sp)
	ld	(hl+),a
	ld	(hl),e
00101$:
;printf_large.c:341: c = *format++;
	lda	hl,14(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	c,a
	dec	hl
	inc	(hl)
	jr	NZ,00302$
	inc	hl
	inc	(hl)
00302$:
	lda	hl,14(sp)
	ld	a,(hl+)
	ld	e,(hl)
	lda	hl,56(sp)
	ld	(hl+),a
	ld	(hl),e
	lda	hl,28(sp)
	ld	(hl),c
;printf_large.c:343: if (c=='%') {
	ld	a,(hl)
	sub	a,#0x25
	jp	NZ,00303$
	jr	00304$
00303$:
	jp	00103$
00304$:
;printf_large.c:344: OUTPUT_CHAR(c, p);
	lda	hl,54(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	lda	hl,30(sp)
	ld	a,(hl)
	push	af
	inc	sp
	ld	hl,#00305$
	push	hl
	lda	hl,57(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	jp	(hl)
00305$:
	lda	sp,3(sp)
	lda	hl,18(sp)
	inc	(hl)
	jr	NZ,00306$
	inc	hl
	inc	(hl)
00306$:
;printf_large.c:345: continue;
	jp	00220$
00103$:
;printf_large.c:348: if (isdigit(c)) {
	lda	hl,28(sp)
	ld	c,(hl)
	ld	a,c
	sub	a,#0x30
	jp	C,00110$
	ld	c,(hl)
	ld	a,#0x39
	sub	a,c
	jp	C,00110$
;printf_large.c:349: if (decimals==-1) {
	inc	hl
	inc	hl
	ld	a,(hl)
	inc	a
	jp	NZ,00307$
	jr	00308$
00307$:
	jp	00107$
00308$:
;printf_large.c:350: width = 10*width + (c - '0');
	lda	hl,31(sp)
	ld	a,(hl)
	ld	e,a
	add	a,a
	add	a,a
	add	a,e
	add	a,a
	ld	c,a
	lda	hl,28(sp)
	ld	a,(hl)
	add	a,#0xD0
	ld	b, a
	add	a,c
	ld	c,a
	lda	hl,31(sp)
	ld	(hl),c
;printf_large.c:351: if (width == 0) {
	xor	a,a
	or	a,(hl)
	jp	NZ,00101$
;printf_large.c:353: zero_padding = 1;
	lda	hl,48(sp)
	ld	(hl),#0x01
	jp	00101$
00107$:
;printf_large.c:356: decimals = 10*decimals + (c-'0');
	lda	hl,30(sp)
	ld	a,(hl)
	ld	e,a
	add	a,a
	add	a,a
	add	a,e
	add	a,a
	ld	c,a
	lda	hl,28(sp)
	ld	a,(hl)
	add	a,#0xD0
	ld	b, a
	add	a,c
	ld	c,a
	inc	hl
	inc	hl
	ld	(hl),c
;printf_large.c:358: goto get_conversion_spec;
	jp	00101$
00110$:
;printf_large.c:361: if (c=='.') {
	lda	hl,28(sp)
	ld	a,(hl)
	sub	a,#0x2E
	jp	NZ,00309$
	jr	00310$
00309$:
	jp	00115$
00310$:
;printf_large.c:362: if (decimals=-1) decimals=0;
	lda	hl,30(sp)
	ld	(hl),#0x00
;printf_large.c:365: goto get_conversion_spec;
	jp	00101$
00115$:
;printf_large.c:368: lower_case = islower(c);
	lda	hl,28(sp)
	ld	a,(hl)
	push	af
	inc	sp
	call	_islower
	lda	sp,1(sp)
	ld	c,e
	lda	hl,41(sp)
	ld	(hl),c
;printf_large.c:369: if (lower_case)
	xor	a,a
	or	a,(hl)
	jp	Z,00117$
;printf_large.c:371: c = toupper(c);
	lda	hl,28(sp)
	ld	a,(hl)
	and	a,#0xDF
	ld	(hl),a
00117$:
;printf_large.c:374: switch( c )
	lda	hl,28(sp)
	ld	a,(hl)
	sub	a,#0x20
	jp	Z,00120$
00311$:
	lda	hl,28(sp)
	ld	a,(hl)
	sub	a,#0x2B
	jp	Z,00119$
00312$:
	lda	hl,28(sp)
	ld	a,(hl)
	sub	a,#0x2D
	jp	Z,00118$
00313$:
	lda	hl,28(sp)
	ld	a,(hl)
	sub	a,#0x42
	jp	Z,00121$
00314$:
	lda	hl,28(sp)
	ld	a,(hl)
	sub	a,#0x43
	jp	Z,00123$
00315$:
	lda	hl,28(sp)
	ld	a,(hl)
	sub	a,#0x44
	jp	Z,00145$
00316$:
	lda	hl,28(sp)
	ld	a,(hl)
	sub	a,#0x45
	jp	Z,00150$
00317$:
	lda	hl,28(sp)
	ld	a,(hl)
	sub	a,#0x46
	jp	Z,00150$
00318$:
	lda	hl,28(sp)
	ld	a,(hl)
	sub	a,#0x49
	jp	Z,00145$
00319$:
	lda	hl,28(sp)
	ld	a,(hl)
	sub	a,#0x4C
	jp	Z,00122$
00320$:
	lda	hl,28(sp)
	ld	a,(hl)
	sub	a,#0x4F
	jp	Z,00146$
00321$:
	lda	hl,28(sp)
	ld	a,(hl)
	sub	a,#0x50
	jp	Z,00143$
00322$:
	lda	hl,28(sp)
	ld	a,(hl)
	sub	a,#0x53
	jp	Z,00124$
00323$:
	lda	hl,28(sp)
	ld	a,(hl)
	sub	a,#0x55
	jp	Z,00147$
00324$:
	lda	hl,28(sp)
	ld	a,(hl)
	sub	a,#0x58
	jp	Z,00148$
00325$:
	jp	00151$
;printf_large.c:376: case '-':
00118$:
;printf_large.c:377: left_justify = 1;
	lda	hl,49(sp)
	ld	(hl),#0x01
;printf_large.c:378: goto get_conversion_spec;
	jp	00101$
;printf_large.c:379: case '+':
00119$:
;printf_large.c:380: prefix_sign = 1;
	lda	hl,47(sp)
	ld	(hl),#0x01
;printf_large.c:381: goto get_conversion_spec;
	jp	00101$
;printf_large.c:382: case ' ':
00120$:
;printf_large.c:383: prefix_space = 1;
	lda	hl,46(sp)
	ld	(hl),#0x01
;printf_large.c:384: goto get_conversion_spec;
	jp	00101$
;printf_large.c:385: case 'B':
00121$:
;printf_large.c:386: char_argument = 1;
	lda	hl,44(sp)
	ld	(hl),#0x01
;printf_large.c:387: goto get_conversion_spec;
	jp	00101$
;printf_large.c:388: case 'L':
00122$:
;printf_large.c:389: long_argument = 1;
	lda	hl,43(sp)
	ld	(hl),#0x01
;printf_large.c:390: goto get_conversion_spec;
	jp	00101$
;printf_large.c:392: case 'C':
00123$:
;printf_large.c:393: OUTPUT_CHAR( va_arg(ap,int), p );
	lda	hl,58(sp)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	inc	bc
	inc	bc
	dec	hl
	ld	(hl),c
	inc	hl
	ld	(hl),b
	dec	bc
	dec	bc
	ld	e,c
	ld	d,b
	ld	a,(de)
	ld	c,a
	inc	de
	ld	a,(de)
	ld	b,a
	lda	hl,54(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	ld	a,c
	push	af
	inc	sp
	ld	hl,#00326$
	push	hl
	lda	hl,57(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	jp	(hl)
00326$:
	lda	sp,3(sp)
	lda	hl,18(sp)
	inc	(hl)
	jr	NZ,00327$
	inc	hl
	inc	(hl)
00327$:
;printf_large.c:394: break;
	jp	00152$
;printf_large.c:396: case 'S':
00124$:
;printf_large.c:397: PTR = va_arg(ap,ptr_t);
	lda	hl,36(sp)
	ld	a,l
	ld	d,h
	lda	hl,14(sp)
	ld	(hl+),a
	ld	(hl),d
	lda	hl,58(sp)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	inc	bc
	inc	bc
	dec	hl
	ld	(hl),c
	inc	hl
	ld	(hl),b
	dec	bc
	dec	bc
	ld	e,c
	ld	d,b
	ld	a,(de)
	ld	c,a
	inc	de
	ld	a,(de)
	ld	b,a
	lda	hl,14(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,c
	ld	(de),a
	inc	de
	ld	a,b
	ld	(de),a
;printf_large.c:399: length = strlen(PTR);
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	c,a
	inc	de
	ld	a,(de)
	ld	b,a
	push	bc
	call	_strlen
	lda	sp,2(sp)
	ld	b,d
	ld	c,e
	lda	hl,13(sp)
	ld	(hl),c
;printf_large.c:400: if ( decimals == -1 )
	lda	hl,30(sp)
	ld	a,(hl)
	inc	a
	jp	NZ,00328$
	jr	00329$
00328$:
	jp	00126$
00329$:
;printf_large.c:402: decimals = length;
	lda	hl,13(sp)
	ld	a,(hl)
	lda	hl,30(sp)
	ld	(hl),a
00126$:
;printf_large.c:404: if ( ( !left_justify ) && (length < width) )
	xor	a,a
	lda	hl,49(sp)
	or	a,(hl)
	jp	NZ,00260$
	lda	hl,13(sp)
	ld	a,(hl)
	lda	hl,31(sp)
	sub	a,(hl)
	jp	NC,00260$
;printf_large.c:406: width -= length;
	ld	a,(hl)
	lda	hl,13(sp)
	sub	a,(hl)
	lda	hl,31(sp)
	ld	(hl),a
;printf_large.c:407: while( width-- != 0 )
	lda	hl,18(sp)
	ld	a,(hl+)
	ld	e,(hl)
	lda	hl,14(sp)
	ld	(hl+),a
	ld	(hl),e
	lda	hl,31(sp)
	ld	b,(hl)
00127$:
	ld	c,b
	dec	b
	lda	hl,31(sp)
	ld	(hl),b
	xor	a,a
	or	a,c
	jp	Z,00293$
;printf_large.c:409: OUTPUT_CHAR( ' ', p );
	push	bc
	lda	hl,56(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	ld	a,#0x20
	push	af
	inc	sp
	ld	hl,#00330$
	push	hl
	lda	hl,59(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	jp	(hl)
00330$:
	lda	sp,3(sp)
	pop	bc
	lda	hl,14(sp)
	inc	(hl)
	jr	NZ,00331$
	inc	hl
	inc	(hl)
00331$:
	lda	hl,14(sp)
	ld	a,(hl+)
	ld	e,(hl)
	lda	hl,18(sp)
	ld	(hl+),a
	ld	(hl),e
	jp	00127$
;printf_large.c:413: while ( *PTR  && (decimals-- > 0))
00293$:
	lda	hl,14(sp)
	ld	a,(hl+)
	ld	e,(hl)
	lda	hl,18(sp)
	ld	(hl+),a
	ld	(hl),e
	lda	hl,31(sp)
	ld	(hl),b
00260$:
	lda	hl,30(sp)
	ld	a,(hl)
	lda	hl,10(sp)
	ld	(hl),a
	lda	hl,18(sp)
	ld	a,(hl+)
	ld	e,(hl)
	lda	hl,14(sp)
	ld	(hl+),a
	ld	(hl),e
00134$:
	lda	hl,36(sp)
	ld	a,l
	ld	d,h
	lda	hl,11(sp)
	ld	(hl+),a
	ld	(hl),d
	ld	e,a
	ld	a,(de)
	ld	c,a
	inc	de
	ld	a,(de)
	ld	b,a
	ld	a,(bc)
	or	a,a
	jp	Z,00294$
	dec	hl
	dec	hl
	ld	c,(hl)
	dec	(hl)
	ld	a,(hl)
	lda	hl,30(sp)
	ld	(hl),a
	ld	a,#0x00
	sub	a,c
	rlca
	jp	NC,00294$
;printf_large.c:415: OUTPUT_CHAR( *PTR++, p );
	lda	hl,11(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	lda	hl,8(sp)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl-),a
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	inc	bc
	inc	hl
	inc	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,c
	ld	(de),a
	inc	de
	ld	a,b
	ld	(de),a
	lda	hl,8(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	c,a
	lda	hl,54(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	ld	a,c
	push	af
	inc	sp
	ld	hl,#00332$
	push	hl
	lda	hl,57(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	jp	(hl)
00332$:
	lda	sp,3(sp)
	lda	hl,14(sp)
	inc	(hl)
	jr	NZ,00333$
	inc	hl
	inc	(hl)
00333$:
	lda	hl,14(sp)
	ld	a,(hl+)
	ld	e,(hl)
	lda	hl,18(sp)
	ld	(hl+),a
	ld	(hl),e
	jp	00134$
00294$:
	lda	hl,10(sp)
	ld	a,(hl)
	lda	hl,30(sp)
	ld	(hl),a
	lda	hl,14(sp)
	ld	a,(hl+)
	ld	e,(hl)
	lda	hl,18(sp)
	ld	(hl+),a
	ld	(hl),e
;printf_large.c:418: if ( left_justify && (length < width))
	xor	a,a
	lda	hl,49(sp)
	or	a,(hl)
	jp	Z,00152$
	lda	hl,13(sp)
	ld	a,(hl)
	lda	hl,31(sp)
	sub	a,(hl)
	jp	NC,00152$
;printf_large.c:420: width -= length;
	ld	a,(hl)
	lda	hl,13(sp)
	sub	a,(hl)
	lda	hl,31(sp)
	ld	(hl),a
;printf_large.c:421: while( width-- != 0 )
	lda	hl,14(sp)
	ld	a,(hl+)
	ld	e,(hl)
	lda	hl,34(sp)
	ld	(hl+),a
	ld	(hl),e
	lda	hl,31(sp)
	ld	c,(hl)
00137$:
	ld	b,c
	dec	c
	lda	hl,31(sp)
	ld	(hl),c
	xor	a,a
	or	a,b
	jp	Z,00295$
;printf_large.c:423: OUTPUT_CHAR( ' ', p );
	push	bc
	lda	hl,56(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	ld	a,#0x20
	push	af
	inc	sp
	ld	hl,#00334$
	push	hl
	lda	hl,59(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	jp	(hl)
00334$:
	lda	sp,3(sp)
	pop	bc
	lda	hl,34(sp)
	inc	(hl)
	jr	NZ,00335$
	inc	hl
	inc	(hl)
00335$:
	lda	hl,34(sp)
	ld	a,(hl+)
	ld	e,(hl)
	lda	hl,18(sp)
	ld	(hl+),a
	ld	(hl),e
	jp	00137$
;printf_large.c:428: case 'P':
00143$:
;printf_large.c:429: PTR = va_arg(ap,ptr_t);
	lda	hl,36(sp)
	ld	c,l
	ld	b,h
	lda	hl,58(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x0002
	add	hl,de
	ld	a,l
	ld	d,h
	lda	hl,11(sp)
	ld	(hl+),a
	ld	(hl),d
	dec	hl
	ld	a,(hl+)
	ld	e,(hl)
	lda	hl,58(sp)
	ld	(hl+),a
	ld	(hl),e
	lda	hl,11(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	dec	de
	dec	de
	dec	hl
	ld	(hl),e
	inc	hl
	ld	(hl),d
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	dec	hl
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl),a
	ld	e,c
	ld	d,b
	dec	hl
	ld	a,(hl)
	ld	(de),a
	inc	de
	inc	hl
	ld	a,(hl)
	ld	(de),a
;printf_large.c:431: OUTPUT_CHAR('0', p);
	lda	hl,54(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	ld	a,#0x30
	push	af
	inc	sp
	ld	hl,#00336$
	push	hl
	lda	hl,57(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	jp	(hl)
00336$:
	lda	sp,3(sp)
	lda	hl,18(sp)
	inc	(hl)
	jr	NZ,00337$
	inc	hl
	inc	(hl)
00337$:
;printf_large.c:432: OUTPUT_CHAR('x', p);
	lda	hl,54(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	ld	a,#0x78
	push	af
	inc	sp
	ld	hl,#00338$
	push	hl
	lda	hl,57(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	jp	(hl)
00338$:
	lda	sp,3(sp)
	lda	hl,18(sp)
	inc	(hl)
	jr	NZ,00339$
	inc	hl
	inc	(hl)
00339$:
;printf_large.c:433: OUTPUT_2DIGITS( value.byte[1] );
	lda	hl,36(sp)
	ld	c,l
	ld	b,h
	inc	bc
	ld	a,(bc)
	ld	b,a
	lda	hl,54(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	lda	hl,54(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	lda	hl,45(sp)
	ld	a,(hl)
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_output_2digits
	lda	sp,6(sp)
	lda	hl,18(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x0002
	add	hl,de
	ld	a,l
	ld	d,h
	lda	hl,18(sp)
	ld	(hl+),a
	ld	(hl),d
;printf_large.c:434: OUTPUT_2DIGITS( value.byte[0] );
	lda	hl,36(sp)
	ld	c,l
	ld	b,h
	ld	a,(bc)
	ld	b,a
	lda	hl,54(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	lda	hl,54(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	lda	hl,45(sp)
	ld	a,(hl)
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_output_2digits
	lda	sp,6(sp)
	lda	hl,18(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x0002
	add	hl,de
	ld	a,l
	ld	d,h
	lda	hl,18(sp)
	ld	(hl+),a
	ld	(hl),d
;printf_large.c:435: break;
	jp	00152$
;printf_large.c:438: case 'I':
00145$:
;printf_large.c:439: signed_argument = 1;
	lda	hl,45(sp)
	ld	(hl),#0x01
;printf_large.c:440: radix = 10;
	lda	hl,32(sp)
	ld	(hl),#0x0A
;printf_large.c:441: break;
	jp	00152$
;printf_large.c:443: case 'O':
00146$:
;printf_large.c:444: radix = 8;
	lda	hl,32(sp)
	ld	(hl),#0x08
;printf_large.c:445: break;
	jp	00152$
;printf_large.c:447: case 'U':
00147$:
;printf_large.c:448: radix = 10;
	lda	hl,32(sp)
	ld	(hl),#0x0A
;printf_large.c:449: break;
	jp	00152$
;printf_large.c:451: case 'X':
00148$:
;printf_large.c:452: radix = 16;
	lda	hl,32(sp)
	ld	(hl),#0x10
;printf_large.c:453: break;
	jp	00152$
;printf_large.c:456: case 'F':
00150$:
;printf_large.c:457: float_argument=1;
	lda	hl,42(sp)
	ld	(hl),#0x01
;printf_large.c:458: break;
	jp	00152$
;printf_large.c:460: default:
00151$:
;printf_large.c:462: OUTPUT_CHAR( c, p );
	lda	hl,54(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	lda	hl,30(sp)
	ld	a,(hl)
	push	af
	inc	sp
	ld	hl,#00340$
	push	hl
	lda	hl,57(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	jp	(hl)
00340$:
	lda	sp,3(sp)
	lda	hl,18(sp)
	inc	(hl)
	jr	NZ,00341$
	inc	hl
	inc	(hl)
00341$:
;printf_large.c:613: return charsOutputted;
	jp	00152$
;printf_large.c:464: }
00295$:
	lda	hl,34(sp)
	ld	a,(hl+)
	ld	e,(hl)
	lda	hl,18(sp)
	ld	(hl+),a
	ld	(hl),e
	lda	hl,31(sp)
	ld	(hl),c
00152$:
;printf_large.c:466: if (float_argument) {
	xor	a,a
	lda	hl,42(sp)
	or	a,(hl)
	jp	Z,00215$
;printf_large.c:467: value.f=va_arg(ap,float);
	lda	hl,36(sp)
	ld	a,l
	ld	d,h
	lda	hl,8(sp)
	ld	(hl+),a
	ld	(hl),d
	lda	hl,58(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x0004
	add	hl,de
	ld	c,l
	ld	b,h
	lda	hl,58(sp)
	ld	(hl),c
	inc	hl
	ld	(hl),b
	ld	a,c
	add	a,#0xFC
	ld	c,a
	ld	a,b
	adc	a,#0xFF
	ld	b,a
	ld	e,c
	ld	d,b
	ld	a,(de)
	lda	hl,4(sp)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl+),a
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	lda	hl,4(sp)
	ld	a,(hl)
	ld	(de),a
	inc	de
	inc	hl
	ld	a,(hl)
	ld	(de),a
	inc	de
	inc	hl
	ld	a,(hl)
	ld	(de),a
	inc	de
	inc	hl
	ld	a,(hl)
	ld	(de),a
;printf_large.c:469: charsOutputted += OUTPUT_FLOAT(value.f, width, decimals, left_justify,
	inc	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	lda	hl,4(sp)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl),a
	lda	hl,54(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	lda	hl,54(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	lda	hl,50(sp)
	ld	a,(hl)
	push	af
	inc	sp
	inc	hl
	ld	a,(hl)
	push	af
	inc	sp
	inc	hl
	ld	a,(hl)
	push	af
	inc	sp
	inc	hl
	ld	a,(hl)
	push	af
	inc	sp
	lda	hl,38(sp)
	ld	a,(hl)
	push	af
	inc	sp
	inc	hl
	ld	a,(hl)
	push	af
	inc	sp
	lda	hl,16(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	lda	hl,16(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	_output_float
	lda	sp,14(sp)
	ld	c,e
	ld	b,#0x00
	lda	hl,18(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	add	hl,bc
	ld	a,l
	ld	d,h
	lda	hl,18(sp)
	ld	(hl+),a
	ld	(hl),d
	jp	00220$
00215$:
;printf_large.c:471: } else if (radix != 0)
	xor	a,a
	lda	hl,32(sp)
	or	a,(hl)
	jp	Z,00220$
;printf_large.c:476: unsigned char _AUTOMEM *pstore = &store[5];
	lda	hl,16(sp)
	ld	a,(hl+)
	ld	e,(hl)
	lda	hl,20(sp)
	ld	(hl+),a
	ld	(hl),e
;printf_large.c:479: if (char_argument)
	xor	a,a
	lda	hl,44(sp)
	or	a,(hl)
	jp	Z,00161$
;printf_large.c:481: value.l = va_arg(ap,char);
	lda	hl,36(sp)
	ld	a,l
	ld	d,h
	lda	hl,4(sp)
	ld	(hl+),a
	ld	(hl),d
	lda	hl,58(sp)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	inc	bc
	dec	hl
	ld	(hl),c
	inc	hl
	ld	(hl),b
	dec	bc
	ld	a,(bc)
	ld	c,a
	lda	hl,0(sp)
	ld	(hl),c
	ld	a,c
	rla	
	sbc	a,a
	inc	hl
	ld	(hl+),a
	ld	(hl+),a
	ld	(hl+),a
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
	inc	de
	inc	hl
	ld	a,(hl)
	ld	(de),a
	inc	de
	inc	hl
	ld	a,(hl)
	ld	(de),a
;printf_large.c:482: if (!signed_argument)
	xor	a,a
	lda	hl,45(sp)
	or	a,(hl)
	jp	NZ,00162$
;printf_large.c:484: value.l &= 0xFF;
	lda	hl,4(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	lda	hl,0(sp)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl-),a
	dec	hl
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
	inc	hl
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
	inc	de
	inc	hl
	ld	a,(hl)
	ld	(de),a
	inc	de
	inc	hl
	ld	a,(hl)
	ld	(de),a
	jp	00162$
00161$:
;printf_large.c:487: else if (long_argument)
	xor	a,a
	lda	hl,43(sp)
	or	a,(hl)
	jp	Z,00158$
;printf_large.c:489: value.l = va_arg(ap,long);
	lda	hl,36(sp)
	ld	a,l
	ld	d,h
	lda	hl,0(sp)
	ld	(hl+),a
	ld	(hl),d
	lda	hl,58(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x0004
	add	hl,de
	ld	c,l
	ld	b,h
	lda	hl,58(sp)
	ld	(hl),c
	inc	hl
	ld	(hl),b
	ld	a,c
	add	a,#0xFC
	ld	c,a
	ld	a,b
	adc	a,#0xFF
	ld	b,a
	ld	e,c
	ld	d,b
	ld	a,(de)
	lda	hl,4(sp)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl),a
	lda	hl,0(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	lda	hl,4(sp)
	ld	a,(hl)
	ld	(de),a
	inc	de
	inc	hl
	ld	a,(hl)
	ld	(de),a
	inc	de
	inc	hl
	ld	a,(hl)
	ld	(de),a
	inc	de
	inc	hl
	ld	a,(hl)
	ld	(de),a
	jp	00162$
00158$:
;printf_large.c:493: value.l = va_arg(ap,int);
	lda	hl,36(sp)
	ld	a,l
	ld	d,h
	lda	hl,0(sp)
	ld	(hl+),a
	ld	(hl),d
	lda	hl,58(sp)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	inc	bc
	inc	bc
	dec	hl
	ld	(hl),c
	inc	hl
	ld	(hl),b
	dec	bc
	dec	bc
	ld	e,c
	ld	d,b
	ld	a,(de)
	ld	c,a
	inc	de
	ld	a,(de)
	ld	b,a
	lda	hl,4(sp)
	ld	(hl),c
	inc	hl
	ld	(hl),b
	ld	a,b
	rla	
	sbc	a,a
	inc	hl
	ld	(hl+),a
	ld	(hl),a
	lda	hl,0(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	lda	hl,4(sp)
	ld	a,(hl)
	ld	(de),a
	inc	de
	inc	hl
	ld	a,(hl)
	ld	(de),a
	inc	de
	inc	hl
	ld	a,(hl)
	ld	(de),a
	inc	de
	inc	hl
	ld	a,(hl)
	ld	(de),a
;printf_large.c:494: if (!signed_argument)
	xor	a,a
	lda	hl,45(sp)
	or	a,(hl)
	jp	NZ,00162$
;printf_large.c:496: value.l &= 0xFFFF;
	lda	hl,0(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	lda	hl,4(sp)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl-),a
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
	lda	hl,0(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	lda	hl,4(sp)
	ld	a,(hl)
	ld	(de),a
	inc	de
	inc	hl
	ld	a,(hl)
	ld	(de),a
	inc	de
	inc	hl
	ld	a,(hl)
	ld	(de),a
	inc	de
	inc	hl
	ld	a,(hl)
	ld	(de),a
00162$:
;printf_large.c:500: if ( signed_argument )
	xor	a,a
	lda	hl,45(sp)
	or	a,(hl)
	jp	Z,00167$
;printf_large.c:502: if (value.l < 0)
	lda	hl,36(sp)
	ld	c,l
	ld	b,h
	ld	e,c
	ld	d,b
	ld	a,(de)
	lda	hl,4(sp)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl),a
	bit	7,a
	jp	Z,00164$
;printf_large.c:503: value.l = -value.l;
	ld	e,c
	ld	d,b
	ld	a,(de)
	lda	hl,4(sp)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl),a
	ld	de,#0x0000
	ld	a,e
	lda	hl,4(sp)
	sub	a,(hl)
	ld	e,a
	ld	a,d
	inc	hl
	sbc	a,(hl)
	push	af
	ld	(hl-),a
	ld	(hl),e
	ld	de,#0x0000
	inc	hl
	inc	hl
	pop	af
	ld	a,e
	sbc	a,(hl)
	ld	e,a
	ld	a,d
	inc	hl
	sbc	a,(hl)
	ld	(hl-),a
	ld	(hl),e
	ld	e,c
	ld	d,b
	dec	hl
	dec	hl
	ld	a,(hl)
	ld	(de),a
	inc	de
	inc	hl
	ld	a,(hl)
	ld	(de),a
	inc	de
	inc	hl
	ld	a,(hl)
	ld	(de),a
	inc	de
	inc	hl
	ld	a,(hl)
	ld	(de),a
	jp	00167$
00164$:
;printf_large.c:505: signed_argument = 0;
	lda	hl,45(sp)
	ld	(hl),#0x00
00167$:
;printf_large.c:509: lsd = 1;
	lda	hl,33(sp)
	ld	(hl),#0x01
;printf_large.c:511: do {
	lda	hl,20(sp)
	ld	a,(hl+)
	ld	e,(hl)
	lda	hl,0(sp)
	ld	(hl+),a
	ld	(hl),e
	lda	hl,29(sp)
	ld	(hl),#0x00
00171$:
;printf_large.c:512: value.byte[4] = 0;
	lda	hl,36(sp)
	ld	c,l
	ld	b,h
	inc	bc
	inc	bc
	inc	bc
	inc	bc
	ld	a,#0x00
	ld	(bc),a
;printf_large.c:513: calculate_digit(&value, radix);
	lda	hl,36(sp)
	ld	c,l
	ld	b,h
	lda	hl,32(sp)
	ld	a,(hl)
	push	af
	inc	sp
	push	bc
	call	_calculate_digit
	lda	sp,3(sp)
;printf_large.c:514: if (!lsd)
	xor	a,a
	lda	hl,33(sp)
	or	a,(hl)
	jp	NZ,00169$
;printf_large.c:516: *pstore = (value.byte[4] << 4) | (value.byte[4] >> 4) | *pstore;
	lda	hl,36(sp)
	ld	c,l
	ld	b,h
	ld	hl,#0x0004
	add	hl,bc
	ld	a,l
	ld	d,h
	lda	hl,4(sp)
	ld	(hl+),a
	ld	(hl),d
	ld	e,a
	ld	a,(de)
	ld	c,a
	rlca
	rlca
	rlca
	rlca
	and	a,#0xF0
	ld	c,a
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	b,a
	srl	b
	srl	b
	srl	b
	srl	b
	ld	a,c
	or	a,b
	ld	c,a
	lda	hl,0(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	b,a
	or	a,c
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	(de),a
;printf_large.c:517: pstore--;
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	dec	de
	dec	hl
	ld	(hl),e
	inc	hl
	ld	(hl),d
	dec	hl
	ld	a,(hl+)
	ld	e,(hl)
	lda	hl,20(sp)
	ld	(hl+),a
	ld	(hl),e
	jp	00170$
00169$:
;printf_large.c:521: *pstore = value.byte[4];
	lda	hl,36(sp)
	ld	c,l
	ld	b,h
	inc	bc
	inc	bc
	inc	bc
	inc	bc
	ld	a,(bc)
	lda	hl,0(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	(de),a
00170$:
;printf_large.c:523: length++;
	lda	hl,29(sp)
	inc	(hl)
	ld	a,(hl)
	lda	hl,13(sp)
	ld	(hl),a
;printf_large.c:524: lsd = !lsd;
	xor	a,a
	lda	hl,33(sp)
	or	a,(hl)
	sub	a,#0x01
	ld	a,#0x00
	rla
	ld	(hl),a
;printf_large.c:525: } while( value.ul );
	lda	hl,36(sp)
	ld	c,l
	ld	b,h
	ld	e,c
	ld	d,b
	ld	a,(de)
	lda	hl,4(sp)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl),a
	lda	hl,4(sp)
	ld	a,(hl+)
	or	a,(hl)
	inc	hl
	or	a,(hl)
	inc	hl
	or	a,(hl)
	jp	NZ,00171$
;printf_large.c:527: if (width == 0)
	lda	hl,0(sp)
	ld	a,(hl+)
	ld	e,(hl)
	lda	hl,20(sp)
	ld	(hl+),a
	ld	(hl),e
	lda	hl,29(sp)
	ld	a,(hl)
	lda	hl,13(sp)
	ld	(hl),a
	xor	a,a
	lda	hl,31(sp)
	or	a,(hl)
	jp	NZ,00175$
;printf_large.c:532: width=1;
	ld	(hl),#0x01
00175$:
;printf_large.c:536: if (!zero_padding && !left_justify)
	xor	a,a
	lda	hl,48(sp)
	or	a,(hl)
	jp	NZ,00180$
	xor	a,a
	inc	hl
	or	a,(hl)
	jp	NZ,00180$
;printf_large.c:538: while ( width > (unsigned char) (length+1) )
	lda	hl,13(sp)
	ld	c,(hl)
	inc	c
	lda	hl,18(sp)
	ld	a,(hl+)
	ld	e,(hl)
	lda	hl,0(sp)
	ld	(hl+),a
	ld	(hl),e
	lda	hl,31(sp)
	ld	b,(hl)
00176$:
	ld	a,c
	sub	a,b
	jp	NC,00297$
;printf_large.c:540: OUTPUT_CHAR( ' ', p );
	push	bc
	lda	hl,56(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	ld	a,#0x20
	push	af
	inc	sp
	ld	hl,#00342$
	push	hl
	lda	hl,59(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	jp	(hl)
00342$:
	lda	sp,3(sp)
	pop	bc
	lda	hl,0(sp)
	inc	(hl)
	jr	NZ,00343$
	inc	hl
	inc	(hl)
00343$:
	lda	hl,0(sp)
	ld	a,(hl+)
	ld	e,(hl)
	lda	hl,18(sp)
	ld	(hl+),a
	ld	(hl),e
;printf_large.c:541: width--;
	dec	b
	jp	00176$
00297$:
	lda	hl,0(sp)
	ld	a,(hl+)
	ld	e,(hl)
	lda	hl,18(sp)
	ld	(hl+),a
	ld	(hl),e
	lda	hl,31(sp)
	ld	(hl),b
00180$:
;printf_large.c:545: if (signed_argument) // this now means the original value was negative
	xor	a,a
	lda	hl,45(sp)
	or	a,(hl)
	jp	Z,00190$
;printf_large.c:547: OUTPUT_CHAR( '-', p );
	lda	hl,54(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	ld	a,#0x2D
	push	af
	inc	sp
	ld	hl,#00344$
	push	hl
	lda	hl,57(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	jp	(hl)
00344$:
	lda	sp,3(sp)
	lda	hl,18(sp)
	inc	(hl)
	jr	NZ,00345$
	inc	hl
	inc	(hl)
00345$:
;printf_large.c:549: width--;
	lda	hl,31(sp)
	dec	(hl)
	jp	00191$
00190$:
;printf_large.c:551: else if (length != 0)
	xor	a,a
	lda	hl,13(sp)
	or	a,(hl)
	jp	Z,00191$
;printf_large.c:554: if (prefix_sign)
	xor	a,a
	lda	hl,47(sp)
	or	a,(hl)
	jp	Z,00185$
;printf_large.c:556: OUTPUT_CHAR( '+', p );
	lda	hl,54(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	ld	a,#0x2B
	push	af
	inc	sp
	ld	hl,#00346$
	push	hl
	lda	hl,57(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	jp	(hl)
00346$:
	lda	sp,3(sp)
	lda	hl,18(sp)
	inc	(hl)
	jr	NZ,00347$
	inc	hl
	inc	(hl)
00347$:
;printf_large.c:558: width--;
	lda	hl,31(sp)
	dec	(hl)
	jp	00191$
00185$:
;printf_large.c:560: else if (prefix_space)
	xor	a,a
	lda	hl,46(sp)
	or	a,(hl)
	jp	Z,00191$
;printf_large.c:562: OUTPUT_CHAR( ' ', p );
	lda	hl,54(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	ld	a,#0x20
	push	af
	inc	sp
	ld	hl,#00348$
	push	hl
	lda	hl,57(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	jp	(hl)
00348$:
	lda	sp,3(sp)
	lda	hl,18(sp)
	inc	(hl)
	jr	NZ,00349$
	inc	hl
	inc	(hl)
00349$:
;printf_large.c:564: width--;
	lda	hl,31(sp)
	dec	(hl)
00191$:
;printf_large.c:569: if (!left_justify)
	xor	a,a
	lda	hl,49(sp)
	or	a,(hl)
	jp	NZ,00199$
;printf_large.c:570: while ( width-- > length )
	lda	hl,18(sp)
	ld	a,(hl+)
	ld	e,(hl)
	lda	hl,4(sp)
	ld	(hl+),a
	ld	(hl),e
	lda	hl,31(sp)
	ld	b,(hl)
00192$:
	ld	c,b
	dec	b
	lda	hl,31(sp)
	ld	(hl),b
	lda	hl,13(sp)
	ld	a,(hl)
	sub	a,c
	jp	NC,00298$
;printf_large.c:572: OUTPUT_CHAR( zero_padding ? '0' : ' ', p );
	xor	a,a
	lda	hl,48(sp)
	or	a,(hl)
	jp	Z,00225$
	ld	c,#0x30
	jp	00226$
00225$:
	ld	c,#0x20
00226$:
	push	bc
	lda	hl,56(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	ld	a,c
	push	af
	inc	sp
	ld	hl,#00350$
	push	hl
	lda	hl,59(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	jp	(hl)
00350$:
	lda	sp,3(sp)
	pop	bc
	lda	hl,4(sp)
	inc	(hl)
	jr	NZ,00351$
	inc	hl
	inc	(hl)
00351$:
	lda	hl,4(sp)
	ld	a,(hl+)
	ld	e,(hl)
	lda	hl,18(sp)
	ld	(hl+),a
	ld	(hl),e
	jp	00192$
00199$:
;printf_large.c:577: if (width > length)
	lda	hl,13(sp)
	ld	a,(hl)
	lda	hl,31(sp)
	sub	a,(hl)
	jp	NC,00196$
;printf_large.c:578: width -= length;
	ld	a,(hl)
	lda	hl,13(sp)
	sub	a,(hl)
	lda	hl,31(sp)
	ld	(hl),a
	jp	00290$
00196$:
;printf_large.c:580: width = 0;
	lda	hl,31(sp)
	ld	(hl),#0x00
;printf_large.c:613: return charsOutputted;
	jp	00290$
;printf_large.c:584: while( length-- )
00298$:
	lda	hl,4(sp)
	ld	a,(hl+)
	ld	e,(hl)
	lda	hl,18(sp)
	ld	(hl+),a
	ld	(hl),e
	lda	hl,31(sp)
	ld	(hl),b
00290$:
	lda	hl,20(sp)
	ld	a,(hl+)
	ld	e,(hl)
	lda	hl,8(sp)
	ld	(hl+),a
	ld	(hl),e
	lda	hl,18(sp)
	ld	a,(hl+)
	ld	e,(hl)
	lda	hl,0(sp)
	ld	(hl+),a
	ld	(hl),e
	lda	hl,13(sp)
	ld	a,(hl)
	lda	hl,4(sp)
	ld	(hl),a
00204$:
	lda	hl,4(sp)
	ld	c,(hl)
	dec	(hl)
	xor	a,a
	or	a,c
	jp	Z,00299$
;printf_large.c:586: lsd = !lsd;
	xor	a,a
	lda	hl,33(sp)
	or	a,(hl)
	sub	a,#0x01
	ld	a,#0x00
	rla
;printf_large.c:587: if (!lsd)
	ld	(hl),a
	or	a,a
	jp	NZ,00202$
;printf_large.c:589: pstore++;
	lda	hl,8(sp)
	inc	(hl)
	jr	NZ,00352$
	inc	hl
	inc	(hl)
00352$:
;printf_large.c:590: value.byte[4] = *pstore >> 4;
	lda	hl,36(sp)
	ld	c,l
	ld	b,h
	ld	hl,#0x0004
	add	hl,bc
	ld	a,l
	ld	d,h
	lda	hl,11(sp)
	ld	(hl+),a
	ld	(hl),d
	lda	hl,8(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	c,a
	srl	c
	srl	c
	srl	c
	srl	c
	inc	hl
	inc	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,c
	ld	(de),a
	jp	00203$
00202$:
;printf_large.c:594: value.byte[4] = *pstore & 0x0F;
	lda	hl,36(sp)
	ld	c,l
	ld	b,h
	ld	hl,#0x0004
	add	hl,bc
	ld	a,l
	ld	d,h
	lda	hl,11(sp)
	ld	(hl+),a
	ld	(hl),d
	lda	hl,8(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	c,a
	and	a,#0x0F
	inc	hl
	inc	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	(de),a
00203$:
;printf_large.c:596: output_digit( value.byte[4], lower_case, output_char, p );
	lda	hl,36(sp)
	ld	c,l
	ld	b,h
	inc	bc
	inc	bc
	inc	bc
	inc	bc
	ld	a,(bc)
	ld	c,a
	lda	hl,54(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	lda	hl,54(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	lda	hl,45(sp)
	ld	a,(hl)
	push	af
	inc	sp
	ld	a,c
	push	af
	inc	sp
	call	_output_digit
	lda	sp,6(sp)
;printf_large.c:597: charsOutputted++;
	lda	hl,0(sp)
	inc	(hl)
	jr	NZ,00353$
	inc	hl
	inc	(hl)
00353$:
	lda	hl,0(sp)
	ld	a,(hl+)
	ld	e,(hl)
	lda	hl,18(sp)
	ld	(hl+),a
	ld	(hl),e
	jp	00204$
00299$:
	lda	hl,0(sp)
	ld	a,(hl+)
	ld	e,(hl)
	lda	hl,18(sp)
	ld	(hl+),a
	ld	(hl),e
;printf_large.c:599: if (left_justify)
	xor	a,a
	lda	hl,49(sp)
	or	a,(hl)
	jp	Z,00220$
;printf_large.c:600: while (width-- > 0)
	lda	hl,0(sp)
	ld	a,(hl+)
	ld	e,(hl)
	lda	hl,34(sp)
	ld	(hl+),a
	ld	(hl),e
	lda	hl,31(sp)
	ld	c,(hl)
00207$:
	ld	b,c
	dec	c
	xor	a,a
	or	a,b
	jp	Z,00220$
;printf_large.c:602: OUTPUT_CHAR(' ', p);
	push	bc
	lda	hl,56(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	ld	a,#0x20
	push	af
	inc	sp
	ld	hl,#00354$
	push	hl
	lda	hl,59(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	jp	(hl)
00354$:
	lda	sp,3(sp)
	pop	bc
	lda	hl,34(sp)
	inc	(hl)
	jr	NZ,00355$
	inc	hl
	inc	(hl)
00355$:
	lda	hl,34(sp)
	ld	a,(hl+)
	ld	e,(hl)
	lda	hl,18(sp)
	ld	(hl+),a
	ld	(hl),e
	jp	00207$
00218$:
;printf_large.c:609: OUTPUT_CHAR( c, p );
	lda	hl,54(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	lda	hl,30(sp)
	ld	a,(hl)
	push	af
	inc	sp
	ld	hl,#00356$
	push	hl
	lda	hl,57(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	jp	(hl)
00356$:
	lda	sp,3(sp)
	lda	hl,18(sp)
	inc	(hl)
	jr	NZ,00357$
	inc	hl
	inc	(hl)
00357$:
	jp	00220$
00222$:
;printf_large.c:613: return charsOutputted;
	lda	hl,18(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
00223$:
	lda	sp,50(sp)
ret
	.area _CODE
	.area _CABS
