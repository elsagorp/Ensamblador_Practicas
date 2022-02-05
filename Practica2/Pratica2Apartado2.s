.data
tex:  .string "hola me llamo elsa."	    # Cadena de caracteres 
punt:  .string  "."

.text
begin:
la a0,tex # Cargamos la direccion de str
mv a1,a0	
li a7,4  # Mostramos por pantalla el texto normal
ecall

la a4,punt  # Cargamos la direccion de punto
lb a4,0(a4)  # Lo pasamos a byte para ASCII


li a0,10		# Cargamos el valor 10
li a7,11 		# Imprimimos el salto de linea (en codigo ASCII 10 es igual a \n)
ecall


loop:

add a6,a2,a1 # a6 es la nueva direccion resultado de la suma de a2 y a1
lb a3,0(a6)   # Cargamos en a3 el byte de memoria con direccion a1

bge a4,a3,space # Salta directamente al caso en el que el caracter no sea una letra

#letter
addi a0,a3,-32  # En codigo ASCII la letra mminuscula esta a 32 bit= 4 bytes de la mayuscula

li a7,11
ecall

addi a2,a2,1 # posicion = posicion + 1 -> avanza una posicion del texto
j loop  # Despues de una letra hay otro caracter mas por eso siempre se realiza el salto para volver a empezar el bucle

space:
mv a0,a3 # Se imprime el caracter tal cual
li a7,11
ecall

addi a2,a2,1 # posicion = posicion + 1 -> avanza una posicion del texto
bne a0,a4 loop # Solo se volvera a el principio del bucle loop si el caracter no es '.'


end:
li a7,10
ecall