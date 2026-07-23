PROCESSOR 16F877
		INCLUDE <P16F877.INC>

		valor1 equ H'21'
		valor2 equ H'22'
		valor3 equ H'23'
		cte1 equ 20H
		cte2 equ 50H
		cte3 equ 60H

		Op		equ	H'30'
		Bandera equ H'31'
		cte4 equ 01H

		ORG 0 ;Vector de reset
		GOTO INICIO

		ORG 5

retardo MOVLW cte1
		MOVWF valor1
tres	MOVLW cte2
		MOVWF valor2
dos		MOVLW cte3
		MOVWF valor3
uno		DECFSZ valor3
		GOTO uno
		DECFSZ valor2
		GOTO dos
		DECFSZ valor1
		GOTO tres
		RETURN

LEERA:	
		MOVF TRISA,0	;Leer puerto A y evaluar
		MOVWF Op
		BTFSC Op,2
		GOTO LEER3
		BTFSS Op,1
		GOTO LEER2
		BTFSC Op,0
		GOTO OPCION2
		GOTO OPCION3

LEER2:	BTFSC Op,0		;Para evaluar en caso de tener 0 en el bit 1
		GOTO OPCION1	;Todo es 0s
		GOTO OPCION0	;Todo es 1s

LEER3:	BTFSC Op,0
		GOTO OPCION5
		GOTO OPCION4

OPCION0:MOVLW B'00000000'	;Opcion para apagar todos los leds
		MOVWF TRISB
		GOTO LEERA

OPCION1:MOVLW H'FF'		;Opcion para encender todos los leds
		MOVWF TRISB
		GOTO LEERA

OPCION2:MOVLW B'00000001'
		BTFSC TRISB,0
		MOVWF TRISB
		CALL retardo
		RLF TRISB,1		;Corrimiento de bit izquierdo
		GOTO LEERA

OPCION3:MOVLW B'10000000'
		BTFSC TRISB,7
		MOVWF TRISB
		CALL retardo
		RRF TRISB,1		;Corrimiento a la derecha
		GOTO LEERA

OPCION4:				;Corrimiento derecha e izquierda
		MOVLW H'80'		;10000000 en hexadecimal
		BTFSC TRISB,7
		MOVWF TRISB
		CALL retardo
		BTFSC Bandera,0
		RRF TRISB,1
		BTFSS Bandera,0
		RLF TRISB,1
		MOVLW H'00'
		BTFSC TRISB,0
		MOVWF Bandera
		GOTO LEERA

OPCION5:
		MOVLW H'FF'		;Opcion para encender todos los leds
		MOVWF TRISB
		CALL retardo
		MOVLW B'00000000'	;Opcion para apagar todos los leds
		MOVWF TRISB
        CALL retardo
		MOVLW H'FF'		;Opcion para encender todos los leds
		MOVWF TRISB
		GOTO LEERA
		

INICIO: CLRF PORTA 		;Limpia PORTA
		BSF STATUS,RP0 	;Cambia a banco 1
		BCF STATUS,RP1
		MOVLW 06H 		;Define puertos A y E como digitales
		MOVWF ADCON1
		MOVLW H'7' 		;Configura puerto A bit 0 como entrada
		MOVWF TRISA
		MOVLW B'00000000'
		MOVWF TRISB
		BCF STATUS,RP0 	;Cambia al banco 0
		MOVLW cte4
		MOVWF Bandera
		GOTO LEERA
		END


