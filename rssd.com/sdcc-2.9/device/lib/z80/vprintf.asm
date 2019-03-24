;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.0 #5416 (Apr  7 2010) (MINGW32)
; This file was generated Sun Apr 11 14:38:31 2010
;--------------------------------------------------------
	.module vprintf
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _vprintf
	.globl _printf
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
;../vprintf.c:29: static void put_char_to_stdout( char c, void* p ) _REENTRANT
;	---------------------------------
; Function put_char_to_stdout
; ---------------------------------
_put_char_to_stdout:
	push	ix
	ld	ix,#0
	add	ix,sp
;../vprintf.c:32: putchar( c );
	ld	a,4 (ix)
	push	af
	inc	sp
	call	_putchar
	inc	sp
	pop	ix
	ret
;../vprintf.c:35: int vprintf (const char *format, va_list ap)
;	---------------------------------
; Function vprintf
; ---------------------------------
_vprintf:
	push	ix
	ld	ix,#0
	add	ix,sp
;../vprintf.c:37: return _print_format( put_char_to_stdout, NULL, format, ap );
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	ld	hl,#0x0000
	push	hl
	ld	hl,#_put_char_to_stdout
	push	hl
	call	__print_format
	pop	af
	pop	af
	pop	af
	pop	af
	pop	ix
ret
;../vprintf.c:40: int printf (const char *format, ...)
;	---------------------------------
; Function printf
; ---------------------------------
_printf:
	push	ix
	ld	ix,#0
	add	ix,sp
;../vprintf.c:45: va_start (arg, format);
	ld	hl,#0x0004
	add	hl,sp
	inc	hl
	inc	hl
;../vprintf.c:46: i = _print_format( put_char_to_stdout, NULL, format, arg );
	push	hl
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	ld	hl,#0x0000
	push	hl
	ld	hl,#_put_char_to_stdout
	push	hl
	call	__print_format
	pop	af
	pop	af
	pop	af
	pop	af
	ld	b,h
	ld	c,l
	ld	l,c
	ld	h,b
;../vprintf.c:49: return i;
	pop	ix
ret
	.area _CODE
	.area _CABS
