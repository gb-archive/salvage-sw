SDCC = "C:/SDCC-2.9"
GBDKDIR	= "C:/gameboy/gbdk-3.0"

.SUFFIXES: .o .c .s	.gb

CC = $(SDCC)/bin/sdcc.bat -I$(GBDKDIR)/include  -I$(SDCC)/device/include

AS = $(SDCC)/bin/as-gbz80 -lpo 

# note: gbz80 linker	puts OAM data at begining of RAM
LINK = $(SDCC)/bin/link-gbz80 -- -m -b_CODE=0x400 -b_DATA=0xc0a0 -yp0x143=0x80 -yt1 -yo8

.c.o:
	$(CC) -c -o	$@ $<

.s.o:
	$(AS) $@ $<

 .o.gb:
	$(LINK)	$@ $&
	
OBJS = gbtestlib.o

gbtestlib.gb: $(OBJS) $(GBDKDIR)/lib/gbdk.lib $(SDCC)/device/lib/build/gbz80/gbz80.lib
	$(LINK) -Z gbtestlib.gb \
    $(GBDKDIR)/lib/crt0.o \
    $(OBJS) \
    -l$(GBDKDIR)/lib/gbdk.lib \
    -l$(SDCC)/device/lib/build/gbz80/gbz80.lib

clean:
	rm -f *.o *.lst	*.map *.gb *~ *.rel	*.cdb *.ihx	*.lnk *.sym	*.asm
