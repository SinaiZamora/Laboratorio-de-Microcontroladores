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
	__config 0x3fd7
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
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
;   _delay
;   _delay
;   _delay
;   _delay
;   _delay
;   _delay
;   _delay
;   _delay
;5 compiler assigned registers:
;   r0x1005
;   r0x1006
;   r0x1007
;   r0x1008
;   STK00
;; Starting pCode block
S_tombola__main	code
_main:
; 2 exit points
;	.line	9; "tombola.c"	TRISIO = 0b00001000;
	MOVLW	0x08
	BANKSEL	_TRISIO
	MOVWF	_TRISIO
;	.line	10; "tombola.c"	GPIO = 0x00;
	BANKSEL	_GPIO
	CLRF	_GPIO
;	.line	12; "tombola.c"	unsigned int counter = 0;
	CLRF	r0x1005
	CLRF	r0x1006
_00124_DS_:
;	.line	16; "tombola.c"	GPIO5 = 0;
	BANKSEL	_GPIObits
	BCF	_GPIObits,5
;;swapping arguments (AOP_TYPEs 1/2)
;;unsigned compare: left >= lit(0xA=10), size=2
;	.line	17; "tombola.c"	if (counter <= 9){
	MOVLW	0x00
	SUBWF	r0x1006,W
	BTFSS	STATUS,2
	GOTO	_00148_DS_
	MOVLW	0x0a
	SUBWF	r0x1005,W
_00148_DS_:
	BTFSC	STATUS,0
	GOTO	_00121_DS_
;;genSkipc:3307: created from rifx:0x7fffe769a6e0
;	.line	18; "tombola.c"	if (GPIO3 == 1){
	CLRF	r0x1007
	BANKSEL	_GPIObits
	BTFSC	_GPIObits,3
	INCF	r0x1007,F
	MOVF	r0x1007,W
	XORLW	0x01
	BTFSS	STATUS,2
	GOTO	_00117_DS_
;	.line	19; "tombola.c"	GPIO5 = 1;
	BSF	_GPIObits,5
;	.line	20; "tombola.c"	random = counter;
	MOVF	r0x1005,W
	MOVWF	r0x1007
	MOVF	r0x1006,W
;;1	MOVWF	r0x1008
;;swapping arguments (AOP_TYPEs 1/2)
;;unsigned compare: left >= lit(0xA=10), size=2
;	.line	22; "tombola.c"	switch (random)
	MOVLW	0x00
	SUBWF	r0x1006,W
	BTFSS	STATUS,2
	GOTO	_00149_DS_
	MOVLW	0x0a
	SUBWF	r0x1005,W
_00149_DS_:
	BTFSC	STATUS,0
	GOTO	_00117_DS_
;;genSkipc:3307: created from rifx:0x7fffe769a6e0
	MOVLW	HIGH(_00150_DS_)
	MOVWF	PCLATH
	MOVLW	_00150_DS_
	ADDWF	r0x1007,W
	BTFSC	STATUS,0
	INCF	PCLATH,F
	MOVWF	PCL
_00150_DS_:
	GOTO	_00105_DS_
	GOTO	_00106_DS_
	GOTO	_00107_DS_
	GOTO	_00108_DS_
	GOTO	_00109_DS_
	GOTO	_00110_DS_
	GOTO	_00111_DS_
	GOTO	_00112_DS_
	GOTO	_00113_DS_
	GOTO	_00114_DS_
_00105_DS_:
;	.line	25; "tombola.c"	GPIO0 = 0; 
	BANKSEL	_GPIObits
	BCF	_GPIObits,0
;	.line	26; "tombola.c"	GPIO1 = 0;
	BCF	_GPIObits,1
;	.line	27; "tombola.c"	GPIO2 = 0;
	BCF	_GPIObits,2
;	.line	28; "tombola.c"	GPIO4 = 0;
	BCF	_GPIObits,4
;	.line	29; "tombola.c"	delay(time);
	MOVLW	0x64
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_delay
	CALL	_delay
	PAGESEL	$
;	.line	30; "tombola.c"	break;
	GOTO	_00117_DS_
_00106_DS_:
;	.line	32; "tombola.c"	GPIO0 = 0;
	BANKSEL	_GPIObits
	BCF	_GPIObits,0
;	.line	33; "tombola.c"	GPIO1 = 0;
	BCF	_GPIObits,1
;	.line	34; "tombola.c"	GPIO2 = 0;
	BCF	_GPIObits,2
;	.line	35; "tombola.c"	GPIO4 = 1;
	BSF	_GPIObits,4
;	.line	36; "tombola.c"	delay(time);
	MOVLW	0x64
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_delay
	CALL	_delay
	PAGESEL	$
;	.line	37; "tombola.c"	break;
	GOTO	_00117_DS_
_00107_DS_:
;	.line	39; "tombola.c"	GPIO0 = 0;
	BANKSEL	_GPIObits
	BCF	_GPIObits,0
;	.line	40; "tombola.c"	GPIO1 = 0;
	BCF	_GPIObits,1
;	.line	41; "tombola.c"	GPIO2 = 1;
	BSF	_GPIObits,2
;	.line	42; "tombola.c"	GPIO4 = 0;
	BCF	_GPIObits,4
;	.line	43; "tombola.c"	delay(time);
	MOVLW	0x64
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_delay
	CALL	_delay
	PAGESEL	$
;	.line	44; "tombola.c"	break;
	GOTO	_00117_DS_
_00108_DS_:
;	.line	46; "tombola.c"	GPIO0 = 0;
	BANKSEL	_GPIObits
	BCF	_GPIObits,0
;	.line	47; "tombola.c"	GPIO1 = 0;
	BCF	_GPIObits,1
;	.line	48; "tombola.c"	GPIO2 = 1;
	BSF	_GPIObits,2
;	.line	49; "tombola.c"	GPIO4 = 1;
	BSF	_GPIObits,4
;	.line	50; "tombola.c"	delay(time);
	MOVLW	0x64
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_delay
	CALL	_delay
	PAGESEL	$
;	.line	51; "tombola.c"	break;
	GOTO	_00117_DS_
_00109_DS_:
;	.line	53; "tombola.c"	GPIO0 = 0;
	BANKSEL	_GPIObits
	BCF	_GPIObits,0
;	.line	54; "tombola.c"	GPIO1 = 1;
	BSF	_GPIObits,1
;	.line	55; "tombola.c"	GPIO2 = 0;
	BCF	_GPIObits,2
;	.line	56; "tombola.c"	GPIO4 = 0;
	BCF	_GPIObits,4
;	.line	57; "tombola.c"	delay(time);
	MOVLW	0x64
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_delay
	CALL	_delay
	PAGESEL	$
;	.line	58; "tombola.c"	break;
	GOTO	_00117_DS_
_00110_DS_:
;	.line	60; "tombola.c"	GPIO0 = 0;
	BANKSEL	_GPIObits
	BCF	_GPIObits,0
;	.line	61; "tombola.c"	GPIO1 = 1;
	BSF	_GPIObits,1
;	.line	62; "tombola.c"	GPIO2 = 0;
	BCF	_GPIObits,2
;	.line	63; "tombola.c"	GPIO4 = 1;
	BSF	_GPIObits,4
;	.line	64; "tombola.c"	delay(time);
	MOVLW	0x64
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_delay
	CALL	_delay
	PAGESEL	$
;	.line	65; "tombola.c"	break;
	GOTO	_00117_DS_
_00111_DS_:
;	.line	67; "tombola.c"	GPIO0 = 0;
	BANKSEL	_GPIObits
	BCF	_GPIObits,0
;	.line	68; "tombola.c"	GPIO1 = 1;
	BSF	_GPIObits,1
;	.line	69; "tombola.c"	GPIO2 = 1;
	BSF	_GPIObits,2
;	.line	70; "tombola.c"	GPIO4 = 0;
	BCF	_GPIObits,4
;	.line	71; "tombola.c"	delay(time);
	MOVLW	0x64
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_delay
	CALL	_delay
	PAGESEL	$
;	.line	72; "tombola.c"	break;
	GOTO	_00117_DS_
_00112_DS_:
;	.line	74; "tombola.c"	GPIO0 = 0;
	BANKSEL	_GPIObits
	BCF	_GPIObits,0
;	.line	75; "tombola.c"	GPIO1 = 1;
	BSF	_GPIObits,1
;	.line	76; "tombola.c"	GPIO2 = 1;
	BSF	_GPIObits,2
;	.line	77; "tombola.c"	GPIO4 = 1;
	BSF	_GPIObits,4
;	.line	78; "tombola.c"	delay(time);
	MOVLW	0x64
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_delay
	CALL	_delay
	PAGESEL	$
;	.line	79; "tombola.c"	break;
	GOTO	_00117_DS_
_00113_DS_:
;	.line	81; "tombola.c"	GPIO0 = 1;
	BANKSEL	_GPIObits
	BSF	_GPIObits,0
;	.line	82; "tombola.c"	GPIO1 = 0;
	BCF	_GPIObits,1
;	.line	83; "tombola.c"	GPIO2 = 0;
	BCF	_GPIObits,2
;	.line	84; "tombola.c"	GPIO4 = 0;
	BCF	_GPIObits,4
;	.line	85; "tombola.c"	delay(time);
	MOVLW	0x64
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_delay
	CALL	_delay
	PAGESEL	$
;	.line	86; "tombola.c"	break;
	GOTO	_00117_DS_
_00114_DS_:
;	.line	88; "tombola.c"	GPIO0 = 1;
	BANKSEL	_GPIObits
	BSF	_GPIObits,0
;	.line	89; "tombola.c"	GPIO1 = 0;
	BCF	_GPIObits,1
;	.line	90; "tombola.c"	GPIO2 = 0;
	BCF	_GPIObits,2
;	.line	91; "tombola.c"	GPIO4 = 1;
	BSF	_GPIObits,4
;	.line	92; "tombola.c"	delay(time);
	MOVLW	0x64
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_delay
	CALL	_delay
	PAGESEL	$
_00117_DS_:
;	.line	98; "tombola.c"	counter += 1;
	INCF	r0x1005,F
	BTFSC	STATUS,2
	INCF	r0x1006,F
	GOTO	_00124_DS_
;;swapping arguments (AOP_TYPEs 1/2)
;;unsigned compare: left >= lit(0xA=10), size=2
_00121_DS_:
;	.line	101; "tombola.c"	else if (counter > 9){
	MOVLW	0x00
	SUBWF	r0x1006,W
	BTFSS	STATUS,2
	GOTO	_00151_DS_
	MOVLW	0x0a
	SUBWF	r0x1005,W
_00151_DS_:
	BTFSS	STATUS,0
	GOTO	_00124_DS_
;;genSkipc:3307: created from rifx:0x7fffe769a6e0
;	.line	102; "tombola.c"	counter = 0;
	CLRF	r0x1005
	CLRF	r0x1006
	GOTO	_00124_DS_
;	.line	107; "tombola.c"	}
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
;	.line	109; "tombola.c"	void delay(unsigned int tiempo)
	MOVWF	r0x1000
	MOVF	STK00,W
	MOVWF	r0x1001
;	.line	113; "tombola.c"	for (i=0; i < tiempo; i++)
	CLRF	r0x1002
	CLRF	r0x1003
_00162_DS_:
	MOVF	r0x1000,W
	SUBWF	r0x1003,W
	BTFSS	STATUS,2
	GOTO	_00184_DS_
	MOVF	r0x1001,W
	SUBWF	r0x1002,W
_00184_DS_:
	BTFSC	STATUS,0
	GOTO	_00164_DS_
;;genSkipc:3307: created from rifx:0x7fffe769a6e0
;;unsigned compare: left < lit(0x4FB=1275), size=2
;	.line	114; "tombola.c"	for (j = 0; i < 1275; j++);
	MOVLW	0x04
	SUBWF	r0x1003,W
	BTFSS	STATUS,2
	GOTO	_00185_DS_
	MOVLW	0xfb
	SUBWF	r0x1002,W
_00185_DS_:
	CLRF	r0x1004
	BTFSS	STATUS,0
	BSF	r0x1004,0
_00159_DS_:
	MOVF	r0x1004,W
	BTFSS	STATUS,2
	GOTO	_00159_DS_
;	.line	113; "tombola.c"	for (i=0; i < tiempo; i++)
	INCF	r0x1002,F
	BTFSC	STATUS,2
	INCF	r0x1003,F
	GOTO	_00162_DS_
_00164_DS_:
;	.line	116; "tombola.c"	}
	RETURN	
; exit point of _delay


;	code size estimation:
;	  185+   34 =   219 instructions (  506 byte)

	end
