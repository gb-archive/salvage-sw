//#include <gb/gb.h>
#include <stdio.h>

extern void test_mul();
extern void test_mul_n();
extern void test_fsmul();
extern void test_fsadd();
extern void test_fsdiv();
extern void halt();

void main(){
    printf("Hello World!\n");
    printf(".mul\n");
    test_mul();
    printf(".mul_n\n");
    test_mul_n();
    printf("fsmul\n");
    test_fsmul();
#if 0
    printf("fsadd\n");
    test_fsadd();
    printf("fsdiv\n");
    test_fsdiv();
#endif
    halt();
}
