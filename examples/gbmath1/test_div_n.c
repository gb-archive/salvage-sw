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
void test_forward_1(UINT8 *m, UINT8 *r, UINT8 *u, UINT8 *v){
    _asm
    ld      b,#1
    jp      .div_n
    _endasm;
}

void test_div_n_1(UINT8 u, UINT8 v, UINT8 result){
    UINT8 r;
    UINT8 m;
    test_forward_1(&m, &r, &u, &v);

    printf("%x-%x\n", r, result); 
    assert(r == result);
}

void test_forward_3(UINT32 *m, UINT32 *r, UINT32 *u, UINT32 *u){
    _asm
    ld      b,#3
    jp      .div_n
    _endasm;
}

void test_div_n_3(UINT32 u, UINT32 v, UINT32 result){
    UINT32 r;
    UINT32 m;
    test_forward_3(&m, &r, &u, &v);

    printf("%x %x-%x %x\n",
        HIWORD(result), LOWORD(result),
        HIWORD(r), LOWORD(r)
    );
    assert(0 == memcmp(r,&result,3));
}

void test_forward_4(UINT32 *m, UINT32 *r, UINT32 *u, UINT32 *u){
    _asm
    ld      b,#4
    jp      .div_n
    _endasm;
}

void test_div_n_4(UINT32 u, UINT32 v, UINT32 result){
    UINT32 r;
    UINT32 m;
    test_forward_4(&m, &r, &u, &v);

    printf("%x %x-%x %x\n", 
        HIWORD(result), LOWORD(result),
        HIWORD(r), LOWORD(r)
    );
    assert(r == result);
}

void test_divulong(unsigned long u, unsigned long v, unsigned long result){
    unsigned long r;
    r = u / v;
    printf("%x %x-%x %x\n", 
        HIWORD(result), LOWORD(result),
        HIWORD(r), LOWORD(r)
    );
    assert(r == result);
}

void test_divslong(long u, long v, long result){
    long r;
    r = u / v;
    printf("%x %x-%x %x\n", 
        HIWORD(result), LOWORD(result),
        HIWORD(r), LOWORD(r)
    );
    assert(r == result);
}

void test_div_n(){
    test_div_n_4(1555200UL, 3681UL, 422);
    test_divslong(-1555200L, -3681L, 422);

    printf("1\n");
    test_div_n_1(8, 4, 2);
    test_div_n_1(8, 2, 4);
    test_div_n_1(0, 16, 0);

    printf("3\n");
    test_div_n_3(8, 4, 2);
    test_div_n_3(8, 2, 4);
    test_div_n_3(256, 16, 16);

    printf("4\n");
    test_div_n_4(8, 4, 2);
    test_div_n_4(8, 2, 4);
    test_div_n_4(256, 16, 16);

    printf("divulong\n");
    test_divulong(8L, 0L, 0x7fffffffL);
    test_divulong(0L, 4L, 0L);
    test_divulong(8L, 4L, 2L);
    test_divulong(8L, 2L, 4L);
    test_divulong(256L, 16L, 16L);

    printf("divslong\n");
    test_divslong(8L, 0L, 0x7fffffffL);
    test_divslong(0L, 4L, 0L);
    test_divslong(8L, 4L, 2L);
    test_divslong(8L, 2L, 4L);
    test_divslong(256L, 16L, 16L);
    test_divslong(-8L, 0L, 0x7fffffffL);
    test_divslong(0L, -4L, 0L);
    test_divslong(-8L, 4L, -2L);
    test_divslong(8L, -2L, -4L);
    test_divslong(-256L, -16L, 16L);

    printf("from gbvario\n");
}
