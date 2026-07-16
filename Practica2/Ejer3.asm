	PROCESSOR 16f877
	INCLUDE <p16f877.inc>

	;Esta zona tiene que tener direcciones mayores de las asignadas para el arreglo a ordenar				;
	TEMP	equ H'30'	;Variable Temporar para almacenar R1 actual
	TAM		equ H'31'	;Tamaño del arreglo
	I		equ H'32'
	J		equ H'33'
		ORG 0
		GOTO INICIO

		ORG 5
LOOPDOS:				
		MOVF TAM,0
		MOVWF J
		DECFSZ I,1
		GOTO LOOPUNO
		GOTO $

LOOPUNO:				;Loop Interno
		GOTO EVALUAR

EVALUAR:
		MOVF INDF,0		;Seleccionamos el contenido de INDF
		MOVWF TEMP		;Lo mandamos a TEMP
		INCF FSR		;En caso de no entrar al "CAMBIO", ya recorremos el arreglo
		MOVF INDF,0
		SUBWF TEMP,0	;Se pierde W ¡cuidado!
		BTFSC STATUS,C	
		GOTO CAMBIO
		

CAMBIO:
		MOVF INDF, 0	;Tomo el menos y guardo en W
		DECF FSR		;Regreso
		MOVWF INDF		;Convierto al mayor en menor
		INCF FSR		;Voy al j+1
		MOVF TEMP,0		;Paso Temp a W
		MOVWF INDF		;Paso W a "INDF+1"
		DECFSZ J,1
		GOTO LOOPUNO
		GOTO LOOPDOS
INICIO:
		BCF STATUS,RP1	;RP1 valor 0
		BCF STATUS,RP0	;RP0 valor 0 - Seleccionamos Banco 0
		MOVLW 0x20		;Asignamos un 20 a W
		MOVWF FSR		;Mover el valor de W a FSR
		MOVLW 0X25		;Aisgnamos el limite de la lectura
		MOVWF TAM
        MOVF FSR,0
		SUBWF TAM,1		;Obtenemos el tamaño del arreglo
		MOVF TAM,0
		MOVWF I
		MOVWF J
		GOTO LOOPUNO
		END
