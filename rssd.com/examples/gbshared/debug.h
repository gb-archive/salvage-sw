#ifndef DEBUG_H
#define DEBUG_H

#if defined(D_LOG)

#include "ringbuffer.h"

typedef RINGBUFFER_TYPE(char,254); 
extern ringbuffer_char serial_out_queue;

#define debug_update()                         \
    if(! ringbuffer_isempty(serial_out_queue)) \
        debug_out();

extern void debug_out() banked ;
extern void debug_hex_nibble(UBYTE b) banked;
extern void debug_hex_byte(UBYTE b) banked;
//extern void debug_int(INT16 i) banked;

#define debug_char(c) {                             \
    ringbuffer_push_value(serial_out_queue, c);     \
}

#define debug_string(s)  {            \
    unsigned char * p = s;            \
    while('\0' != *p){                \
        debug_char(*p++);             \
    }                                 \
}

#define debug_msg(msg)  {             \
    debug_int(__LINE__);              \
    debug_char(',');                  \
    debug_string(__FILE__);           \
    debug_char(',');                  \
    debug_string(msg);                \
    debug_char(',');                  \
}

#include <stdarg.h>

extern void 
debug_print(char * fmt, ... ) banked;

#define debug_print0(s) {             \
    char buffer[32];                  \
    strcpy(buffer, s);                \
    debug_print(buffer);              \
}

#define debug_print1(s,x1) {          \
    char buffer[32];                  \
    strcpy(buffer, s);                \
    debug_print(buffer, x1);          \
}

#define debug_print2(s,x1,x2) {       \
    char buffer[32];                  \
    strcpy(buffer, s);                \
    debug_print(buffer, x1, x2);      \
}

#else

#define debug_out()
#define debug_char(c)
#define debug_string(s)
#define debug_msg(msg)
#define debug_hex_nibble(b)
#define debug_hex_byte(b)
#define debug_print(s)
#define debug_update()

#define debug_print0(s)
#define debug_print1(s,x1)
#define debug_print2(s,x1,x2)

#endif

#endif // DEBUG_H
