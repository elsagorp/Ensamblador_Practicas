.data
A:	.word 5
B:	.word 3
C:	.word 2
D:	.word 2
F:	.word 0

.text
begin:

# Cargamos la dereccion de memoria de F
la a2,F

# Cargamos los valores a los registros correspondientes 
lw s2,A
lw s3,B
lw s4,C
lw s5,D

# Hago la suma de A + B y la gurado en el registro a3
add a3,s2,s3


# Hago la suma de C + D y la gurado en el registro a4
add a4,s4,s5

# Hago la resta de (A + B) - (C + D) y la gurado en el registro a1
sub a1,a3,a4


# Almaceno el valor resultante de estas operaciones en la memoria, despues lo cargo al registro a0 y imprimo

sw a1,0(a2)
lw a0,F

li a7,1
ecall

end:
li a7,10
ecall