#include "p16F628a.inc"    ;libreria del pic
 __CONFIG _FOSC_INTOSCCLK & _WDTE_OFF & _PWRTE_OFF & _MCLRE_OFF & _BOREN_OFF & _LVP_OFF & _CPD_OFF & _CP_OFF    
   
RES_VECT  CODE    0x0000            ; processor reset vector
    GOTO    START                   ; go to beginning of program
; TODO ADD INTERRUPTS HERE IF USED
MAIN_PROG CODE                      ; let linker place main program
;variables 
 i equ 0x32
 j equ 0x35
 
 
;inicio del programa: 
START
MOVLW 0x07 ;Apagar comparadores
MOVWF CMCON
 
 
BCF STATUS, RP1 ;Cambiar a 1
BSF STATUS, RP0 
MOVLW b'00000000' ;Establecer puerto a como salida excepto RB1
MOVWF TRISA 
BCF STATUS, RP0 ;Regresar a 0

 MOVLW d'7'
 MOVWF j
 MOVLW d'1'
 MOVWF i
  
 LOOP
 ADDWF i,1
 MOVFW i
 
 DECF j
 BTFSC j,0
 GOTO LOOP   
 BTFSC j,1
 GOTO LOOP   
 BTFSC j,2
 GOTO LOOP   
 BTFSC j,3
 GOTO LOOP   
 
 
 

 END