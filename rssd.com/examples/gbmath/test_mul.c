#include "types.h"
#include "assert.h"

#include <stdio.h>

void test_mul_1(UINT8 a1, UINT8 a2, UINT8 result){
    printf("%u - %u\n", a1 * a2, result);
    assert(result == a1 * a2);
}
void test_mul_2(INT8 a1, INT8 a2, INT8 result){
    printf("%x - %x\n", a1 * a2, result);
    assert(result == a1 * a2);
}
void test_mul_3(UINT16 a1, UINT16 a2, UINT16 result){
    printf("%x - %x\n", a1 * a2,result);
    assert(result == a1 * a2);
}
void test_mul_4(INT16 a1, INT16 a2, INT16 result){
    printf("%x - %x\n", a1 * a2, result);
    assert(result == a1 * a2);
}

void test_mul(){
    test_mul_1(2, 4, 8);
    test_mul_2(2, 4, 8);
    test_mul_2(-2, -4, 8);
    test_mul_2(-2, 4, -8);
    test_mul_2(2, -4, -8);

    test_mul_3(2, 4, 8);
    test_mul_4(-2, 4, -8);
    test_mul_4(2, -4, -8);
    test_mul_4(-2, -4, 8);
}
