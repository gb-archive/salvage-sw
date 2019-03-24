#include <gb/gb.h>
#include <stdio.h>
#include <types.h>
//#include "tasker.h"
#include "assert.h"
#include "debug.h"

#if defined(D_TRAP)
void
_debug(INT8 i, INT32 v){
	return;
}
void
_trap(INT16 l, char *f, char *s){
	return;
}
#endif

#if defined(D_LOG)

void
_debug(INT8 i, INT32 v){
    debug_print("i=%d, v=%lx\n", i, v);
}
void
_trap(INT16 l, char *f, char *s){
    debug_print("%s:%d %s\n", f, l, s);
}

#endif

#if defined(D_PROFILE)

#if defined(D_LOG)
void 
_profile(UINT8 i){
    debug_print("idle=%d%%\n", i);
    return;
}
#else
void 
_profile(UINT8 idle_percentage){
    return;
}
#endif

void
profile(){
    static UINT16 idle_count = 0;
    static UINT16 total_count = 0;
    if(task_idle_flag)
        ++idle_count;
    if(++total_count == 512){
        _profile(idle_count * 100 / total_count);
        total_count =
        idle_count = 0;
    }
}

#endif
