.data
A:	.word 8
B:	.word 5
R:	.word 0


.text
begin:

# cargamos la dereccion de memoria de F
la a2,R

# cargamos los valores a los registros correspondientes 
lw s2,A		# Dividendo
lw s3,B		# Divisor

# A partir de la propiedad de la diision sacamos ->  R = A - (B * Cociente) 

# Primero sacamos el Cociente de A entre B y lo guardamos en a3
div a3,s2,s3

# Ahora hacemos la multiplicacion (B * Cociente) y el resultado lo guardamos en a4
mul a4,s3,a3

# Y por ultimo se hace la resta para hallar R ->  R = A - (B * Cociente)  y se guarda en el registro a1
sub a1,s2,a4

# almaceno el resto de la division en la memoria, despues lo cargo al registro a0 y imprimo

sw a1,0(a2)
lw a0,R

li a7,1
ecall

end:
li a7,10
ecall