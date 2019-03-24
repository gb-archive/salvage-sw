#include <gb/gb.h> /* halt */
#include <types.h>
#include "ringbuffer.h"
#include "debug.h"
//#include <stdio.h>
//#include <stdlib.h>

#if defined(D_LOG)

#define DEBUG_BANK
#include "banks.h"

RINGBUFFER_DEFINITION(serial_out_queue, char);

void
debug_out() banked {
    /* Wait for any pending IO completion... */
    #if defined(D_SIMULATE)
        ringbuffer_pop_value(serial_out_queue);
        return;
    #else
        if(IO_SENDING == _io_status)
            return;
        _io_out = ringbuffer_pop_value(serial_out_queue);
        send_byte();
    #endif
}

local void 
debug_hex_nibble_impl(UBYTE b) {
    b &= 0x0f;
    if(b < 10)
        b += '0';
    else
        b += 'a' - 10;
    ringbuffer_push_value(serial_out_queue, b);
}

void
debug_hex_nibble(UBYTE b) banked {
    debug_hex_nibble_impl(b);
}

void 
debug_hex_byte(UBYTE b) banked {
    debug_hex_nibble_impl(b >> 4);
    debug_hex_nibble_impl(b);
}

#if 0
void
debug_int(INT16 i) banked {
    char buffer[15];
    _itoa(i, buffer, 10);
    debug_string(buffer);
}
#endif

local void
putchar(char c) {
    //debug(0x01, serial_out_queue.head);
    //debug(0x02, serial_out_queue.tail);
    ringbuffer_push_value(serial_out_queue, c);
}

/*-------------------------------------------------------------------------
 integer to string conversion

 Written by:   Bela Torok, 1999
               bela.torok@kssg.ch
 usage:

 _ultoa(unsigned long value, char* string, int radix)
 _ltoa(long value, char* string, int radix)

 value  ->  Number to be converted
 string ->  Result
 radix  ->  Base of value (e.g.: 2 for binary, 10 for decimal, 16 for hex)
---------------------------------------------------------------------------*/

#define NUMBER_OF_DIGITS 32

local void
_ultoa(unsigned long value, char* string, unsigned char radix)
{
unsigned char index;
char buffer[NUMBER_OF_DIGITS];  /* space for NUMBER_OF_DIGITS + '\0' */

  index = NUMBER_OF_DIGITS;

  do {
    buffer[--index] = '0' + (value % radix);
    if ( buffer[index] > '9') buffer[index] += 'A' - '9' - 1;
    value /= radix;
  } while (value != 0);

  do {
    *string++ = buffer[index++];
  } while ( index < NUMBER_OF_DIGITS );

  *string = 0;  /* string terminator */
}

local void
_ltoa(long value, char* string, unsigned char radix)
{
  if (value < 0 && radix == 10) {
    *string++ = '-';
    value = -value;
  }
  _ultoa(value, string, radix);
}

/*-----------------------------------------------------------------
    printfl.c - source file for reduced version of printf

    Written By - Sandeep Dutta . sandeep.dutta@usa.net (1999)

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

    2001060401: Improved by was@icb.snz.chel.su
-------------------------------------------------------------------------*/


/* following formats are supported :-
   format     output type       argument-type
     %d        decimal             int
     %ld       decimal             long
     %hd       decimal             char
     %x        hexadecimal         int
     %lx       hexadecimal         long
     %hx       hexadecimal         char
     %o        octal               int
     %lo       octal               long
     %ho       octal               char
     %c        character           char
     %s        character           generic pointer
*/

#include <stdarg.h>

void 
debug_print(char * fmt, ... ) banked
{
    va_list ap ;
    va_start(ap,fmt);
    for (; *fmt ; fmt++ ) {
        long val;
        char *str;
        char radix;
        if (*fmt != '%'){
            putchar(*fmt);
            continue;
        }

        fmt++ ;
        switch (*fmt) {
        case 's':
            str = va_arg(ap, char *);
            while (*str) putchar(*str++);
            continue ;
        case 'l':
            fmt++;
            val = va_arg(ap,long);
            break;
        case 'h':
            fmt++;
            val = va_arg(ap,char);
            break;
        default:
            val = va_arg(ap,int);
        }

        switch (*fmt) {
        case 'd':
            radix = 10;
            break;
        default:
        case 'x':
            radix = 16;
            break;
        case 'c':
            radix = 0;
            putchar((char)val);
            continue;
        case 'o':
            radix = 8;
            break;
        }

        {
            char buffer[12], c;
            _ltoa (val, buffer, radix);
            str = buffer;
            while (*str) 
                putchar(*str++);
        }
    }
}

#endif // D_LOG
