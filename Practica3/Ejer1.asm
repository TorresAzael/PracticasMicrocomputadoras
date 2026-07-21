;Este programa Enciende el primer bit del puerto B con un retardo
	PROCESSOR 16f877
	INCLUDE <p16f877.inc>

	valor1 equ H'21'	;Se asigna espacio en memoria para las constantes
	valor2 equ H'22'
	valor3 equ H'23'
	cte1 equ 20H		;Se crean las constantes
	cte2 equ 50H
	cte3 equ 60H

		ORG 0
		GOTO INICIO

		ORG 5
INICIO:	BSF STATUS,RP0	;Entramos al banco 1
		BCF STATUS,RP1
		MOVLW H'0'		;Configuramos el primer bit(0) como salida
		MOVWF TRISB		;Volvemos al puerto salidas
		BCF STATUS,RP0	;Volvemos al banco 0
		CLRF PORTB

LOOP2: 	BSF PORTB,0		;Encendemos el bit 0
		CALL retardo
		BCF PORTB,0		;Apagamos el bit 0
		CALL retardo
		GOTO LOOP2

retardo:MOVLW cte1		;Movemos las constantes a sus valores
		MOVWF valor1
tres:	MOVLW cte2
		MOVWF valor2
dos:	MOVLW cte3
		MOVWF valor3
uno:	DECFSZ valor3	;Decendemos cada uno de los valores para simular un retardo
		GOTO uno
		DECFSZ valor2
		GOTO dos
		DECFSZ valor1
		GOTO tres
		RETURN
		END
