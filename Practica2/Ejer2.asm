	PROCESSOR 16f877
	INCLUDE <p16f877.inc>

	K 	equ H'40'		;Variable para guardar el numero menor
	
		ORG 0
		GOTO INICIO

		ORG 5
IGUALES:				;Si numero es igual no hacemos nada
		INCF FSR		;Recorremos el valor de FSR
		GOTO LOOP
MENOR:					;Si nuestro numero es menor no hacemos nada
		INCF FSR,1
		GOTO LOOP
MAYOR:					;Si es mayor al comparado, lo cambiamos por este
		MOVF INDF,0
		MOVWF K
		INCF FSR,1
		GOTO LOOP

INICIO:
		BCF STATUS,RP1	;RP1 valor 0
		BCF STATUS,RP0	;RP0 valor 1 - Seleccionamos Banco 1
		MOVLW 0x20		;Asignamos un 20 a W
		MOVWF FSR		;Mover el valor de W a FSR
		GOTO LOOP

LOOP:	BTFSC FSR,6		;Si bit 7 de FST es 0 skip (64 en binario - 1000000)
		GOTO $
		MOVF INDF,0		;Copia el contenido de INDF a W
		SUBWF K,0		;Restar K a W
		BTFSC STATUS,Z	;Hace skip si son Diferentes
		GOTO IGUALES
		BTFSS STATUS,C	;Hace skip si K es mayor
		GOTO MENOR
		GOTO MAYOR
		END
