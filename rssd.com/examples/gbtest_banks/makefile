SDCC = C:/SDCC-2.9
GBDKDIR = "C:/gameboy/gbdk-3.0"

.SUFFIXES: .o .c .s .gb

CC = $(SDCC)/bin/sdcc.bat -I$(GBDKDIR)/include -I$(SDCC)/device/include

AS = $(SDCC)/bin/as-gbz80 -lpo 

#note: gbz80 linker puts OAM data at begining of RAM
LINK = $(SDCC)/bin/link-gbz80 -- -m -u -b_CODE=0x200 -b_DATA=0xc0a0 -yo4 -yt1

.c.o:
	$(CC) -c -o $@ $<

.s.o:
	$(AS) $@ $<

.o.gb:
	$(LINK) $@ $&

gbtest_banks.gb: gbtest_banks.o hdigits.o display.o checkkey.o
	$(LINK) -Z gbtest_banks.gb \
	$(GBDKDIR)/lib/crt0.o \
	gbtest_banks.o hdigits.o display.o checkkey.o \
	-l$(GBDKDIR)/lib/gbdk.lib \
	-l$(SDCC)/device/lib/build/gbz80/gbz80.lib

gbtest_banks.o : gbtest_banks.c ../gbshared/assert.h hdigits.h
hdigits.o : ../gbshared/hdigits.c ../gbshared/hdigits.h
display.o : display.c display.h
checkkey.o : checkkey.c checkkey.h

clean:
	rm -f *.o *.lst *.map *.gb *~ *.rel *.cdb *.ihx *.lnk *.sym *.asm
