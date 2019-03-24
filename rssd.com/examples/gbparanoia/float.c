#define POWF_MODULE
#include "banks.h"

#include "/sdcc-2.9/device/lib/ldexpf.c"
#include "/sdcc-2.9/device/lib/frexpf.c"
#include "/sdcc-2.9/device/lib/sqrtf.c"
#include "/sdcc-2.9/device/lib/logf.c"
#include "/sdcc-2.9/device/lib/powf.c"

float sqrtf_banked(float x) banked {
    return sqrtf(x);
}

float powf_banked(float x, float y) banked {
    return powf(x, y);
}

float logf_banked(float x) banked {
    return logf(x);
}
