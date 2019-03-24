/*-------------------------------------------------------------------------
printf_large.c - formatted output conversion

Written By - Martijn van Balen aed@iae.nl (1999)
Added %f By - johan.knol@iduna.nl (2000)
Refactored by - Maarten Brock (2004)

This library is free software; you can redistribute it and/or
modify it under the terms of the GNU Lesser General Public
License as published by the Free Software Foundation; either
version 2.1 of the License, or (at your option) any later version.

This library is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public
License along with this library; if not, write to the Free Software
Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307 USA

In other words, you are welcome to use, share and improve this program.
You are forbidden to forbid anyone else to use, share and improve
what you give them.   Help stamp out software-hoarding!
-------------------------------------------------------------------------*/

#include <stdarg.h>
#include <string.h>
#include <ctype.h>
#include <stdio.h>
#include <stdbool.h>
#include <sdcc-lib.h>

#define PTR value.ptr

/****************************************************************************/

//typedef char * ptr_t;
#define ptr_t char *

#ifdef toupper
#undef toupper
#endif
#ifdef tolower
#undef tolower
#endif
#ifdef isdigit
#undef isdigit
#endif

//#define toupper(c) ((c)&=~0x20)
#define toupper(c) ((c)&=0xDF)
#define tolower(c) ((c)|=0x20)
#define isdigit(c) ((unsigned char)c >= (unsigned char)'0' && (unsigned char)c <= (unsigned char)'9')

typedef union
{
    unsigned char  byte[5];
    long           l;
    unsigned long  ul;
    float          f;
    char           *ptr;
} value_t;

char exponentf(float v);
float scalef(float v, char s);

/****************************************************************************/

#define OUTPUT_CHAR(c, p) { output_char (c, p); charsOutputted++; }
/*--------------------------------------------------------------------------*/

static void output_digit( unsigned char n, BOOL lower_case, pfn_outputchar output_char, void* p )
{
    register unsigned char c = n + (unsigned char)'0';

    if (c > (unsigned char)'9')
    {
        c += (unsigned char)('A' - '0' - 10);
        if (lower_case)
            c += (unsigned char)('a' - 'A');
    }
    output_char( c, p );
}

/*--------------------------------------------------------------------------*/

#define OUTPUT_2DIGITS( B )	{ output_2digits( B, lower_case, output_char, p ); charsOutputted += 2; }
static void output_2digits( unsigned char b, BOOL lower_case, pfn_outputchar output_char, void* p )
{
    output_digit( b>>4,   lower_case, output_char, p );
    output_digit( b&0x0F, lower_case, output_char, p );
}
/*--------------------------------------------------------------------------*/

static void calculate_digit( value_t _AUTOMEM * value, unsigned char radix )
{
    unsigned long ul = value->ul;
    unsigned char _AUTOMEM * pb4 = &value->byte[4];
    unsigned char i = 32;

    do
    {
        *pb4 = (*pb4 << 1) | ((ul >> 31) & 0x01);
        ul <<= 1;

        if (radix <= *pb4 )
        {
            *pb4 -= radix;
            ul |= 1;
        }
    } while (--i);
    value->ul = ul;
}
/* This is a very inefficient but direct approach, since we have no math
library yet (e.g. log()).
It does most of the modifiers, but has some restrictions. E.g. the
abs(float) shouldn't be bigger than an unsigned long (that's
about 4294967295), but still makes it usefull for most real-life
applications.
*/

#define DEFAULT_FLOAT_PRECISION 6

#define OUTPUT_FLOAT(F, W, D, L, Z, S, P) \
output_float(F, W, D, L, Z, S, P, output_char, p)

static unsigned char
output_float (
    float f, 
    unsigned char reqWidth,
    signed char reqDecimals,
    BOOL left, BOOL zero, 
    BOOL sign, BOOL space,
    pfn_outputchar output_char, 
    void* p
){
    unsigned char charsOutputted = 0;
    BOOL negative = 0;
    unsigned long integerPart;
    float decimalPart;
    char fpBuffer[128];
    char fpBI=0, fpBD;
    unsigned char minWidth, i;

    // save the sign
    if (f<0) {
        negative=1;
        f=-f;
    }

    if (f>0x00ffffff) {
        // this part is from Frank van der Hulst
        signed char exp;

        for (exp = 0; f >= 10.0; exp++) f /=10.0;
        for (       ; f < 1.0;   exp--) f *=10.0;

        if (negative) {
            OUTPUT_CHAR ('-', p);
        } else {
            if (sign) {
                OUTPUT_CHAR ('+', p);
            }
        }
        charsOutputted += OUTPUT_FLOAT(f, 0, reqDecimals, 0, 0, 0, 0);
        OUTPUT_CHAR ('e', p);
        if (exp<0) {
            OUTPUT_CHAR ('-', p);
            exp = -exp;
        }
        OUTPUT_CHAR ('0'+exp/10, p);
        OUTPUT_CHAR ('0'+exp%10, p);
        return charsOutputted;
    }

    // split the float
    integerPart=f;
    decimalPart=f-integerPart;

    // fill the buffer with the integerPart (in reversed order!)
    while (integerPart) {
        fpBuffer[fpBI++]='0' + integerPart%10;
        integerPart /= 10;
    }
    if (!fpBI) {
        // we need at least a 0
        fpBuffer[fpBI++]='0';
    }

    // display some decimals as default
    if (reqDecimals==-1)
        reqDecimals=DEFAULT_FLOAT_PRECISION;

    // fill buffer with the decimalPart (in normal order)
    fpBD=fpBI;

    for (i=reqDecimals; i>1; i--) {
        decimalPart *= 10.0;
        // truncate the float
        integerPart=decimalPart;
        fpBuffer[fpBD++]='0' + integerPart;
        decimalPart-=integerPart;
    }
    if (i) {
        unsigned char c;
        float x;
        decimalPart *= 10.0;
        // truncate the float
        x = decimalPart + 0.5;
        c = (unsigned char)x;
        fpBuffer[fpBD++] = '0' + c;
    }

    minWidth=fpBI; // we need at least these
    minWidth+=reqDecimals?reqDecimals+1:0; // maybe these
    if (negative || sign || space)
        minWidth++; // and maybe even this :)

    if (!left && reqWidth>i) {
        if (zero) {
            if (negative)
            {
                OUTPUT_CHAR('-', p);
            }
            else if (sign)
            {
                OUTPUT_CHAR('+', p);
            }
            else if (space)
            {
                OUTPUT_CHAR(' ', p);
            }
            while (reqWidth-->minWidth)
            {
                OUTPUT_CHAR('0', p);
            }
        } else {
            while (reqWidth-->minWidth)
            {
                OUTPUT_CHAR(' ', p);
            }
            if (negative)
            {
                OUTPUT_CHAR('-', p);
            }
            else if (sign)
            {
                OUTPUT_CHAR('+', p);
            }
            else if (space)
            {
                OUTPUT_CHAR(' ', p);
            }
        }
    } else {
        if (negative)
        {
            OUTPUT_CHAR('-', p);
        }
        else if (sign)
        {
            OUTPUT_CHAR('+', p);
        }
        else if (space)
        {
            OUTPUT_CHAR(' ', p);
        }
    }

    // output the integer part
    i=fpBI-1;
    do {
        OUTPUT_CHAR (fpBuffer[i], p);
    } while (i--);

    // ouput the decimal part
    if (reqDecimals) {
        OUTPUT_CHAR ('.', p);
        i=fpBI;
        while (reqDecimals--)
        {
            OUTPUT_CHAR (fpBuffer[i++], p);
        }
    }

    if (left && reqWidth>minWidth) {
        while (reqWidth-->minWidth)
        {
            OUTPUT_CHAR(' ', p);
        }
    }
    return charsOutputted;
}

int _print_format (pfn_outputchar pfn, void* pvoid, const char *format, va_list ap)
{
    BOOL   left_justify;
    BOOL   zero_padding;
    BOOL   prefix_sign;
    BOOL   prefix_space;
    BOOL   signed_argument;
    BOOL   char_argument;
    BOOL   long_argument;
    BOOL   float_argument;
    BOOL   lower_case;
    value_t value;
    int charsOutputted;
    BOOL   lsd;

    unsigned char radix;
    unsigned char  width;
    signed char decimals;
    unsigned char  length;
    char           c;

#define output_char   pfn
#define p             pvoid

    // reset output chars
    charsOutputted = 0;

    while( c=*format++ )
    {
        if ( c=='%' )
        {
            left_justify    = 0;
            zero_padding    = 0;
            prefix_sign     = 0;
            prefix_space    = 0;
            signed_argument = 0;
            char_argument   = 0;
            long_argument   = 0;
            float_argument  = 0;
            radix           = 0;
            width           = 0;
            decimals        = -1;

get_conversion_spec:

            c = *format++;

            if (c=='%') {
                OUTPUT_CHAR(c, p);
                continue;
            }

            if (isdigit(c)) {
                if (decimals==-1) {
                    width = 10*width + (c - '0');
                    if (width == 0) {
                        /* first character of width is a zero */
                        zero_padding = 1;
                    }
                } else {
                    decimals = 10*decimals + (c-'0');
                }
                goto get_conversion_spec;
            }

            if (c=='.') {
                if (decimals=-1) decimals=0;
                else
                    ; // duplicate, ignore
                goto get_conversion_spec;
            }

            lower_case = islower(c);
            if (lower_case)
            {
                c = toupper(c);
            }

            switch( c )
            {
            case '-':
                left_justify = 1;
                goto get_conversion_spec;
            case '+':
                prefix_sign = 1;
                goto get_conversion_spec;
            case ' ':
                prefix_space = 1;
                goto get_conversion_spec;
            case 'B':
                char_argument = 1;
                goto get_conversion_spec;
            case 'L':
                long_argument = 1;
                goto get_conversion_spec;

            case 'C':
                OUTPUT_CHAR( va_arg(ap,int), p );
                break;

            case 'S':
                PTR = va_arg(ap,ptr_t);

                length = strlen(PTR);
                if ( decimals == -1 )
                {
                    decimals = length;
                }
                if ( ( !left_justify ) && (length < width) )
                {
                    width -= length;
                    while( width-- != 0 )
                    {
                        OUTPUT_CHAR( ' ', p );
                    }
                }

                while ( *PTR  && (decimals-- > 0))
                {
                    OUTPUT_CHAR( *PTR++, p );
                }

                if ( left_justify && (length < width))
                {
                    width -= length;
                    while( width-- != 0 )
                    {
                        OUTPUT_CHAR( ' ', p );
                    }
                }
                break;

            case 'P':
                PTR = va_arg(ap,ptr_t);

                OUTPUT_CHAR('0', p);
                OUTPUT_CHAR('x', p);
                OUTPUT_2DIGITS( value.byte[1] );
                OUTPUT_2DIGITS( value.byte[0] );
                break;

            case 'D':
            case 'I':
                signed_argument = 1;
                radix = 10;
                break;

            case 'O':
                radix = 8;
                break;

            case 'U':
                radix = 10;
                break;

            case 'X':
                radix = 16;
                break;

            case 'E':
            case 'F':
                float_argument=1;
                break;

            default:
                // nothing special, just output the character
                OUTPUT_CHAR( c, p );
                break;
            }

            if (float_argument) {
                value.f=va_arg(ap,float);
                // ignore b and l conversion spec for now
                charsOutputted += OUTPUT_FLOAT(value.f, width, decimals, left_justify,
                    zero_padding, prefix_sign, prefix_space);
            } else if (radix != 0)
            {
                // Apparently we have to output an integral type
                // with radix "radix"
                unsigned char store[6];
                unsigned char _AUTOMEM *pstore = &store[5];

                // store value in byte[0] (LSB) ... byte[3] (MSB)
                if (char_argument)
                {
                    value.l = va_arg(ap,char);
                    if (!signed_argument)
                    {
                        value.l &= 0xFF;
                    }
                }
                else if (long_argument)
                {
                    value.l = va_arg(ap,long);
                }
                else // must be int
                {
                    value.l = va_arg(ap,int);
                    if (!signed_argument)
                    {
                        value.l &= 0xFFFF;
                    }
                }

                if ( signed_argument )
                {
                    if (value.l < 0)
                        value.l = -value.l;
                    else
                        signed_argument = 0;
                }

                length=0;
                lsd = 1;

                do {
                    value.byte[4] = 0;
                    calculate_digit(&value, radix);
                    if (!lsd)
                    {
                        *pstore = (value.byte[4] << 4) | (value.byte[4] >> 4) | *pstore;
                        pstore--;
                    }
                    else
                    {
                        *pstore = value.byte[4];
                    }
                    length++;
                    lsd = !lsd;
                } while( value.ul );

                if (width == 0)
                {
                    // default width. We set it to 1 to output
                    // at least one character in case the value itself
                    // is zero (i.e. length==0)
                    width=1;
                }

                /* prepend spaces if needed */
                if (!zero_padding && !left_justify)
                {
                    while ( width > (unsigned char) (length+1) )
                    {
                        OUTPUT_CHAR( ' ', p );
                        width--;
                    }
                }

                if (signed_argument) // this now means the original value was negative
                {
                    OUTPUT_CHAR( '-', p );
                    // adjust width to compensate for this character
                    width--;
                }
                else if (length != 0)
                {
                    // value > 0
                    if (prefix_sign)
                    {
                        OUTPUT_CHAR( '+', p );
                        // adjust width to compensate for this character
                        width--;
                    }
                    else if (prefix_space)
                    {
                        OUTPUT_CHAR( ' ', p );
                        // adjust width to compensate for this character
                        width--;
                    }
                }

                /* prepend zeroes/spaces if needed */
                if (!left_justify)
                    while ( width-- > length )
                    {
                        OUTPUT_CHAR( zero_padding ? '0' : ' ', p );
                    }
                else
                {
                    /* spaces are appended after the digits */
                    if (width > length)
                        width -= length;
                    else
                        width = 0;
                }

                /* output the digits */
                while( length-- )
                {
                    lsd = !lsd;
                    if (!lsd)
                    {
                        pstore++;
                        value.byte[4] = *pstore >> 4;
                    }
                    else
                    {
                        value.byte[4] = *pstore & 0x0F;
                    }
                    output_digit( value.byte[4], lower_case, output_char, p );
                    charsOutputted++;
                }
                if (left_justify)
                    while (width-- > 0)
                    {
                        OUTPUT_CHAR(' ', p);
                    }
            }
        }
        else
        {
            // nothing special, just output the character
            OUTPUT_CHAR( c, p );
        }
    }

    return charsOutputted;
}
