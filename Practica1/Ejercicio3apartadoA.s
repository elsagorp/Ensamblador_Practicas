.data
A:	.word 8
B:	.word 3
R:	.word 0


.text
begin:

# cargamos la dereccion de memoria de F
la a2,R

# cargamos los valores a los registros correspondientes 
lw s2,A
lw s3,B

# hago la division de A entre B y guarda el resto en a1
rem a1,s2,s3

# almaceno el resto de la division en la memoria, despues lo cargo al registro a0 y imprimo

sw a1,0(a2)
lw a0,R

li a7,1
ecall

end:
li a7,10
ecall