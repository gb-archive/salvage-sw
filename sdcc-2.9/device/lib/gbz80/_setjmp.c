/*-------------------------------------------------------------------------
  setjmp.c - source file for ANSI routines setjmp & longjmp

             Written By -  Sandeep Dutta . sandeep.dutta@usa.net (1998)

   This library is free software; you can redistribute it and/or modify it
   under the terms of the GNU Library General Public License as published by the
   Free Software Foundation; either version 2, or (at your option) any
   later version.

   This library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU Library General Public License for more details.

   You should have received a copy of the GNU Library General Public License
   along with this program; if not, write to the Free Software
   Foundation, 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.

   In other words, you are welcome to use, share and improve this program.
   You are forbidden to forbid anyone else to use, share and improve
   what you give them.   Help stamp out software-hoarding!
-------------------------------------------------------------------------*/
#include <setjmp.h>

int setjmp (jmp_buf bufx)
{
    __asm
    ra     =   0
    buf     =   ra+2

    /* copy return address to jump buffer */
    lda     hl,ra(sp)
    ld      d,h
    ld      e,l
    lda     hl,buf(sp)
    ld      a,(de)
    inc     de
    ld      (hl+),a
    ld      a,(de)
    ld      (hl),a
    __endasm;
    return 0;
}

int longjmp (jmp_buf bufx, int rv)
{
    __asm
    ra      =   0
    buf     =   ra + 2

    /* copy jump buffer to return address */
    lda     hl,buf(sp)
    ld      d,h
    ld      e,l
    lda     hl,buf(sp)
    ld      a,(de)
    inc     de
    ld      (hl+),a
    ld      a,(de)
    ld      (hl),a
    __endasm;
    return rv;
}
