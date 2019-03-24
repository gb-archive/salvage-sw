;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.0 #5416 (Apr  7 2010) (MINGW32)
; This file was generated Fri Jun 11 23:47:02 2010
;--------------------------------------------------------
	.module vprintf
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _vprintf
	.globl _printf
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
;../vprintf.c:29: static void put_char_to_stdout( char c, void* p ) _REENTRANT
;	---------------------------------
; Function put_char_to_stdout
; ---------------------------------
_put_char_to_stdout:
	
;../vprintf.c:32: putchar( c );
	lda	hl,2(sp)
	ld	a,(hl)
	push	af
	inc	sp
	call	_putchar
	lda	sp,1(sp)
00101$:
	
	ret
;../vprintf.c:35: int vprintf (const char *format, va_list ap)
;	---------------------------------
; Function vprintf
; ---------------------------------
_vprintf:
	
;../vprintf.c:37: return _print_format( put_char_to_stdout, NULL, format, ap );
	lda	hl,4(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	lda	hl,4(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	ld	hl,#0x0000
	push	hl
	ld	hl,#_put_char_to_stdout
	push	hl
	call	__print_format
	lda	sp,8(sp)
00101$:
	
ret
;../vprintf.c:40: int printf (const char *format, ...)
;	---------------------------------
; Function printf
; ---------------------------------
_printf:
	
;../vprintf.c:45: va_start (arg, format);
	lda	hl,2(sp)
	ld	c,l
	ld	b,h
	inc	bc
	inc	bc
;../vprintf.c:46: i = _print_format( put_char_to_stdout, NULL, format, arg );
	push	bc
	lda	hl,4(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	ld	hl,#0x0000
	push	hl
	ld	hl,#_put_char_to_stdout
	push	hl
	call	__print_format
	lda	sp,8(sp)
	ld	b,d
	ld	c,e
	ld	e,c
	ld	d,b
;../vprintf.c:49: return i;
00101$:
	
ret
	.area _CODE
	.area _CABS
