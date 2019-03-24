#include "types.h"
#include "assert.h"
#include <float.h>
#include <stdio.h>
#include <string.h>

#define LOWORD(x) (*(UINT16 *)&x)
#define HIWORD(x) (*((UINT16 *)&x + 1))
#define LONG(x)   (*(UINT32*)&x)

void test_fsadd_1(float a1, float a2, float r){
    float result;
    debug(1, r);
    result = a1 + a2;
    printf("%x %x-%x %x\n", 
        HIWORD(result), LOWORD(result),
        HIWORD(r), LOWORD(r)
    );
    assert(LONG(r) == LONG(result));
}

void test_fsadd(){
    test_fsadd_1(-.5f, .5f, 0.0f);
#if 0
    test_fsadd_1(.5f, -.5f, 0.0f);
    test_fsadd_1(.5f, .0f, .5f);
    test_fsadd_1(.0f, .5f, .5f);
    test_fsadd_1(.5f, .5f, 1.0f);
    test_fsadd_1(1.0f, 255.0f, 256.0f);
    test_fsadd_1(1.0f, 256.0f, 257.0f);
    test_fsadd_1(-1.0f, -256.0f, -257.0f);
    test_fsadd_1(-1.0f, -255.0f, -256.0f);
    test_fsadd_1(1.0f, -255.0f, -254.0f);
    test_fsadd_1(1.0f, -256.0f, -255.0f);
    test_fsadd_1(-1.0f, 256.0f, 255.0f);
    test_fsadd_1(-1.0f, 255.0f, 254.0f);
#endif
}
