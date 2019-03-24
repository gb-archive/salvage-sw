#include <gb/gb.h> /* halt */
#include <stdio.h> /* printf */
#include <string.h>

void test_memset(){
    unsigned char d[32];
    int i;

    memset(d, 0xa5, sizeof(d));

    for(i = 0; i < sizeof(d); ++i){
        if(d[i] != 0xa5){
            printf("memset fails at byte %i\n", i);
            return;
        }
    }
    printf("memset passed\n");
}
void test_memcpy(){
    unsigned char * s = "123";
    unsigned char d[32];
    memcpy(d, s, 4);
    printf("Test memcpy\n");
    printf("source = %s, destination = %s\n", s, d);
}
void test_memcmp(){
    unsigned char * buf1 = "123";
    unsigned char * buf2 = "567";
    if(! (memcmp(buf1, buf2, 4) < 0))
        printf("memcmp fails for buf1 < buf2\n");
    else
    if(! (memcmp(buf2, buf1, 4) > 0))
        printf("memcmp fails for buf1 > buf2\n");
    else
    if(! (memcmp(buf1, buf1, 4) == 0))
        printf("memcmp fails for buf1 == buf1\n");
    else
        printf("memcmp passes\n");
}
void test_strcmp(){
    unsigned char * buf1 = "123";
    unsigned char * buf2 = "567";
    if(! (strcmp(buf1, buf2) < 0))
        printf("strcmp fails for buf1 < buf2\n");
    else
    if(! (strcmp(buf2, buf1) > 0))
        printf("strcmp fails for buf1 > buf2\n");
    else
    if(! (strcmp(buf1, buf1) == 0))
        printf("strcmp fails for buf1 == buf1\n");
    else
        printf("strcmp passes\n");
}
void test_strcpy(){
    char * s = "123";
    char d[32];
    strcpy(d, s);
    printf("Test strcpy\n");
    printf("source = %s, destination = %s\n", s, d);
}
void main(){
    printf("Hello World\n");
    test_memcmp();
    test_strcmp();
    test_memset();
    test_strcpy();
    test_memcpy();
    printf("Bye World\n");
    halt();
}
