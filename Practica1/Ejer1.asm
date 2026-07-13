	PROCESSOR 16f877
	INCLUDE <p16f877.inc>
 
	K	equ	H'26'	;Variable dirección 26
	L	equ	H'27'	;"" "" 27

		ORG 0
		GOTO INICIO	

		ORG 5
INICIO:	MOVLW H'05' ;Mueve 05Hex a W
		ADDWF K,0	;Suma K y W, almacena en W
		MOVWF L		;Mueve "W" a L 
		GOTO INICIO
		END	
