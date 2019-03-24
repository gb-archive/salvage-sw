SDCC = C:/SDCC-2.9
GBDKDIR	= "C:/gameboy/gbdk-3.0"

.SUFFIXES: .o .c .s	.gb

CC = $(SDCC)/bin/sdcc.bat $(BUILD) -I$(GBDKDIR)/include -I$(SDCC)/device/include

AS = $(SDCC)/bin/as-gbz80 -lpo 

#note: gbz80 linker	puts OAM data at begining of RAM
LINK = $(SDCC)/bin/link-gbz80 -- -m	-u -b_CODE=0x600 -b_DATA=0xc0a0

.c.o:
	$(CC) -c -o	$@ $<

.s.o:
	$(AS) $@ $<

.o.gb:
	$(LINK)	$@ $&

OBJS = assert.o gbmath1.o test_fsadd.o test_div_n.o test_fsdiv.o test_string.o

gbmath1.gb: $(OBJS) $(GBDKDIR)/lib/gbdk.lib $(SDCC)/device/lib/build/gbz80/gbz80.lib
	$(LINK)	-Z gbmath1.gb \
	$(GBDKDIR)/lib/crt0.o \
	assert.o \
	$(OBJS)	\
	-l$(GBDKDIR)/lib/gbdk.lib \
	-l$(SDCC)/device/lib/build/gbz80/gbz80.lib

gbmath1.o : gbmath1.c
assert.o : ../gbshared/assert.c ../gbshared/assert.h
test_fsadd.o : test_fsadd.c
test_fsdiv.o : test_fsdiv.c
test_div_n.o : test_div_n.c
test_string.o : test_string.c

clean:
	rm -f *.o *.lst	*.map *.gb *~ *.rel	*.cdb *.ihx	*.lnk *.sym	*.asm
