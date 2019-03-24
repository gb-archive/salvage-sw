;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.0 #5416 (Apr  7 2010) (MINGW32)
; This file was generated Sun Apr 11 14:38:30 2010
;--------------------------------------------------------
	.module sprintf
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _vsprintf
	.globl _sprintf
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
;../sprintf.c:29: static void put_char_to_string( char c, void* p ) _REENTRANT
;	---------------------------------
; Function put_char_to_string
; ---------------------------------
_put_char_to_string:
	push	ix
	ld	ix,#0
	add	ix,sp
;../sprintf.c:31: char **buf = (char **)p;
	ld	c,5 (ix)
	ld	b,6 (ix)
	push	bc
	pop	iy
;../sprintf.c:32: *(*buf)++ = c;
	ld	c,0 (iy)
	ld	b,1 (iy)
	ld	e,c
	ld	d,b
	inc	de
	ld	0 (iy),e
	ld	1 (iy),d
	ld	a,4 (ix)
	ld	(bc),a
	pop	ix
	ret
;../sprintf.c:35: int vsprintf (char *buf, const char *format, va_list ap)
;	---------------------------------
; Function vsprintf
; ---------------------------------
_vsprintf:
	push	ix
	ld	ix,#0
	add	ix,sp
;../sprintf.c:38: i = _print_format( put_char_to_string, &buf, format, ap );
	ld	hl,#0x0004
	add	hl,sp
	ld	c,l
	ld	b,h
	ld	l,8 (ix)
	ld	h,9 (ix)
	push	hl
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	push	bc
	ld	hl,#_put_char_to_string
	push	hl
	call	__print_format
	pop	af
	pop	af
	pop	af
	pop	af
	ld	b,h
	ld	c,l
;../sprintf.c:39: *buf = 0;
	ld	e,4 (ix)
	ld	d,5 (ix)
	push	de
	pop	iy
	ld	(iy),#0x00
;../sprintf.c:40: return i;
	ld	l,c
	ld	h,b
	pop	ix
ret
;../sprintf.c:43: int sprintf (char *buf, const char *format, ...)
;	---------------------------------
; Function sprintf
; ---------------------------------
_sprintf:
	push	ix
	ld	ix,#0
	add	ix,sp
;../sprintf.c:48: va_start (arg, format);
	ld	hl,#0x0006
	add	hl,sp
	inc	hl
	inc	hl
	ld	c,l
	ld	b,h
;../sprintf.c:49: i = _print_format( put_char_to_string, &buf, format, arg );
	ld	hl,#0x0004
	add	hl,sp
	ex	de,hl
	push	bc
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	push	de
	ld	hl,#_put_char_to_string
	push	hl
	call	__print_format
	pop	af
	pop	af
	pop	af
	pop	af
	ld	b,h
	ld	c,l
;../sprintf.c:50: *buf = 0;
	ld	e,4 (ix)
	ld	d,5 (ix)
	push	de
	pop	iy
	ld	(iy),#0x00
;../sprintf.c:53: return i;
	ld	l,c
	ld	h,b
	pop	ix
ret
	.area _CODE
	.area _CABS
