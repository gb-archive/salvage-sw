/*
   sfr16.c
*/

#include <testfwk.h>

#if defined (SDCC_mcs51)
  sfr at 0x8A SFR_LSB;        //timer 0 low byte
  sfr at 0x8C SFR_MSB;        //timer 0 high byte
  sfr16 at 0x8C8A SFR_16;     //timer 0
  sfr32 at 0x8C8ACDCC SFR_32; //timer 0 & 2
#elif defined (SDCC_ds390)
  sfr at 0x8B SFR_LSB;        //timer 1 low byte
  sfr at 0x8D SFR_MSB;        //timer 1 high byte
  sfr16 at 0x8D8B SFR_16;     //timer 1
  sfr32 at 0x8D8BCDCC SFR_32; //timer 1 & 2
#endif

void
test_sfr(void)
{
#if defined (SFR_16)
  SFR_16 = 0x00FE;
  ASSERT (SFR_MSB == 0x00);
  ASSERT (SFR_LSB == 0xFE);

  SFR_16++;
  ASSERT (SFR_MSB == 0x00);
  ASSERT (SFR_LSB == 0xFF);

  SFR_16++;
  ASSERT (SFR_MSB == 0x01);
  ASSERT (SFR_LSB == 0x00);

  SFR_LSB++;
  ASSERT (SFR_16 == 0x0101);

  SFR_32 = 0x12345678;
  SFR_32 -= 0x02040608;
  ASSERT (SFR_32 == 0x10305070);
#endif
}
