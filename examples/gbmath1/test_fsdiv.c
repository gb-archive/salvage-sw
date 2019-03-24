#include "types.h"
#include "assert.h"
#include <float.h>
#include <stdio.h>
#include <string.h>

#define LOWORD(x) (*(UINT16 *)&x)
#define HIWORD(x) (*((UINT16 *)&x + 1))
#define LONG(x)   (*(UINT32*)&x)

void test_fsdiv_1(float a1, float a2, float r){
    float result;
    debug(1, r);
    result = a1 / a2;
    printf("%x %x-%x %x\n", 
        HIWORD(result), LOWORD(result),
        HIWORD(r), LOWORD(r)
    );
    assert(LONG(r) == LONG(result));
}

void test_fsdiv(){
    test_fsdiv_1(-.5f, .5f, -1.0f);
    test_fsdiv_1(1.0f, .5f, 2.0f);
    test_fsdiv_1(.5f, .0f, (float)0x7fc00000L);
    test_fsdiv_1(.0f, .5f, .0f);
    test_fsdiv_1(.5f, .5f, 1.0f);
    test_fsdiv_1(.5f, -.5f, -1.0f);
    test_fsdiv_1(8.0f, 4.0f, 2.0f);
}
