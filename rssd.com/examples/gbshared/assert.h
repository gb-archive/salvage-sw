#ifndef ASSERT_H
#define ASSERT_H

#include <types.h>

#if defined(D_TRAP)
// make locals visible in map files
#define local 
#else
#define local static
#endif

#if defined(D_TRAP) || defined(D_LOG)

extern void _debug(INT8 i, INT32 v);
extern void _trap(INT16 l, char *f, char *s);

/* enable debug trap */
#define debug(i,v) _debug(i, (INT32)v)
/* enable assert trap */
#define assert(i) {if(!(i))_trap(__LINE__,__FILE__,#i);}

#define assert_address_rom(address, size)               \
    {                                                   \
        if((void *)((char *)(address) + size) >= (void *)0x8000)  \
            _trap(__LINE__,__FILE__,(char *)address);   \
    }

#define assert_address_ram(address, size)               \
    {                                                   \
        if(                                             \
            (void *)((char *)(address) + size) >= (void *)0xe000  \
            || (void *)(address) < (void *)0xc000       \
        )                                               \
            _trap(__LINE__,__FILE__,(char *)address);   \
    }

#define assert_address_stack(address, size)             \
    {                                                   \
        char i;                                          \
        if(                                             \
            (void *)((char *)(address) + size) >= (void *)0xe000  \
            || (char *)(address) < & i                  \
        )                                               \
            _trap(__LINE__,__FILE__,(char *)address);   \
    }

#define assert_stack_probe()                            \
    void * _stack_probe = & _stack_probe

#define assert_stack_check()                            \
    assert(_stack_probe == & _stack_probe)

#else

#define debug(i,v)
#define assert(i)
#define assert_address_rom(address, size) 
#define assert_address_ram(address, size) 
#define assert_address_stack(address, size) 
#define assert_stack_probe()
#define assert_stack_check()

#endif

#if defined(D_PROFILE)
extern void profile();
#else
#define profile();
#endif

#endif // ASSERT_H


