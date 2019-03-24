#include <stdio.h>
#include "subs.h"

void
TstCond (INT K, INT Valid, CHARP T)
#ifdef KR_headers
int K, Valid;
char *T;
#endif
{ 
    if (! Valid) { 
        BadCond(K,T); printf(".\n"); 
    } 
}

void
BadCond(INT K, CHARP T)
#ifdef KR_headers
int K;
char *T;
#endif
{
    static char *msg[] = { "FAILURE", "SERIOUS DEFECT", "DEFECT", "FLAW" };

    ErrCnt [K] = ErrCnt [K] + 1;
    printf("%s:  %s", msg[K], T);
}

void
notify(CHARP s)
#ifdef KR_headers
char *s;
#endif
{
    printf("%s test appears to be inconsistent...\n", s);
    printf("   PLEASE NOTIFY KARPINKSI!\n");
}
