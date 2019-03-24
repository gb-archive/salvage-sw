//#include <gb/gb.h>
#include <stdio.h>

extern void test_fsadd();
extern void test_div_n();
extern void test_fsdiv();
extern void test_string();
extern void halt();

void main(){
    printf("Hello World!\n");
    printf("fsadd\n");
    test_fsadd();
    printf("div_n\n");
    test_div_n();
    printf("fsdiv\n");
    test_fsdiv();
    test_string();
    halt();
}
