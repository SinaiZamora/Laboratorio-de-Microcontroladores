;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (Linux)
;--------------------------------------------------------
; PIC port for the 14-bit core
;--------------------------------------------------------
;	.file	"tombola.c"
	list	p=12f675
	radix dec
	include "p12f675.inc"
;--------------------------------------------------------
; config word(s)
;--------------------------------------------------------
	__config 0x3f97
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
	extern	__modsint
	extern	_TRISIO
	extern	_GPIO
	extern	_GPIObits
	extern	__sdcc_gsinit_startup
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
	global	_main
	global	_delay

	global PSAVE
	global SSAVE
	global WSAVE
	global STK12
	global STK11
	global STK10
	global STK09
	global STK08
	global STK07
	global STK06
	global STK05
	global STK04
	global STK03
	global STK02
	global STK01
	global STK00

sharebank udata_ovr 0x0020
PSAVE	res 1
SSAVE	res 1
WSAVE	res 1
STK12	res 1
STK11	res 1
STK10	res 1
STK09	res 1
STK08	res 1
STK07	res 1
STK06	res 1
STK05	res 1
STK04	res 1
STK03	res 1
STK02	res 1
STK01	res 1
STK00	res 1

;--------------------------------------------------------
; global definitions
;--------------------------------------------------------
;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
UDL_tombola_0	udata
r0x1005	res	1
r0x1006	res	1
r0x1007	res	1
r0x1008	res	1
r0x1009	res	1
r0x100A	res	1
r0x100B	res	1
r0x100C	res	1
r0x100D	res	1
r0x100E	res	1
r0x100F	res	1
r0x1010	res	1
r0x1001	res	1
r0x1000	res	1
r0x1002	res	1
r0x1003	res	1
r0x1004	res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------
;--------------------------------------------------------
; initialized absolute data
;--------------------------------------------------------
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
;	udata_ovr
;--------------------------------------------------------
; reset vector 
;--------------------------------------------------------
STARTUP	code 0x0000
	nop
	pagesel __sdcc_gsinit_startup
	goto	__sdcc_gsinit_startup
;--------------------------------------------------------
; code
;--------------------------------------------------------
code_tombola	code
;***
;  pBlock Stats: dbName = M
;***
;has an exit
;functions called:
;   _delay
;   __modsint
;   _delay
;   _delay
;   _delay
;   _delay
;   _delay
;   _delay
;   _delay
;   _delay
;   _delay
;   _delay
;   _delay
;   __modsint
;   _delay
;   _delay
;   _delay
;   _delay
;   _delay
;   _delay
;   _delay
;   _delay
;   _delay
;   _delay
;16 compiler assigned registers:
;   r0x1005
;   r0x1006
;   r0x1007
;   r0x1008
;   r0x1009
;   STK00
;   r0x100A
;   r0x100B
;   r0x100C
;   r0x100D
;   r0x100E
;   r0x100F
;   r0x1010
;   r0x1011
;   STK02
;   STK01
;; Starting pCode block
S_tombola__main	code
_main:
; 2 exit points
;	.line	11; "tombola.c"	TRISIO = 0x08;
	MOVLW	0x08
	BANKSEL	_TRISIO
	MOVWF	_TRISIO
;	.line	12; "tombola.c"	GPIO = 0x00;
	BANKSEL	_GPIO
	CLRF	_GPIO
;	.line	17; "tombola.c"	unsigned char x, y, z, a, counter=4;
	MOVLW	0x04
	MOVWF	r0x1005
;	.line	19; "tombola.c"	x=0;
	CLRF	r0x1006
;	.line	20; "tombola.c"	y=0;
	CLRF	r0x1007
;	.line	21; "tombola.c"	z=0;
	CLRF	r0x1008
;	.line	22; "tombola.c"	a=1;
	MOVLW	0x01
	MOVWF	r0x1009
;	.line	24; "tombola.c"	delay(time);
	MOVLW	0x0f
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_delay
	CALL	_delay
	PAGESEL	$
_00120_DS_:
;	.line	29; "tombola.c"	GPIO5 = 0;
	BANKSEL	_GPIObits
	BCF	_GPIObits,5
;	.line	31; "tombola.c"	if (GPIO3 == 1){
	CLRF	r0x100A
	BTFSC	_GPIObits,3
	INCF	r0x100A,F
	MOVF	r0x100A,W
	XORLW	0x01
	BTFSS	STATUS,2
	GOTO	_00118_DS_
;	.line	32; "tombola.c"	GPIO5 = 1;
	BSF	_GPIObits,5
;	.line	35; "tombola.c"	for(unsigned long i=0;i<counter;i++)
	CLRF	r0x100A
	CLRF	r0x100B
	CLRF	r0x100C
	CLRF	r0x100D
_00123_DS_:
	MOVF	r0x1005,W
	MOVWF	r0x100E
	CLRF	r0x100F
	CLRF	r0x1010
;;1	CLRF	r0x1011
	MOVLW	0x00
	SUBWF	r0x100D,W
	BTFSS	STATUS,2
	GOTO	_00148_DS_
	MOVF	r0x1010,W
	SUBWF	r0x100C,W
	BTFSS	STATUS,2
	GOTO	_00148_DS_
	MOVF	r0x100F,W
	SUBWF	r0x100B,W
	BTFSS	STATUS,2
	GOTO	_00148_DS_
	MOVF	r0x100E,W
	SUBWF	r0x100A,W
_00148_DS_:
	BTFSC	STATUS,0
	GOTO	_00105_DS_
;;genSkipc:3307: created from rifx:0x7ffddc380880
;	.line	37; "tombola.c"	unsigned char t = x ^ (x << 4);
	MOVF	r0x1006,W
	MOVWF	r0x100E
	SWAPF	r0x100E,W
	ANDLW	0xf0
	MOVWF	r0x100F
	MOVWF	r0x100E
	XORWF	r0x1006,W
	MOVWF	r0x100F
;	.line	38; "tombola.c"	x=y;
	MOVF	r0x1007,W
	MOVWF	r0x1006
;	.line	39; "tombola.c"	y=z;
	MOVF	r0x1008,W
	MOVWF	r0x1007
;	.line	40; "tombola.c"	z=a;
	MOVF	r0x1009,W
	MOVWF	r0x1008
;	.line	41; "tombola.c"	a = z ^ t ^ ( z >> 1) ^ (t << 1);
	MOVF	r0x100F,W
	XORWF	r0x1009,W
	MOVWF	r0x100E
;;shiftRight_Left2ResultLit:5474: shCount=1, size=1, sign=0, same=0, offr=0
	BCF	STATUS,0
	RRF	r0x1009,W
	MOVWF	r0x1010
	XORWF	r0x100E,F
	MOVF	r0x100F,W
	MOVWF	r0x1010
	BCF	STATUS,0
	RLF	r0x1010,W
	MOVWF	r0x100F
	MOVWF	r0x1010
	XORWF	r0x100E,W
	MOVWF	r0x1009
;	.line	35; "tombola.c"	for(unsigned long i=0;i<counter;i++)
	INCF	r0x100A,F
	BTFSC	STATUS,2
	INCF	r0x100B,F
	BTFSC	STATUS,2
	INCF	r0x100C,F
	BTFSC	STATUS,2
	INCF	r0x100D,F
	GOTO	_00123_DS_
;;100	MOVF	r0x1009,W
_00105_DS_:
;	.line	46; "tombola.c"	random = a % 10;
	CLRF	r0x100B
	MOVLW	0x0a
	MOVWF	STK02
	MOVLW	0x00
	MOVWF	STK01
;;99	MOVF	r0x100A,W
	MOVF	r0x1009,W
	MOVWF	r0x100A
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	__modsint
	CALL	__modsint
	PAGESEL	$
	MOVWF	r0x100B
	MOVF	STK00,W
	MOVWF	r0x100A
;;swapping arguments (AOP_TYPEs 1/2)
;;unsigned compare: left >= lit(0xA=10), size=2
;	.line	48; "tombola.c"	switch (random)
	MOVLW	0x00
	SUBWF	r0x100B,W
	BTFSS	STATUS,2
	GOTO	_00149_DS_
	MOVLW	0x0a
	SUBWF	r0x100A,W
_00149_DS_:
	BTFSC	STATUS,0
	GOTO	_00118_DS_
;;genSkipc:3307: created from rifx:0x7ffddc380880
	MOVLW	HIGH(_00150_DS_)
	MOVWF	PCLATH
	MOVLW	_00150_DS_
	ADDWF	r0x100A,W
	BTFSC	STATUS,0
	INCF	PCLATH,F
	MOVWF	PCL
_00150_DS_:
	GOTO	_00106_DS_
	GOTO	_00107_DS_
	GOTO	_00108_DS_
	GOTO	_00109_DS_
	GOTO	_00110_DS_
	GOTO	_00111_DS_
	GOTO	_00112_DS_
	GOTO	_00113_DS_
	GOTO	_00114_DS_
	GOTO	_00115_DS_
_00106_DS_:
;	.line	51; "tombola.c"	GPIO0 = 0; 
	BANKSEL	_GPIObits
	BCF	_GPIObits,0
;	.line	52; "tombola.c"	GPIO1 = 0;
	BCF	_GPIObits,1
;	.line	53; "tombola.c"	GPIO2 = 0;
	BCF	_GPIObits,2
;	.line	54; "tombola.c"	GPIO4 = 0;
	BCF	_GPIObits,4
;	.line	55; "tombola.c"	delay(time);
	MOVLW	0x0f
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_delay
	CALL	_delay
	PAGESEL	$
;	.line	56; "tombola.c"	break;
	GOTO	_00118_DS_
_00107_DS_:
;	.line	58; "tombola.c"	GPIO0 = 0;
	BANKSEL	_GPIObits
	BCF	_GPIObits,0
;	.line	59; "tombola.c"	GPIO1 = 0;
	BCF	_GPIObits,1
;	.line	60; "tombola.c"	GPIO2 = 0;
	BCF	_GPIObits,2
;	.line	61; "tombola.c"	GPIO4 = 1;
	BSF	_GPIObits,4
;	.line	62; "tombola.c"	delay(time);
	MOVLW	0x0f
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_delay
	CALL	_delay
	PAGESEL	$
;	.line	63; "tombola.c"	break;
	GOTO	_00118_DS_
_00108_DS_:
;	.line	65; "tombola.c"	GPIO0 = 0;
	BANKSEL	_GPIObits
	BCF	_GPIObits,0
;	.line	66; "tombola.c"	GPIO1 = 0;
	BCF	_GPIObits,1
;	.line	67; "tombola.c"	GPIO2 = 1;
	BSF	_GPIObits,2
;	.line	68; "tombola.c"	GPIO4 = 0;
	BCF	_GPIObits,4
;	.line	69; "tombola.c"	delay(time);
	MOVLW	0x0f
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_delay
	CALL	_delay
	PAGESEL	$
;	.line	70; "tombola.c"	break;
	GOTO	_00118_DS_
_00109_DS_:
;	.line	72; "tombola.c"	GPIO0 = 0;
	BANKSEL	_GPIObits
	BCF	_GPIObits,0
;	.line	73; "tombola.c"	GPIO1 = 0;
	BCF	_GPIObits,1
;	.line	74; "tombola.c"	GPIO2 = 1;
	BSF	_GPIObits,2
;	.line	75; "tombola.c"	GPIO4 = 1;
	BSF	_GPIObits,4
;	.line	76; "tombola.c"	delay(time);
	MOVLW	0x0f
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_delay
	CALL	_delay
	PAGESEL	$
;	.line	77; "tombola.c"	break;
	GOTO	_00118_DS_
_00110_DS_:
;	.line	79; "tombola.c"	GPIO0 = 0;
	BANKSEL	_GPIObits
	BCF	_GPIObits,0
;	.line	80; "tombola.c"	GPIO1 = 1;
	BSF	_GPIObits,1
;	.line	81; "tombola.c"	GPIO2 = 0;
	BCF	_GPIObits,2
;	.line	82; "tombola.c"	GPIO4 = 0;
	BCF	_GPIObits,4
;	.line	83; "tombola.c"	delay(time);
	MOVLW	0x0f
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_delay
	CALL	_delay
	PAGESEL	$
;	.line	84; "tombola.c"	break;
	GOTO	_00118_DS_
_00111_DS_:
;	.line	86; "tombola.c"	GPIO0 = 0;
	BANKSEL	_GPIObits
	BCF	_GPIObits,0
;	.line	87; "tombola.c"	GPIO1 = 1;
	BSF	_GPIObits,1
;	.line	88; "tombola.c"	GPIO2 = 0;
	BCF	_GPIObits,2
;	.line	89; "tombola.c"	GPIO4 = 1;
	BSF	_GPIObits,4
;	.line	90; "tombola.c"	delay(time);
	MOVLW	0x0f
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_delay
	CALL	_delay
	PAGESEL	$
;	.line	91; "tombola.c"	break;
	GOTO	_00118_DS_
_00112_DS_:
;	.line	93; "tombola.c"	GPIO0 = 0;
	BANKSEL	_GPIObits
	BCF	_GPIObits,0
;	.line	94; "tombola.c"	GPIO1 = 1;
	BSF	_GPIObits,1
;	.line	95; "tombola.c"	GPIO2 = 1;
	BSF	_GPIObits,2
;	.line	96; "tombola.c"	GPIO4 = 0;
	BCF	_GPIObits,4
;	.line	97; "tombola.c"	delay(time);
	MOVLW	0x0f
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_delay
	CALL	_delay
	PAGESEL	$
;	.line	98; "tombola.c"	break;
	GOTO	_00118_DS_
_00113_DS_:
;	.line	100; "tombola.c"	GPIO0 = 0;
	BANKSEL	_GPIObits
	BCF	_GPIObits,0
;	.line	101; "tombola.c"	GPIO1 = 1;
	BSF	_GPIObits,1
;	.line	102; "tombola.c"	GPIO2 = 1;
	BSF	_GPIObits,2
;	.line	103; "tombola.c"	GPIO4 = 1;
	BSF	_GPIObits,4
;	.line	104; "tombola.c"	delay(time);
	MOVLW	0x0f
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_delay
	CALL	_delay
	PAGESEL	$
;	.line	105; "tombola.c"	break;
	GOTO	_00118_DS_
_00114_DS_:
;	.line	107; "tombola.c"	GPIO0 = 1;
	BANKSEL	_GPIObits
	BSF	_GPIObits,0
;	.line	108; "tombola.c"	GPIO1 = 0;
	BCF	_GPIObits,1
;	.line	109; "tombola.c"	GPIO2 = 0;
	BCF	_GPIObits,2
;	.line	110; "tombola.c"	GPIO4 = 0;
	BCF	_GPIObits,4
;	.line	111; "tombola.c"	delay(time);
	MOVLW	0x0f
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_delay
	CALL	_delay
	PAGESEL	$
;	.line	112; "tombola.c"	break;
	GOTO	_00118_DS_
_00115_DS_:
;	.line	114; "tombola.c"	GPIO0 = 1;
	BANKSEL	_GPIObits
	BSF	_GPIObits,0
;	.line	115; "tombola.c"	GPIO1 = 0;
	BCF	_GPIObits,1
;	.line	116; "tombola.c"	GPIO2 = 0;
	BCF	_GPIObits,2
;	.line	117; "tombola.c"	GPIO4 = 1;
	BSF	_GPIObits,4
;	.line	118; "tombola.c"	delay(time);
	MOVLW	0x0f
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_delay
	CALL	_delay
	PAGESEL	$
_00118_DS_:
;	.line	125; "tombola.c"	counter += 1;
	MOVF	r0x1005,W
	MOVWF	r0x100A
	INCF	r0x100A,W
	MOVWF	r0x1005
	GOTO	_00120_DS_
;	.line	130; "tombola.c"	}
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;6 compiler assigned registers:
;   r0x1000
;   STK00
;   r0x1001
;   r0x1002
;   r0x1003
;   r0x1004
;; Starting pCode block
S_tombola__delay	code
_delay:
; 2 exit points
;	.line	132; "tombola.c"	void delay(unsigned int tiempo)
	MOVWF	r0x1000
	MOVF	STK00,W
	MOVWF	r0x1001
;	.line	136; "tombola.c"	for (i=0; i < tiempo; i++)
	CLRF	r0x1002
	CLRF	r0x1003
_00161_DS_:
	MOVF	r0x1000,W
	SUBWF	r0x1003,W
	BTFSS	STATUS,2
	GOTO	_00183_DS_
	MOVF	r0x1001,W
	SUBWF	r0x1002,W
_00183_DS_:
	BTFSC	STATUS,0
	GOTO	_00163_DS_
;;genSkipc:3307: created from rifx:0x7ffddc380880
;;unsigned compare: left < lit(0x4FB=1275), size=2
;	.line	137; "tombola.c"	for (j = 0; i < 1275; j++);
	MOVLW	0x04
	SUBWF	r0x1003,W
	BTFSS	STATUS,2
	GOTO	_00184_DS_
	MOVLW	0xfb
	SUBWF	r0x1002,W
_00184_DS_:
	CLRF	r0x1004
	BTFSS	STATUS,0
	BSF	r0x1004,0
_00158_DS_:
	MOVF	r0x1004,W
	BTFSS	STATUS,2
	GOTO	_00158_DS_
;	.line	136; "tombola.c"	for (i=0; i < tiempo; i++)
	INCF	r0x1002,F
	BTFSC	STATUS,2
	INCF	r0x1003,F
	GOTO	_00161_DS_
_00163_DS_:
;	.line	139; "tombola.c"	}
	RETURN	
; exit point of _delay


;	code size estimation:
;	  247+   37 =   284 instructions (  642 byte)

	end
