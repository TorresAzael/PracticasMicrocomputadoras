	PROCESSOR 16f877
	INCLUDE	<p16f877.inc>

	K	equ	H'26'
	L	equ	H'27'
	M	equ	H'28'

		ORG 0
		GOTO INICIO

		ORG 5
INICIO:	MOVF K,W	;Mueve lo que hay en K a W
		ADDWF L,0	;Suma W y "L", y guardalo en W
		MOVWF M		;Mueve W a "M"
		GOTO INICIO
		END	
