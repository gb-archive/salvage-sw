#include "types.h"
#include "assert.h"
#include <float.h>
#include <stdio.h>
#include <string.h>

#define LOWORD(x) (*(UINT16 *)&x)
#define HIWORD(x) (*((UINT16 *)&x + 1))
#define LONG(x)   (*(UINT32*)&x)

void test_fsmul_1(float a1, float a2, float r){
    float result;
    debug(1, r);
    result = a1 * a2;
    printf("%x %x-%x %x\n", 
        HIWORD(result), LOWORD(result),
        HIWORD(r), LOWORD(r)
    );
    assert(LONG(r) == LONG(result));
}

void test_fsmul(){
    test_fsmul_1(65535.0f, 65535.0f, 4294836225.0f);
    test_fsmul_1(.5f, .5f, .25f);
    test_fsmul_1(1.0f, 1.0f, 1.0f);
    test_fsmul_1(-.5f, .5f, -.25f);
    test_fsmul_1(.5f, -.5f, -.25f);
    test_fsmul_1(.0f, .5f, .0f);
    test_fsmul_1(.5f, .0f, .0f);
}
