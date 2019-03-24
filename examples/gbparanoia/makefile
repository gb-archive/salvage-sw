SDCC = "C:/SDCC-2.9"
GBDKDIR	= "C:/gameboy/gbdk-3.0"

.SUFFIXES: .o .c .s	.gb

CC = $(SDCC)/bin/sdcc.bat -I$(GBDKDIR)/include  -I$(SDCC)/device/include

AS = $(SDCC)/bin/as-gbz80 -lpo 

# note: gbz80 linker	puts OAM data at begining of RAM
LINK = $(SDCC)/bin/link-gbz80 -- \
 -m -b_CODE=0x400 -b_DATA=0xc0a0 -yp0x143=0x80 -yt1 -yo8

.c.o:
	$(CC) -c -o	$@ $<

#.s.o:
#	$(AS) $@ $<

 .o.gb:
	$(LINK)	$@ $&
	
OBJS = gbparanoia.o paranoia.o float.o subs.o subs_0.o \
    part1.o part2.o part3.o part4.o part5.o part6.o part7.o part8.o

gbparanoia.gb: $(OBJS) $(GBDKDIR)/lib/gbdk.lib $(SDCC)/device/lib/build/gbz80/gbz80.lib
	$(LINK) -Z gbparanoia.gb \
    $(GBDKDIR)/lib/crt0.o \
    $(OBJS) \
    -l$(GBDKDIR)/lib/gbdk.lib \
    -l$(SDCC)/device/lib/build/gbz80/gbz80.lib
    
gbparanoia.o : gbparanoia.c
paranoia.o : paranoia.c
float.o : float.c
subs.o : subs.c
subs_0.o : subs_0.c
part1.o : part1.c
part2.o : part2.c
part3.o : part3.c
part4.o : part4.c
part5.o : part5.c
part6.o : part6.c
part7.o : part7.c
part8.o : part8.c
    
test_mul.o : test_mul.c
test_mul_n.o : test_mul_n.c
test_fsmul.o : test_fsmul.c
test_fsadd.o : test_fsadd.c
test_fsdiv.o : test_fsdiv.c

clean:
	rm -f *.o *.lst	*.map *.gb *~ *.rel	*.cdb *.ihx	*.lnk *.sym	*.asm
