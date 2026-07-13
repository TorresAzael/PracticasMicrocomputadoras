	PROCESSOR 16f877
	INCLUDE	<p16f877.inc>

	J	equ	H'2A'	;Definición de variables
	K	equ	H'2B'
	C1	equ H'2C'
	R1	equ	H'2D'

		ORG 0
		GOTO INICIO

		ORG 5
INICIO:	
		BCF C1,0
		MOVF J,W	;Mueve J a W
		ADDWF K,0	;Suma W y "K",guarda en W
		MOVWF R1	;Mueve W a "R1"
		BTFSS R1,7	;Verifica si bit 8 es '1'
		BSF	C1,0	;Actualizamos C1
		GOTO INICIO
		END	
