	PROCESSOR 16f877
	INCLUDE <p16f877.inc>
	
	K	equ	H'20'
		ORG 0	
		GOTO INICIO	
LOOP2:				;Loop al 20, 3er bit en '1'
		INCF K,1
		BTFSS K,2	;Limitamos su llegada a 20
		GOTO LOOP2
		GOTO INICIO	;

LOOP1:				;Loop primeros 15 digitos
		INCF K,1	;Incrementa en 1
		BTFSS K,4	;Saltar si llegamos al 16
		GOTO LOOP1
		GOTO LOOP2

INICIO:
		CLRF K		;Reiniciamos el valor 
		GOTO LOOP1		
		END
