;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.0 #5416 (Apr  7 2010) (MINGW32)
; This file was generated Fri Jun 11 23:47:01 2010
;--------------------------------------------------------
	.module sprintf
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _vsprintf
	.globl _sprintf
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
;../sprintf.c:29: static void put_char_to_string( char c, void* p ) _REENTRANT
;	---------------------------------
; Function put_char_to_string
; ---------------------------------
_put_char_to_string:
	
	push	af
;../sprintf.c:31: char **buf = (char **)p;
;../sprintf.c:32: *(*buf)++ = c;
	lda	hl,5(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	lda	hl,0(sp)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl-),a
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	inc	bc
	lda	hl,5(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,c
	ld	(de),a
	inc	de
	ld	a,b
	ld	(de),a
	lda	hl,0(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	lda	hl,4(sp)
	ld	a,(hl)
	ld	(de),a
00101$:
	lda	sp,2(sp)
	ret
;../sprintf.c:35: int vsprintf (char *buf, const char *format, va_list ap)
;	---------------------------------
; Function vsprintf
; ---------------------------------
_vsprintf:
	
	push	af
;../sprintf.c:38: i = _print_format( put_char_to_string, &buf, format, ap );
	lda	hl,4(sp)
	ld	c,l
	ld	b,h
	lda	hl,8(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	lda	hl,8(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	push	bc
	ld	hl,#_put_char_to_string
	push	hl
	call	__print_format
	lda	sp,8(sp)
	ld	b,d
	ld	c,e
	lda	hl,0(sp)
	ld	(hl),c
	inc	hl
	ld	(hl),b
;../sprintf.c:39: *buf = 0;
	lda	hl,4(sp)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	a,#0x00
	ld	(bc),a
;../sprintf.c:40: return i;
	lda	hl,0(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
00101$:
	lda	sp,2(sp)
ret
;../sprintf.c:43: int sprintf (char *buf, const char *format, ...)
;	---------------------------------
; Function sprintf
; ---------------------------------
_sprintf:
	
	push	af
	push	af
;../sprintf.c:48: va_start (arg, format);
	lda	hl,8(sp)
	ld	c,l
	ld	b,h
	ld	hl,#0x0002
	add	hl,bc
	ld	a,l
	ld	d,h
	lda	hl,2(sp)
	ld	(hl+),a
	ld	(hl),d
;../sprintf.c:49: i = _print_format( put_char_to_string, &buf, format, arg );
	lda	hl,6(sp)
	ld	c,l
	ld	b,h
	lda	hl,2(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	lda	hl,10(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	push	bc
	ld	hl,#_put_char_to_string
	push	hl
	call	__print_format
	lda	sp,8(sp)
	ld	b,d
	ld	c,e
	lda	hl,0(sp)
	ld	(hl),c
	inc	hl
	ld	(hl),b
;../sprintf.c:50: *buf = 0;
	lda	hl,6(sp)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	a,#0x00
	ld	(bc),a
;../sprintf.c:53: return i;
	lda	hl,0(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
00101$:
	lda	sp,4(sp)
ret
	.area _CODE
	.area _CABS
