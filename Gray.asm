#include "p16F628a.inc"    ;incluir librerias relacionadas con el dispositivo
 __CONFIG _FOSC_INTOSCCLK & _WDTE_OFF & _PWRTE_OFF & _MCLRE_OFF & _BOREN_OFF & _LVP_OFF & _CPD_OFF & _CP_OFF    
;configuración del dispositivotodo en OFF y la frecuencia de oscilador
;es la del "reloj del oscilador interno" (INTOSCCLK)     
RES_VECT  CODE    0x0000            ; processor reset vector
    GOTO    START                   ; go to beginning of program
; TODO ADD INTERRUPTS HERE IF USED
MAIN_PROG CODE                      ; let linker place main program
;variables para el contador:
 i equ 0x33
;inicio del programa: 
START
 
MOVLW 0x07 
MOVWF CMCON
BCF STATUS, RP1 ; banco 1
BSF STATUS, RP0 
MOVLW b'00000000' ;Salida puerto b
MOVWF TRISB 
MOVLW b'11111111' ;Entrada Puerto a 
MOVWF TRISA
BCF STATUS, RP0 ; banco 0
 
INICIO
Nop
 MOVF PORTA,0	    
 MOVWF i	    
 RRF i,0	    
 
 XORWF i,0	    
 BCF STATUS,C	    
 MOVWF PORTB	    

 MOVLW d'0'
 MOVWF i
 MOVLW d'0'
 MOVWF PORTB
 GOTO INICIO


	return
 
END 