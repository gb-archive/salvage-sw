#include "types.h"
#include "assert.h"
#include <float.h>
#include <stdio.h>
#include <string.h>

#define LOWORD(x) (*(UINT16 *)&x)
#define HIWORD(x) (*((UINT16 *)&x + 1))
#define LONG(x)   (*(UINT32*)&x)

/* address the fact that we can't handle a name starting with '.'
 * in C
 */
void test_forward_1(UINT8 *r, UINT8 *a2, UINT8 *a1){
    _asm
    ld      b,#1
    jp      .mul_n
    _endasm;
}

void test_mul_n_1(UINT8 a1, UINT8 a2, UINT8 result){
    UINT8 r;
    test_forward_1(&r, &a1, &a2);

    printf("%x-%x\n", r, result); 
    assert(r == result);
}

void test_forward_3(UINT32 *r, UINT32 *a2, UINT32 *a1){
    _asm
    ld      b,#3
    jp      .mul_n
    _endasm;
}

void test_mul_n_3(UINT32 a1, UINT32 a2, UINT32 result){
    UINT32 r;
    r = 0L;
    test_forward_3(&r, &a1, &a2);

    printf("%x %x-%x %x\n",
        HIWORD(result), LOWORD(result),
        HIWORD(r), LOWORD(r)
    );
    assert(0 == memcmp(r,&result,3));
}

void test_forward_4(UINT32 *r, UINT32 *a2, UINT32 *a1){
    _asm
    ld      b,#4
    jp      .mul_n
    _endasm;
}

void test_mul_n_4(UINT32 a1, UINT32 a2, UINT32 result){
    UINT32 r;
    test_forward_4(&r, &a1, &a2);

    printf("%x %x-%x %x\n", 
        HIWORD(result), LOWORD(result),
        HIWORD(r), LOWORD(r)
    );
    assert(r == result);
}

void test_mullong(unsigned long a1, unsigned long a2, unsigned long result){
    unsigned long r;
    r = a1 * a2;
    printf("%4x %4x-%4x %4x\n", 
        HIWORD(result), LOWORD(result),
        HIWORD(r), LOWORD(r)
    );
    assert(r == result);
}

void test_mul_n(){
    test_mul_n_4(0x12C, 0xF61, 0x1205AC);

    printf("1\n");
    test_mul_n_1(2, 4, 8);
    test_mul_n_1(4, 2, 8);
    test_mul_n_1(16, 16, 0);
    printf("3\n");
    test_mul_n_3(2, 4, 8);
    test_mul_n_3(4, 2, 8);
    test_mul_n_3(16, 16, 256);
    printf("4\n");
    test_mul_n_4(2, 4, 8);
    test_mul_n_4(4, 2, 8);
    test_mul_n_4(16, 16, 256);
    test_mul_n_4(0x12C, 0xF61, 0x1205AC);

    printf("mullong\n");
    test_mullong(2L, 4L, 8L);
    test_mullong(4L, 2L, 8L);
    test_mullong(16L, 16L, 256L);
    test_mullong(0x12C, 0xF61, 0x1205AC);
}
