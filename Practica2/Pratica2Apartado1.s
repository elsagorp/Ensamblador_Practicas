.data
str:    .string "saltos"

.text
begin:
la a0,str # Cargamos la direccion de str
mv a1,a0	
li a7,4  # Mostramos por pantalla el texto normal
ecall

li a0,10		# Cargamos el valor 10
li a7,11 		# Imprimimos el salto de linea (en codigo ASCII 10 es igual a \n)
ecall

# Se resta 32 y no se suma porque la posicion de las masyusculas es menor al de las minusculas

lb a3,0(a1)   # Cargamos en a3 el byte de memoria con direccion a1
addi a0,a3,-32  # En codigo ASCII 's' esta a 32 bit= 4 bytes de 'S'
li a7,11
ecall

lb a3,1(a1)   # Cargamos en a3 el byte de memoria con direccion a1 + 1
addi a0,a3,-32  # En codigo ASCII 'a' esta a 32 bit= 4 bytes de 'A'
li a7,11
ecall

lb a3,2(a1)   # Cargamos en a3 el byte de memoria con direccion a1 + 2
addi a0,a3,-32  # En codigo ASCII 'l' esta a 32 bit= 4 bytes de 'L'
li a7,11
ecall

lb a3,3(a1)   # Cargamos en a3 el byte de memoria con direccion a1 + 3
addi a0,a3,-32  # En codigo ASCII 't' esta a 32 bit= 4 bytes de 'T'
li a7,11
ecall

lb a3,4(a1)   # Cargamos en a3 el byte de memoria con direccion a1 + 4
addi a0,a3,-32  # En codigo ASCII 'o' esta a 32 bit= 4 bytes de 'O'
li a7,11
ecall

lb a3,5(a1)   # Cargamos en a3 el byte de memoria con direccion a1 + 5
addi a0,a3,-32  # En codigo ASCII 's' esta a 32 bit= 4 bytes de 'S'
li a7,11
ecall


end:
li a7,10
ecall