	PROCESSOR 16f877
	INCLUDE <p16f877.inc>
	
	K	equ	H'20'

		ORG 0	
		GOTO INICIO

		ORG 5
LOOP:
		RLF	K,1		;Recorre el bit y almacena en K
		BTFSS K,7	;Evaluamos el bit ocho (80H)
		GOTO LOOP	;Si llegamos a 80H
		GOTO INICIO
INICIO:
		GOTO LOOP	;Comenzamos el look
		END
