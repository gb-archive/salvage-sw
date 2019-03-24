SDCC = C:/SDCC-2.9
GBDKDIR = "C:/gameboy/gbdk-3.0"

.SUFFIXES: .o .c .s .gb

CC = $(SDCC)/bin/sdcc.bat -I$(GBDKDIR)/include -I$(SDCC)/device/include

AS = $(SDCC)/bin/as-gbz80 -lpo 

#note: gbz80 linker puts OAM data at begining of RAM
LINK = $(SDCC)/bin/link-gbz80 -- -m -u -b_CODE=0x600 -b_DATA=0xc0a0

.c.o:
	$(CC) -c -o $@ $<

.s.o:
	$(AS) $@ $<

.o.gb:
	$(LINK) $@ $&

gbspy.gb: gbspy.o
	$(LINK) -Z gbspy.gb \
	$(GBDKDIR)/lib/crt0.o \
	gbspy.o \
	-l$(GBDKDIR)/lib/gbdk.lib \
	-l$(SDCC)/device/lib/build/gbz80/gbz80.lib

gbspy.o : gbspy.c

clean:
	rm -f *.o *.lst *.map *.gb *~ *.rel *.cdb *.ihx *.lnk *.sym *.asm
