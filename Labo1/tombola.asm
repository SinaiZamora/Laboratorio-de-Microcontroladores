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
	extern	__moduint
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
r0x1008	res	1
r0x1009	res	1
r0x100A	res	1
r0x100B	res	1
r0x100D	res	1
r0x100C	res	1
r0x100E	res	1
r0x100F	res	1
r0x1001	res	1
r0x1000	res	1
r0x1002	res	1
r0x1003	res	1
r0x1004	res	1
r0x1005	res	1
r0x1006	res	1
r0x1007	res	1
_main_counter_65537_4	res	2
_main_bolas_65537_4	res	2
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
;   __moduint
;   _delay
;   __moduint
;   _delay
;11 compiler assigned registers:
;   r0x1008
;   r0x1009
;   r0x100A
;   r0x100B
;   STK02
;   STK01
;   STK00
;   r0x100C
;   r0x100D
;   r0x100E
;   r0x100F
;; Starting pCode block
S_tombola__main	code
_main:
; 2 exit points
;	.line	10; "tombola.c"	TRISIO = 0b00101000; //GPIO3 y GPIO5 como entradas
	MOVLW	0x28
	BANKSEL	_TRISIO
	MOVWF	_TRISIO
;	.line	11; "tombola.c"	GPIO = 0b00000000; //todos los GPIOS comienzan en bajo
	BANKSEL	_GPIO
	CLRF	_GPIO
;	.line	20; "tombola.c"	while (1){
	CLRF	r0x1008
	CLRF	r0x1009
	CLRF	r0x100A
	CLRF	r0x100B
_00113_DS_:
;	.line	22; "tombola.c"	counter ++;
	INCF	r0x100A,F
	BTFSC	STATUS,2
	INCF	r0x100B,F
;	.line	23; "tombola.c"	random = counter % 10;
	MOVLW	0x0a
	MOVWF	STK02
	MOVLW	0x00
	MOVWF	STK01
	MOVF	r0x100A,W
	MOVWF	STK00
	MOVF	r0x100B,W
	PAGESEL	__moduint
	CALL	__moduint
	PAGESEL	$
	MOVWF	r0x100C
	MOVF	STK00,W
	MOVWF	r0x100D
;	.line	26; "tombola.c"	if (GPIO3 == 1){
	CLRF	r0x100E
	BANKSEL	_GPIObits
	BTFSC	_GPIObits,3
	INCF	r0x100E,F
	MOVF	r0x100E,W
	XORLW	0x01
	BTFSS	STATUS,2
	GOTO	_00109_DS_
;	.line	28; "tombola.c"	bolas++;
	INCF	r0x1008,F
	BTFSC	STATUS,2
	INCF	r0x1009,F
;	.line	30; "tombola.c"	for (unsigned int num = 0; num < 10; num++){
	CLRF	r0x100E
	CLRF	r0x100F
;;unsigned compare: left < lit(0xA=10), size=2
_00116_DS_:
	MOVLW	0x00
	SUBWF	r0x100F,W
	BTFSS	STATUS,2
	GOTO	_00145_DS_
	MOVLW	0x0a
	SUBWF	r0x100E,W
_00145_DS_:
	BTFSC	STATUS,0
	GOTO	_00109_DS_
;;genSkipc:3307: created from rifx:0x7ffe202025d0
;	.line	32; "tombola.c"	if(random == num){
	MOVF	r0x100E,W
	XORWF	r0x100D,W
	BTFSS	STATUS,2
	GOTO	_00117_DS_
	MOVF	r0x100F,W
	XORWF	r0x100C,W
	BTFSS	STATUS,2
	GOTO	_00117_DS_
;	.line	33; "tombola.c"	GPIO = num;
	MOVF	r0x100E,W
	BANKSEL	_GPIO
	MOVWF	_GPIO
;	.line	34; "tombola.c"	delay(time);}
	MOVLW	0x0a
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_delay
	CALL	_delay
	PAGESEL	$
_00117_DS_:
;	.line	30; "tombola.c"	for (unsigned int num = 0; num < 10; num++){
	INCF	r0x100E,F
	BTFSC	STATUS,2
	INCF	r0x100F,F
	GOTO	_00116_DS_
_00109_DS_:
;	.line	40; "tombola.c"	if (bolas == 16)
	MOVF	r0x1008,W
	XORLW	0x10
	BTFSS	STATUS,2
	GOTO	_00113_DS_
	MOVF	r0x1009,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00113_DS_
;	.line	42; "tombola.c"	GPIO = 9;
	MOVLW	0x09
	BANKSEL	_GPIO
	MOVWF	_GPIO
	GOTO	_00113_DS_
;	.line	47; "tombola.c"	}
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;9 compiler assigned registers:
;   r0x1000
;   STK00
;   r0x1001
;   r0x1002
;   r0x1003
;   r0x1004
;   r0x1005
;   r0x1006
;   r0x1007
;; Starting pCode block
S_tombola__delay	code
_delay:
; 2 exit points
;	.line	49; "tombola.c"	void delay(unsigned int tiempo)
	MOVWF	r0x1000
	MOVF	STK00,W
	MOVWF	r0x1001
;	.line	54; "tombola.c"	for(i=0;i<tiempo;i++)
	CLRF	r0x1002
	CLRF	r0x1003
_00156_DS_:
	MOVF	r0x1000,W
	SUBWF	r0x1003,W
	BTFSS	STATUS,2
	GOTO	_00177_DS_
	MOVF	r0x1001,W
	SUBWF	r0x1002,W
_00177_DS_:
	BTFSC	STATUS,0
	GOTO	_00158_DS_
;;genSkipc:3307: created from rifx:0x7ffe202025d0
;	.line	55; "tombola.c"	for(j=0;j<1275;j++);
	MOVLW	0xfb
	MOVWF	r0x1004
	MOVLW	0x04
	MOVWF	r0x1005
_00154_DS_:
	MOVLW	0xff
	ADDWF	r0x1004,W
	MOVWF	r0x1006
	MOVLW	0xff
	MOVWF	r0x1007
	MOVF	r0x1005,W
	BTFSC	STATUS,0
	INCFSZ	r0x1005,W
	ADDWF	r0x1007,F
	MOVF	r0x1006,W
	MOVWF	r0x1004
	MOVF	r0x1007,W
	MOVWF	r0x1005
	MOVF	r0x1007,W
	IORWF	r0x1006,W
	BTFSS	STATUS,2
	GOTO	_00154_DS_
;	.line	54; "tombola.c"	for(i=0;i<tiempo;i++)
	INCF	r0x1002,F
	BTFSC	STATUS,2
	INCF	r0x1003,F
	GOTO	_00156_DS_
_00158_DS_:
;	.line	56; "tombola.c"	}
	RETURN	
; exit point of _delay


;	code size estimation:
;	  110+    9 =   119 instructions (  256 byte)

	end
