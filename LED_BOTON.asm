#include "p16F628a.inc"    ;incluir librerias relacionadas con el dispositivo
 __CONFIG _FOSC_INTOSCCLK & _WDTE_OFF & _PWRTE_OFF & _MCLRE_OFF & _BOREN_OFF & _LVP_OFF & _CPD_OFF & _CP_OFF    
     
RES_VECT  CODE    0x0000            
    GOTO    START                   
MAIN_PROG CODE                      
;variables 
 i equ 0x33
 j equ 0x34
 k equ 0x35
 
 x equ 0x36
 y equ 0x37
 z equ 0x38


START
MOVLW 0x07 
MOVWF CMCON
 
BCF STATUS, RP1 ; Cambiar al banco 1
BSF STATUS, RP0 
MOVLW b'00000000' 
MOVWF TRISB 
BCF STATUS, RP0 ;Regresar al banco 0
 #define Led PORTB, 0
 #define Btn PORTB, 1
 
 inicio
 BSF Led
 BTFSS Btn
 call tiempouno ;1/2 seg
 BTFSC Btn
 call tiempodos ;1 seg
 BCF Led
 BTFSS Btn
 call tiempouno 
 BTFSC Btn
 call tiempodos
 GOTO inicio
 
 
 
 tiempouno:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    
    movlw d'252'
    movwf i
iloop:
    movlw d'99'
    movwf j 
jloop: 
    nop
    movlw d'5'
	movwf k
kloop:    
    decfsz k,f
	goto kloop
	decfsz j,f
	goto jloop
	decfsz i,f
	goto iloop
    
    return
    
tiempodos:
   nop
   nop
   nop
   nop
   nop
   nop
   nop
   nop
   nop
    movlw d'201'
    movwf x
xloop:
    movlw d'108'
    movwf y 
yloop: 
    movlw d'14'
	movwf z
zloop: 
    decfsz z,f
	goto zloop
	decfsz y,f
	goto yloop
	nop
	nop
	nop
	decfsz x,f
	goto xloop
    
    return
    
	
 END