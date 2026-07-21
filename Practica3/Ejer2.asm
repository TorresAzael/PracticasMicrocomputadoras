	PROCESSOR 16f877
	INCLUDE <p16f877.inc>

	valor1 equ H'21'
	valor2 equ H'22'
	valor3 equ H'23'
	cte1 equ 20H
	cte2 equ 50H
	cte3 equ 60H

		ORG 0
		GOTO INICIO

		ORG 5
INICIO:	BSF STATUS,RP0
		BCF STATUS,RP1
		MOVLW B'00000000'	;Para mandar puros 0s a todo el puerto usamos Bits
		MOVWF TRISB
		BCF STATUS,RP0
		CLRF PORTB

LOOP2 	MOVLW B'00000000'
		MOVWF PORTB			;Movemos los bits al puerto B
		CALL retardo
		MOVLW H'FF'			;Alternativa en Hexadecimal
		MOVWF PORTB
		CALL retardo
		GOTO LOOP2

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
		END
