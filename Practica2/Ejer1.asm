;El siguiente programa asigna el valor de 5F
;a cada localidad de memoria empezando en la 
;dirección 0x20H y terminando en 3F ya que el
;siguiente valor (40) tiene un '1' en el bit 7 
	PROCESSOR 16f877
	INCLUDE <p16f877.inc>

		ORG 0
		GOTO INICIO

		ORG 5
INICIO:
		BCF STATUS,RP1	;RP1 valor 0
		BCF STATUS,RP0	;RP0 valor 1 - Seleccionamos Banco 0
		MOVLW 0X20		;Asignamos un 20 a W
		MOVWF FSR		;Mover el valor de W a FSR

LOOP:	MOVLW 0X5F		;Cargamos un 5F en W
		MOVWF INDF		;Movemos el valor de W a INDF 
		INCF FSR		;Recorremos el valor de FSR
		BTFSS FSR,6		;Si bit 7 de FST es 1 skip LOOP (64 en binario - 1000000)
		GOTO LOOP
		GOTO $
		END
