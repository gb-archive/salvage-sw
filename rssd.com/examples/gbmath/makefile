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

OBJS = assert.o gbmath.o test_mul.o test_mul_n.o \
    test_fsmul.o test_fsadd.o test_fsdiv.o

gbmath.gb: $(OBJS) $(SDCC)/device/lib/build/gbz80/gbz80.lib
	$(LINK)	-Z gbmath.gb \
	$(GBDKDIR)/lib/crt0.o \
	assert.o \
	gbmath.o \
	$(OBJS)	\
	-l$(GBDKDIR)/lib/gbdk.lib \
	-l$(SDCC)/device/lib/build/gbz80/gbz80.lib

gbmath.o : gbmath.c
assert.o : ../gbshared/assert.c	../gbshared/assert.h
test_mul.o : test_mul.c
test_mul_n.o : test_mul_n.c
test_fsmul.o : test_fsmul.c
test_fsadd.o : test_fsadd.c
test_fsdiv.o : test_fsdiv.c

clean:
	rm -f *.o *.lst	*.map *.gb *~ *.rel	*.cdb *.ihx	*.lnk *.sym	*.asm
