;El siguiente programa detecta si un numero es mayor,menos o igual a otro
;Base para el ejercicio 2
;Tambien servira para entender la funcion de resta[SUBWF]
;y las condicionales para STATUS con la bandera Z y C 
	PROCESSOR 16f877
	INCLUDE <p16f877.inc>
	
	K equ H'26'
	L equ H'27'
	M equ H'28'
	C1 equ H'29'	;Comprobación de las banderas C
	Z1 equ H'2A'	;y Z en una variable

;Obtenido de Section 29.Instruction Set,microchip.com, pp 40:
;https://ww1.microchip.com/downloads/en/DeviceDoc/31029a.pdf
;Caso 1: K es mayor, C=1: Z=0 
;Caso 2: K es igual, C=1: Z=1
;Caso 3: K es menor, C=0: Z=0

		ORG 0
		GOTO INICIO

		ORG 5
IGUALES:
		MOVLW H'01'
		MOVWF Z1
		GOTO INICIO
MENOR:
		MOVLW H'00'
		MOVWF C1
		GOTO INICIO
MAYOR:
		MOVLW H'01'
		MOVWF C1
		GOTO INICIO
INICIO:
		
		MOVF L,0		;Copiar L en W
		SUBWF K,0		;Resta K a W
		MOVWF M
		BTFSC STATUS,Z	;Hace skip si K y L son diferentes
		GOTO IGUALES	
		BTFSS STATUS,C	;Hace skip si C es igual a 1, es decir si K es mayor
		GOTO MENOR
		GOTO MAYOR
		END
