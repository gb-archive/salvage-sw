#ifndef SUBS_H
#define SUBS_H

#include "paranoia.h"

extern void Pause(VOID) banked;
extern FLOAT Sign(FLOAT) banked;
extern FLOAT Random(void) banked;
extern void SqXMinX(int) banked;
extern void NewD(VOID) banked;
extern void SR3750(VOID) banked;
extern void IsYeqX(VOID) banked;
extern void SR3980(VOID) banked;
extern void PrintIfNPositive(VOID) banked;
extern void TstPtUf(VOID) banked;

extern void notify(char*);
extern void TstCond(int, int, char*);
extern void BadCond(int, char*);

#endif /* SUBS_H */
