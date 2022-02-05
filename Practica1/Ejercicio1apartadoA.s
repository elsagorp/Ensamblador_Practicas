.data
tex:  .string "39steps"	# Cadena de caracteres 
num:  .word 10
.text
begin:

#a)
la a0,tex # Cargamos la direccion de memoria de la cadena de caracteres
li a7,4  # Mostramos por pantalla el texto normal
ecall

end:
li a7,10
ecall