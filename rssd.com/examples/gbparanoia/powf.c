#include "banks.h"
#pragma bank POWF_BANK

#include "/Program Files/sdcc/device/lib/ldexpf.c"
#include "/Program Files/sdcc/device/lib/frexpf.c"
#include "/Program Files/sdcc/device/lib/expf.c"
#include "/Program Files/sdcc/device/lib/logf.c"

float powf_banked(float x, float y) banked {
    return powf(x, y);
}

float logf_banked(float x) banked {
    return logf(x);
}
