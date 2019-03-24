;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.0 #5416 (Apr  7 2010) (MINGW32)
; This file was generated Sun Apr 11 14:38:29 2010
;--------------------------------------------------------
	.module time
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _RtcRead
	.globl ___day
	.globl ___month
	.globl _time
	.globl _asctime
	.globl _ctime
	.globl _localtime
	.globl _gmtime
	.globl _mktime
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
;  ram data
;--------------------------------------------------------
	.area _DATA
_monthDays:
	.ds 12
___month::
	.ds 24
___day::
	.ds 14
_ascTimeBuffer:
	.ds 32
_lastTime:
	.ds 12
;--------------------------------------------------------
; overlayable items in  ram 
;--------------------------------------------------------
	.area _OVERLAY
;--------------------------------------------------------
; external initialized ram data
;--------------------------------------------------------
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;../time.c:59: static _CODE char monthDays[]={31,28,31,30,31,30,31,31,30,31,30,31};
	ld	hl,#_monthDays
	call	__initrleblock
	.db	12
	.db	0x1F, 0x1C, 0x1F, 0x1E, 0x1F, 0x1E, 0x1F, 0x1F
	.db	0x1E, 0x1F, 0x1E, 0x1F
	.db	0
;../time.c:61: _CODE char * _CODE __month[]={"Jan","Feb","Mar","Apr","May","Jun",
	ld	hl,#___month
	ld	(hl),#<__str_1
	inc	hl
	ld	(hl),#>__str_1
	ld	hl, #___month + 2
	ld	(hl),#<__str_2
	inc	hl
	ld	(hl),#>__str_2
	ld	hl, #___month + 4
	ld	(hl),#<__str_3
	inc	hl
	ld	(hl),#>__str_3
	ld	hl, #___month + 6
	ld	(hl),#<__str_4
	inc	hl
	ld	(hl),#>__str_4
	ld	hl, #___month + 8
	ld	(hl),#<__str_5
	inc	hl
	ld	(hl),#>__str_5
	ld	hl, #___month + 10
	ld	(hl),#<__str_6
	inc	hl
	ld	(hl),#>__str_6
	ld	hl, #___month + 12
	ld	(hl),#<__str_7
	inc	hl
	ld	(hl),#>__str_7
	ld	hl, #___month + 14
	ld	(hl),#<__str_8
	inc	hl
	ld	(hl),#>__str_8
	ld	hl, #___month + 16
	ld	(hl),#<__str_9
	inc	hl
	ld	(hl),#>__str_9
	ld	hl, #___month + 18
	ld	(hl),#<__str_10
	inc	hl
	ld	(hl),#>__str_10
	ld	hl, #___month + 20
	ld	(hl),#<__str_11
	inc	hl
	ld	(hl),#>__str_11
	ld	bc,#___month + 22
	ld	l,c
	ld	h,b
	ld	(hl),#<__str_12
	inc	hl
	ld	(hl),#>__str_12
;../time.c:64: _CODE char * _CODE __day[]={"Sun","Mon","Tue","Wed","Thu","Fri","Sat"};
	ld	hl,#___day
	ld	(hl),#<__str_13
	inc	hl
	ld	(hl),#>__str_13
	ld	hl, #___day + 2
	ld	(hl),#<__str_14
	inc	hl
	ld	(hl),#>__str_14
	ld	hl, #___day + 4
	ld	(hl),#<__str_15
	inc	hl
	ld	(hl),#>__str_15
	ld	hl, #___day + 6
	ld	(hl),#<__str_16
	inc	hl
	ld	(hl),#>__str_16
	ld	hl, #___day + 8
	ld	(hl),#<__str_17
	inc	hl
	ld	(hl),#>__str_17
	ld	hl, #___day + 10
	ld	(hl),#<__str_18
	inc	hl
	ld	(hl),#>__str_18
	ld	bc,#___day + 12
	ld	l,c
	ld	h,b
	ld	(hl),#<__str_19
	inc	hl
	ld	(hl),#>__str_19
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;../time.c:38: unsigned char RtcRead(struct tm *timeptr) {
;	---------------------------------
; Function RtcRead
; ---------------------------------
_RtcRead:
	push	ix
	ld	ix,#0
	add	ix,sp
;../time.c:41: return 0;
	ld	l,#0x00
	pop	ix
ret
;../time.c:46: time_t time(time_t *timeptr) {
;	---------------------------------
; Function time
; ---------------------------------
_time:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-16
	add	hl,sp
	ld	sp,hl
;../time.c:48: time_t t=-1;
	ld	-16 (ix),#0xFF
	ld	-15 (ix),#0xFF
	ld	-14 (ix),#0xFF
	ld	-13 (ix),#0xFF
;../time.c:50: if (RtcRead(&now)) {
	ld	hl,#0x0004
	add	hl,sp
	push	hl
	call	_RtcRead
	pop	af
	ld	c,l
	xor	a,a
	or	a,l
	jr	Z,00102$
;../time.c:51: t=mktime(&now);
	ld	hl,#0x0004
	add	hl,sp
	push	hl
	call	_mktime
	pop	af
	ld	b,h
	ld	c,l
	ld	-16 (ix),c
	ld	-15 (ix),b
	ld	-14 (ix),e
	ld	-13 (ix),d
00102$:
;../time.c:53: if (timeptr) {
	ld	a,4 (ix)
	or	a,5 (ix)
	jr	Z,00104$
;../time.c:54: *timeptr=t;
	ld	c,4 (ix)
	ld	b,5 (ix)
	push	bc
	pop	iy
	ld	a,-16 (ix)
	ld	0 (iy),a
	ld	a,-15 (ix)
	ld	1 (iy),a
	ld	a,-14 (ix)
	ld	2 (iy),a
	ld	a,-13 (ix)
	ld	3 (iy),a
00104$:
;../time.c:56: return t;
	ld	l,-16 (ix)
	ld	h,-15 (ix)
	ld	e,-14 (ix)
	ld	d,-13 (ix)
	ld	sp,ix
	pop	ix
ret
;../time.c:69: static void CheckTime(struct tm *timeptr) {
;	---------------------------------
; Function CheckTime
; ---------------------------------
_CheckTime:
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
;../time.c:80: if (timeptr->tm_sec>59) timeptr->tm_sec=59;
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	a,(bc)
	ld	e,a
	ld	a,#0x3B
	cp	a,e
	jr	NC,00102$
	ld	(bc),a
00102$:
;../time.c:81: if (timeptr->tm_min>59) timeptr->tm_min=59;
	ld	hl,#0x0001
	add	hl,bc
	ld	-2 (ix),l
	ld	-1 (ix),h
	ld	e,(hl)
	ld	a,#0x3B
	sub	a,e
	jr	NC,00104$
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),#0x3B
00104$:
;../time.c:82: if (timeptr->tm_hour>23) timeptr->tm_hour=23;
	ld	hl,#0x0002
	add	hl,bc
	ld	-2 (ix),l
	ld	-1 (ix),h
	ld	e,(hl)
	ld	a,#0x17
	sub	a,e
	jr	NC,00106$
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),#0x17
00106$:
;../time.c:83: if (timeptr->tm_wday>6) timeptr->tm_wday=6;
	ld	hl,#0x0007
	add	hl,bc
	ld	-2 (ix),l
	ld	-1 (ix),h
	ld	e,(hl)
	ld	a,#0x06
	sub	a,e
	jr	NC,00108$
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),#0x06
00108$:
;../time.c:84: if (timeptr->tm_mday<1) timeptr->tm_mday=1;
	ld	hl,#0x0003
	add	hl,bc
	ex	de,hl
	ld	a,(de)
	ld	-2 (ix),a
	sub	a,#0x01
	jr	NC,00112$
	ld	a,#0x01
	ld	(de),a
	jr	00113$
00112$:
;../time.c:85: else if (timeptr->tm_mday>31) timeptr->tm_mday=31;
	ld	a,#0x1F
	sub	a,-2 (ix)
	jr	NC,00113$
	ld	a,#0x1F
	ld	(de),a
00113$:
;../time.c:86: if (timeptr->tm_mon>11) timeptr->tm_mon=11;
	ld	hl,#0x0004
	add	hl,bc
	ld	-2 (ix),l
	ld	-1 (ix),h
	ld	e,(hl)
	ld	a,#0x0B
	sub	a,e
	jr	NC,00115$
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),#0x0B
00115$:
;../time.c:87: if (timeptr->tm_year<0) timeptr->tm_year=0;
	inc	bc
	inc	bc
	inc	bc
	inc	bc
	inc	bc
	ld	l,c
	ld	h,b
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,d
	bit	7,a
	jr	Z,00118$
	ld	l,c
	ld	h,b
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
00118$:
	ld	sp,ix
	pop	ix
	ret
;../time.c:91: char *asctime(struct tm *timeptr) {
;	---------------------------------
; Function asctime
; ---------------------------------
_asctime:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-10
	add	hl,sp
	ld	sp,hl
;../time.c:92: CheckTime(timeptr);
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	call	_CheckTime
	pop	af
;../time.c:96: timeptr->tm_year+1900);
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	hl,#0x0005
	add	hl,bc
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x076C
	add	hl,de
	ld	-2 (ix),l
	ld	-1 (ix),h
;../time.c:95: timeptr->tm_hour, timeptr->tm_min, timeptr->tm_sec, 
	ld	a,(bc)
	ld	-4 (ix),a
	ld	-3 (ix),#0x00
	ld	e,c
	ld	d,b
	inc	de
	ld	a,(de)
	ld	-6 (ix),a
	ld	-5 (ix),#0x00
	ld	e,c
	ld	d,b
	inc	de
	inc	de
	ld	a,(de)
	ld	-8 (ix),a
	ld	-7 (ix),#0x00
;../time.c:94: __day[timeptr->tm_wday], __month[timeptr->tm_mon], timeptr->tm_mday,
	ld	hl,#0x0003
	add	hl,bc
	ld	a,(hl)
	ld	-10 (ix),a
	ld	-9 (ix),#0x00
	ld	hl,#0x0004
	add	hl,bc
	ld	e,(hl)
	sla	e
	ld	a,#<___month
	add	a,e
	ld	l,a
	ld	a,#>___month
	adc	a,#0x00
	ld	h,a
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x0007
	add	hl,bc
	ld	a,(hl)
	ld	c,a
	sla	c
	ld	a,#<___day
	add	a,c
	ld	l,a
	ld	a,#>___day
	adc	a,#0x00
	ld	h,a
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
;../time.c:93: sprintf (ascTimeBuffer, "%s %s %2d %02d:%02d:%02d %04d\n",
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	push	hl
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	push	hl
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	push	hl
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	push	hl
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	push	hl
	push	de
	push	bc
	ld	hl,#__str_0
	push	hl
	ld	hl,#_ascTimeBuffer
	push	hl
	call	_sprintf
	ld	iy,#0x0012
	add	iy,sp
	ld	sp,iy
;../time.c:97: return ascTimeBuffer;
	ld	hl,#_ascTimeBuffer
	ld	sp,ix
	pop	ix
ret
__str_0:
	.ascii "%s %s %2d %02d:%02d:%02d %04d"
	.db 0x0A
	.db 0x00
;../time.c:100: char *ctime(time_t *timep) {
;	---------------------------------
; Function ctime
; ---------------------------------
_ctime:
	push	ix
	ld	ix,#0
	add	ix,sp
;../time.c:101: return asctime(localtime(timep));
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	call	_localtime
	pop	af
	ld	b,h
	ld	c,l
	push	bc
	call	_asctime
	pop	af
	pop	ix
ret
;../time.c:117: struct tm *localtime(time_t *timep) {
;	---------------------------------
; Function localtime
; ---------------------------------
_localtime:
	push	ix
	ld	ix,#0
	add	ix,sp
;../time.c:118: return gmtime(timep);
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	call	_gmtime
	pop	af
	pop	ix
ret
;../time.c:121: struct tm *gmtime(time_t *timep) {
;	---------------------------------
; Function gmtime
; ---------------------------------
_gmtime:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-13
	add	hl,sp
	ld	sp,hl
;../time.c:122: unsigned long epoch=*timep;
	ld	c,4 (ix)
	ld	b,5 (ix)
	push	bc
	pop	iy
	ld	c,0 (iy)
	ld	b,1 (iy)
	ld	e,2 (iy)
	ld	d,3 (iy)
	ld	-4 (ix),c
	ld	-3 (ix),b
	ld	-2 (ix),e
	ld	-1 (ix),d
;../time.c:127: lastTime.tm_sec=epoch%60;
	ld	hl,#0x0000
	push	hl
	ld	hl,#0x003C
	push	hl
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	push	hl
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	push	hl
	call	__modulong_rrx_s
	pop	af
	pop	af
	pop	af
	pop	af
	ld	a,l
	ld	hl,#_lastTime
	ld	(hl),a
;../time.c:128: epoch/=60; // now it is minutes
	ld	hl,#0x0000
	push	hl
	ld	hl,#0x003C
	push	hl
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	push	hl
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	push	hl
	call	__divulong_rrx_s
	pop	af
	pop	af
	pop	af
	pop	af
	ld	b,h
	ld	-4 (ix),l
	ld	-3 (ix),b
	ld	-2 (ix),e
	ld	-1 (ix),d
;../time.c:129: lastTime.tm_min=epoch%60;
	ld	hl,#_lastTime + 1
	ld	-13 (ix),l
	ld	-12 (ix),h
	ld	hl,#0x0000
	push	hl
	ld	hl,#0x003C
	push	hl
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	push	hl
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	push	hl
	call	__modulong_rrx_s
	pop	af
	pop	af
	pop	af
	pop	af
	ld	a,l
	ld	l,-13 (ix)
	ld	h,-12 (ix)
	ld	(hl),a
;../time.c:130: epoch/=60; // now it is hours
	ld	hl,#0x0000
	push	hl
	ld	hl,#0x003C
	push	hl
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	push	hl
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	push	hl
	call	__divulong_rrx_s
	pop	af
	pop	af
	pop	af
	pop	af
	ld	b,h
	ld	-4 (ix),l
	ld	-3 (ix),b
	ld	-2 (ix),e
	ld	-1 (ix),d
;../time.c:131: lastTime.tm_hour=epoch%24;
	ld	hl,#_lastTime + 2
	ld	-13 (ix),l
	ld	-12 (ix),h
	ld	hl,#0x0000
	push	hl
	ld	hl,#0x0018
	push	hl
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	push	hl
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	push	hl
	call	__modulong_rrx_s
	pop	af
	pop	af
	pop	af
	pop	af
	ld	a,l
	ld	l,-13 (ix)
	ld	h,-12 (ix)
	ld	(hl),a
;../time.c:132: epoch/=24; // now it is days
	ld	hl,#0x0000
	push	hl
	ld	hl,#0x0018
	push	hl
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	push	hl
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	push	hl
	call	__divulong_rrx_s
	pop	af
	pop	af
	pop	af
	pop	af
	ld	b,h
	ld	-4 (ix),l
	ld	-3 (ix),b
	ld	-2 (ix),e
	ld	-1 (ix),d
;../time.c:133: lastTime.tm_wday=(epoch+4)%7;
	ld	hl,#_lastTime + 7
	ld	-13 (ix),l
	ld	-12 (ix),h
	ld	a,-4 (ix)
	add	a,#0x04
	ld	e,a
	ld	a,-3 (ix)
	adc	a,#0x00
	ld	d,a
	ld	a,-2 (ix)
	adc	a,#0x00
	ld	c,a
	ld	a,-1 (ix)
	adc	a,#0x00
	ld	b,a
	ld	hl,#0x0000
	push	hl
	ld	hl,#0x0007
	push	hl
	push	bc
	push	de
	call	__modulong_rrx_s
	pop	af
	pop	af
	pop	af
	pop	af
	ld	a,l
	ld	l,-13 (ix)
	ld	h,-12 (ix)
	ld	(hl),a
;../time.c:136: days=0;
	xor	a,a
	ld	-11 (ix),a
	ld	-10 (ix),a
	ld	-9 (ix),a
	ld	-8 (ix),a
;../time.c:137: while((days += (LEAP_YEAR(year) ? 366 : 365)) <= epoch) {
	ld	-6 (ix),#0xB2
	ld	-5 (ix),#0x07
00101$:
	ld	a,-6 (ix)
	and	a,#0x03
	ld	d,#0x00
	or	a,d
	sub	a,#0x01
	ld	a,#0x00
	rla
	or	a,a
	jr	Z,00119$
	ld	de,#0x016E
	jr	00120$
00119$:
	ld	de,#0x016D
00120$:
	ld	a,d
	rla	
	sbc	a,a
	ld	c,a
	ld	b,a
	ld	a,-11 (ix)
	add	a,e
	ld	e,a
	ld	a,-10 (ix)
	adc	a,d
	ld	d,a
	ld	a,-9 (ix)
	adc	a,c
	ld	c,a
	ld	a,-8 (ix)
	adc	a,b
	ld	b,a
	ld	-11 (ix),e
	ld	-10 (ix),d
	ld	-9 (ix),c
	ld	-8 (ix),b
	ld	a,-4 (ix)
	sub	a,e
	ld	a,-3 (ix)
	sbc	a,d
	ld	a,-2 (ix)
	sbc	a,c
	ld	a,-1 (ix)
	sbc	a,b
	jr	C,00103$
;../time.c:138: year++;
	inc	-6 (ix)
	jr	NZ,00134$
	inc	-5 (ix)
00134$:
	jp	00101$
00103$:
;../time.c:140: lastTime.tm_year=year-1900;
	ld	bc,#_lastTime + 5
	ld	a,-6 (ix)
	add	a,#0x94
	ld	e,a
	ld	a,-5 (ix)
	adc	a,#0xF8
	ld	d,a
	ld	l,c
	ld	h,b
	ld	(hl),e
	inc	hl
	ld	(hl),d
;../time.c:142: days -= LEAP_YEAR(year) ? 366 : 365;
	ld	a,-6 (ix)
	and	a,#0x03
	ld	-13 (ix),a
	ld	-12 (ix),#0x00
	ld	a,-13 (ix)
	or	a,-12 (ix)
	sub	a,#0x01
	ld	a,#0x00
	rla
	or	a,a
	jr	Z,00121$
	ld	de,#0x016E
	jr	00122$
00121$:
	ld	de,#0x016D
00122$:
	ld	a,d
	rla	
	sbc	a,a
	ld	c,a
	ld	b,a
	ld	a,-11 (ix)
	sub	a,e
	ld	-11 (ix),a
	ld	a,-10 (ix)
	sbc	a,d
	ld	-10 (ix),a
	ld	a,-9 (ix)
	sbc	a,c
	ld	-9 (ix),a
	ld	a,-8 (ix)
	sbc	a,b
	ld	-8 (ix),a
;../time.c:143: epoch -= days; // now it is days in this year, starting at 0
	ld	a,-4 (ix)
	sub	a,-11 (ix)
	ld	-4 (ix),a
	ld	a,-3 (ix)
	sbc	a,-10 (ix)
	ld	-3 (ix),a
	ld	a,-2 (ix)
	sbc	a,-9 (ix)
	ld	-2 (ix),a
	ld	a,-1 (ix)
	sbc	a,-8 (ix)
	ld	-1 (ix),a
;../time.c:144: lastTime.tm_yday=epoch;
	ld	bc,#_lastTime + 8
	ld	e,-4 (ix)
	ld	d,-3 (ix)
	ld	l,c
	ld	h,b
	ld	(hl),e
	inc	hl
	ld	(hl),d
;../time.c:149: for (month=0; month<12; month++) {
	ld	-7 (ix),#0x00
00113$:
	ld	a,-7 (ix)
	sub	a,#0x0C
	jp	NC,00116$
;../time.c:150: if (month==1) { // februari
	ld	a,-7 (ix)
	sub	a,#0x01
	jr	NZ,00108$
;../time.c:151: if (LEAP_YEAR(year)) {
	ld	a,-13 (ix)
	or	a,-12 (ix)
	jr	NZ,00105$
;../time.c:152: monthLength=29;
	ld	b,#0x1D
	jr	00109$
00105$:
;../time.c:154: monthLength=28;
	ld	b,#0x1C
	jr	00109$
00108$:
;../time.c:157: monthLength = monthDays[month];
	ld	a,#<_monthDays
	add	a,-7 (ix)
	ld	e,a
	ld	a,#>_monthDays
	adc	a,#0x00
	ld	d,a
	ld	a,(de)
	ld	e,a
	ld	b,e
00109$:
;../time.c:160: if (epoch>=monthLength) {
	ld	de,#0x0000
	ld	c,#0x00
	ld	a,-4 (ix)
	sub	a,b
	ld	a,-3 (ix)
	sbc	a,e
	ld	a,-2 (ix)
	sbc	a,d
	ld	a,-1 (ix)
	sbc	a,c
	jr	C,00116$
;../time.c:161: epoch-=monthLength;
	ld	a,-4 (ix)
	sub	a,b
	ld	-4 (ix),a
	ld	a,-3 (ix)
	sbc	a,e
	ld	-3 (ix),a
	ld	a,-2 (ix)
	sbc	a,d
	ld	-2 (ix),a
	ld	a,-1 (ix)
	sbc	a,c
	ld	-1 (ix),a
;../time.c:149: for (month=0; month<12; month++) {
	inc	-7 (ix)
	jp	00113$
00116$:
;../time.c:166: lastTime.tm_mon=month;
	ld	bc,#_lastTime + 4
	ld	a,-7 (ix)
	ld	(bc),a
;../time.c:167: lastTime.tm_mday=epoch+1;
	ld	bc,#_lastTime + 3
	ld	e,-4 (ix)
	ld	a,e
	inc	a
	ld	(bc),a
;../time.c:169: lastTime.tm_isdst=0;
	ld	bc,#_lastTime + 10
	ld	a,#0x00
	ld	(bc),a
;../time.c:171: return &lastTime;
	ld	hl,#_lastTime
	ld	sp,ix
	pop	ix
ret
;../time.c:175: time_t mktime(struct tm *timeptr) {
;	---------------------------------
; Function mktime
; ---------------------------------
_mktime:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-14
	add	hl,sp
	ld	sp,hl
;../time.c:176: int year=timeptr->tm_year+1900, month=timeptr->tm_mon, i;
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	hl,#0x0005
	add	hl,bc
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x076C
	add	hl,de
	ld	-2 (ix),l
	ld	-1 (ix),h
	ld	hl,#0x0004
	add	hl,bc
	ld	a,(hl)
	ld	-4 (ix),a
	ld	-3 (ix),#0x00
;../time.c:179: CheckTime(timeptr);
	push	bc
	call	_CheckTime
	pop	af
;../time.c:182: seconds= (year-1970)*(60*60*24L*365);
	ld	a,-2 (ix)
	add	a,#0x4E
	ld	c,a
	ld	a,-1 (ix)
	adc	a,#0xF8
	ld	b,a
	rla	
	sbc	a,a
	ld	l,a
	ld	h,a
	push	hl
	push	bc
	ld	hl,#0x01E1
	push	hl
	ld	hl,#0x1E13380
	push	hl
	call	__mullong_rrx_s
	pop	af
	pop	af
	pop	af
	pop	af
	ld	b,h
	ld	-10 (ix),l
	ld	-9 (ix),b
	ld	-8 (ix),e
	ld	-7 (ix),d
;../time.c:185: for (i=1970; i<year; i++) {
	ld	a,-10 (ix)
	ld	-14 (ix),a
	ld	a,-9 (ix)
	ld	-13 (ix),a
	ld	a,-8 (ix)
	ld	-12 (ix),a
	ld	a,-7 (ix)
	ld	-11 (ix),a
	ld	bc,#0x07B2
00107$:
	ld	a,c
	sub	a,-2 (ix)
	ld	a,b
	sbc	a,-1 (ix)
	jp	P,00124$
;../time.c:186: if (LEAP_YEAR(i)) {
	push	bc
	ld	hl,#0x0004
	push	hl
	push	bc
	call	__modsint_rrx_s
	pop	af
	pop	af
	ex	de,hl
	pop	bc
	ld	a,e
	or	a,d
	jr	NZ,00109$
;../time.c:187: seconds+= 60*60*24L;
	ld	a,-14 (ix)
	add	a,#0x80
	ld	-14 (ix),a
	ld	a,-13 (ix)
	adc	a,#0x51
	ld	-13 (ix),a
	ld	a,-12 (ix)
	adc	a,#0x01
	ld	-12 (ix),a
	ld	a,-11 (ix)
	adc	a,#0x00
	ld	-11 (ix),a
00109$:
;../time.c:185: for (i=1970; i<year; i++) {
	inc	bc
	jr	00107$
00124$:
	ld	a,-14 (ix)
	ld	-10 (ix),a
	ld	a,-13 (ix)
	ld	-9 (ix),a
	ld	a,-12 (ix)
	ld	-8 (ix),a
	ld	a,-11 (ix)
	ld	-7 (ix),a
;../time.c:192: for (i=0; i<month; i++) {
	ld	hl,#0x0004
	push	hl
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	push	hl
	call	__modsint_rrx_s
	pop	af
	pop	af
	ld	-13 (ix),h
	ld	-14 (ix),l
	ld	-6 (ix),#0x00
	ld	-5 (ix),#0x00
00111$:
	ld	a,-6 (ix)
	sub	a,-4 (ix)
	ld	a,-5 (ix)
	sbc	a,-3 (ix)
	jp	P,00114$
;../time.c:193: if (i==1 && LEAP_YEAR(year)) { 
	ld	a,-6 (ix)
	sub	a,#0x01
	jr	NZ,00126$
	ld	a,-5 (ix)
	or	a,a
	jr	Z,00127$
00126$:
	jr	00104$
00127$:
	ld	a,-14 (ix)
	or	a,-13 (ix)
	jr	NZ,00104$
;../time.c:194: seconds+= 60*60*24L*29;
	ld	a,-10 (ix)
	add	a,#0x80
	ld	-10 (ix),a
	ld	a,-9 (ix)
	adc	a,#0x3B
	ld	-9 (ix),a
	ld	a,-8 (ix)
	adc	a,#0x26
	ld	-8 (ix),a
	ld	a,-7 (ix)
	adc	a,#0x00
	ld	-7 (ix),a
	jr	00113$
00104$:
;../time.c:196: seconds+= 60*60*24L*monthDays[i];
	ld	a,#<_monthDays
	add	a,-6 (ix)
	ld	e,a
	ld	a,#>_monthDays
	adc	a,-5 (ix)
	ld	d,a
	ld	a,(de)
	ld	e,a
	rla	
	sbc	a,a
	ld	d,a
	ld	c,a
	ld	b,a
	push	bc
	push	de
	ld	hl,#0x0001
	push	hl
	ld	hl,#0x15180
	push	hl
	call	__mullong_rrx_s
	pop	af
	pop	af
	pop	af
	pop	af
	ld	b,h
	ld	c,l
	ld	a,-10 (ix)
	add	a,c
	ld	-10 (ix),a
	ld	a,-9 (ix)
	adc	a,b
	ld	-9 (ix),a
	ld	a,-8 (ix)
	adc	a,e
	ld	-8 (ix),a
	ld	a,-7 (ix)
	adc	a,d
	ld	-7 (ix),a
00113$:
;../time.c:192: for (i=0; i<month; i++) {
	inc	-6 (ix)
	jr	NZ,00128$
	inc	-5 (ix)
00128$:
	jp	00111$
00114$:
;../time.c:200: seconds+= (timeptr->tm_mday-1)*60*60*24L;
	ld	a,4 (ix)
	ld	-14 (ix),a
	ld	a,5 (ix)
	ld	-13 (ix),a
	ld	a,-14 (ix)
	add	a,#0x03
	ld	e,a
	ld	a,-13 (ix)
	adc	a,#0x00
	ld	d,a
	ld	a,(de)
	ld	e,a
	ld	d,#0x00
	dec	de
	ld	a,d
	rla	
	sbc	a,a
	ld	c,a
	ld	b,a
	push	bc
	push	de
	ld	hl,#0x0001
	push	hl
	ld	hl,#0x15180
	push	hl
	call	__mullong_rrx_s
	pop	af
	pop	af
	pop	af
	pop	af
	ld	b,h
	ld	c,l
	ld	a,-10 (ix)
	add	a,c
	ld	-10 (ix),a
	ld	a,-9 (ix)
	adc	a,b
	ld	-9 (ix),a
	ld	a,-8 (ix)
	adc	a,e
	ld	-8 (ix),a
	ld	a,-7 (ix)
	adc	a,d
	ld	-7 (ix),a
;../time.c:201: seconds+= timeptr->tm_hour*60*60L;
	ld	c,-14 (ix)
	ld	b,-13 (ix)
	inc	bc
	inc	bc
	ld	a,(bc)
	ld	c,a
	ld	b,#0x00
	ld	hl,#0x0000
	push	hl
	push	bc
	ld	hl,#0x0000
	push	hl
	ld	hl,#0x0E10
	push	hl
	call	__mullong_rrx_s
	pop	af
	pop	af
	pop	af
	pop	af
	ld	b,h
	ld	c,l
	ld	a,-10 (ix)
	add	a,c
	ld	-10 (ix),a
	ld	a,-9 (ix)
	adc	a,b
	ld	-9 (ix),a
	ld	a,-8 (ix)
	adc	a,e
	ld	-8 (ix),a
	ld	a,-7 (ix)
	adc	a,d
	ld	-7 (ix),a
;../time.c:202: seconds+= timeptr->tm_min*60;
	ld	c,-14 (ix)
	ld	b,-13 (ix)
	inc	bc
	ld	a,(bc)
	ld	c,a
	ld	e,c
	ld	d,#0x00
	ld	l,e
	ld	h,d
	add	hl,hl
	add	hl,de
	add	hl,hl
	add	hl,de
	add	hl,hl
	add	hl,de
	add	hl,hl
	add	hl,hl
	ld	c,l
	ld	b,h
	ld	a,b
	rla	
	sbc	a,a
	ld	e,a
	ld	d,a
	ld	a,-10 (ix)
	add	a,c
	ld	-10 (ix),a
	ld	a,-9 (ix)
	adc	a,b
	ld	-9 (ix),a
	ld	a,-8 (ix)
	adc	a,e
	ld	-8 (ix),a
	ld	a,-7 (ix)
	adc	a,d
	ld	-7 (ix),a
;../time.c:203: seconds+= timeptr->tm_sec;
	ld	l,-14 (ix)
	ld	h,-13 (ix)
	ld	c,(hl)
	ld	b,#0x00
	ld	a,b
	rla	
	sbc	a,a
	ld	e,a
	ld	d,a
	ld	a,-10 (ix)
	add	a,c
	ld	-10 (ix),a
	ld	a,-9 (ix)
	adc	a,b
	ld	-9 (ix),a
	ld	a,-8 (ix)
	adc	a,e
	ld	-8 (ix),a
	ld	a,-7 (ix)
	adc	a,d
	ld	-7 (ix),a
;../time.c:204: return seconds;
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	e,-8 (ix)
	ld	d,-7 (ix)
	ld	sp,ix
	pop	ix
ret
	.area _CODE
__str_1:
	.ascii "Jan"
	.db 0x00
__str_2:
	.ascii "Feb"
	.db 0x00
__str_3:
	.ascii "Mar"
	.db 0x00
__str_4:
	.ascii "Apr"
	.db 0x00
__str_5:
	.ascii "May"
	.db 0x00
__str_6:
	.ascii "Jun"
	.db 0x00
__str_7:
	.ascii "Jul"
	.db 0x00
__str_8:
	.ascii "Aug"
	.db 0x00
__str_9:
	.ascii "Sep"
	.db 0x00
__str_10:
	.ascii "Oct"
	.db 0x00
__str_11:
	.ascii "Nov"
	.db 0x00
__str_12:
	.ascii "Dec"
	.db 0x00
__str_13:
	.ascii "Sun"
	.db 0x00
__str_14:
	.ascii "Mon"
	.db 0x00
__str_15:
	.ascii "Tue"
	.db 0x00
__str_16:
	.ascii "Wed"
	.db 0x00
__str_17:
	.ascii "Thu"
	.db 0x00
__str_18:
	.ascii "Fri"
	.db 0x00
__str_19:
	.ascii "Sat"
	.db 0x00
	.area _CABS
