.data
tex:  .string "39steps"	# Cadena de caracteres 
num:  .word 10			# Valor 10 que usaremos como salto de linea
.text
begin:
#b)

la a2,tex  # Cargamos la direccion de memoria de la cadena de caracteres

lb a0,0(a2)		# cargamos '3'
li a7,11 		# imprimimos '3'
ecall

lb a0,1(a2)		# cargamos '9'
li a7,11 		# imprimimos '9'
ecall

lw a0,num		# cargamos el valor 10
li a7,11 		# imprimimos el salto de linea ya que en codigo ASCII 10 es igual a \n
ecall

lb a0,2(a2)		# cargamos 's'
li a7,11 		# imprimimos 's'
ecall

lb a0,3(a2)		# cargamos 't'
li a7,11 		# imprimimos 't'
ecall

lb a0,4(a2)		# cargamos 'e'
li a7,11 		# imprimimos 'e'
ecall

lb a0,5(a2)		# cargamos 'p'
li a7,11 		# imprimimos 'p'
ecall

lb a0,6(a2)		# cargamos 's'
li a7,11 		# imprimimos 's'
ecall

end:
li a7,10
ecall