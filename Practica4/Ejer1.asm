		PROCESSOR 16F877
		INCLUDE <P16F877.INC>

		Op	equ	H'30'

		ORG 0 ;Vector de reset
		GOTO INICIO

		ORG 5

LEERA:	MOVF TRISA,0	;Obtencion de Puerto A y condición
		MOVWF Op
		BTFSC Op,0
		GOTO OPCION1	;Todo es 1s
		GOTO OPCION2	;Todo es 0s

OPCION1:MOVLW B'00000000'	;Opcion para apagar todos los leds
		MOVWF TRISB
		GOTO LEERA

OPCION2:MOVLW H'FF'			;Opcion para encender todos los leds	
		MOVWF TRISB
		GOTO LEERA

INICIO: CLRF PORTA 		;Limpia PORTA
		BSF STATUS,RP0 	;Cambia a banco 1
		BCF STATUS,RP1
		MOVLW 06H 		;Define puertos A y E como digitales
		MOVWF ADCON1
		MOVLW H'1' 		;Configura puerto A bit 0 como entrada
		MOVWF TRISA
		MOVLW B'00000000'
		MOVWF TRISB
		BCF STATUS,RP0 	;Cambia al banco 0
		GOTO LEERA
		END


