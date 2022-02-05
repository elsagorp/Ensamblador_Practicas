.data
salto: .word 10
length: .word 7

lista: .word 7
	   .word 5
	   .word -4
	   .word 100
	   .word -250
	   .word 73
	   .word -50

.text
begin:
#Cargamos el tama?o de la lista
lw t0, length
li t1, 0
li t2, 0
#-------------------

SigNum:
begin_SigNum:
la a2, lista

#lo inicializamos en 0
add a2, a2, t1 
lw a1, 0(a2) #cargamos en a1 el elemento q corresponda a la dirrecion a2
jal ra, imprimir_enteros # Saltamos al procedimiento de imprimir entero con salto de linea
#-------------------
addi t1, t1, 4 # Se va sumando 4 a  la posicion actual del array, este corresponed al tama?o de un .word
addi t2, t2, 1 # Vamos contando uno a uno los elementes de la lista, para cuando sea igual al tama?o de esta, terminara el procedimiento
bne t2, t0, SigNum
j end 

#-----------------------------------------------------------------------------------
imprimir_enteros:
begin_imprimir_enteros:
#save_context
addi sp, sp, -8
sw ra, 4(sp)
sw a1, 0(sp)
#-------------------
#Imprime el numero entero
mv a0, a1
li a7,1
ecall

#-----------------------------------------------------------------------------------
#salto_de_linea:
#begin_salto_de_linea:

lw a0,salto		# cargamos el valor 10
li a7,11 		# imprimimos el salto de linea ya que en codigo ASCII 10 es igual a \n
ecall

#end_salto_de_linea:
#----------------------------------------------------

end_imprimir_enteros:
#restore_context
lw a1, 0(sp)
lw ra, 4(sp)
addi sp, sp, 8
#-------------------
jalr zero, ra, 0

#-----------------------------------------------------------------------------------
end:
li a7,10
ecall