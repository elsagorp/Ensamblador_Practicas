.data
salto: .word 10
length: .word 8

lista: .word 7
	   .word 5
	   .word -4
	   .word 100
	   .word -250
	   .word 73
	   .word -50
	   .word -5

.text
begin:
#Cargamos el tama?o de la lista
lw a3, length
la a2, lista
mv a4, a2


jal ra, BubbleSort
jal ra, SigNum
jal end
#-----------------------------------------------------------------------------------
BubbleSort:
begin_BubbleSort:
#save_context
addi sp, sp, -16
sw ra, 12(sp)
sw a4, 8(sp)
sw a3, 4(sp)
sw a2, 0(sp)
#-------------------
#nueva lista ordenada
mv t4, a4
mv t5, a3

#contadores
li t2, 0
li t6, 1


P1:# Se coge el primer elemento y se compara con el siguiente

lw t0, 0(t4)
lw t1, 4(t4)

bge t0,t1, P2

addi t4, t4, 4

#Contador para el caso de que se vaya sumando uno y si llega igual al tamaño del array significa q esta completamente ordenado y sales de la ricursividad BubbleSort
addi t2, t2, 1

# Este es en el caso de que no se tengan que ntercambiar posiciones porque t0 es menor que t1
jal bucle

P2:#En el caso de que sea mayor el de mas a la izquierda, entonces se intercambian de posici?n

sw t1, 0(t4)

addi t4, t4, 4
sw t0, 0(t4)

jal bucle


bucle:
#Este se encarga de gestionar el bucle externo (BubbleSort) y el interno (P1 y P2)
addi t6, t6, 1

blt t6, t5, P1

addi t2, t2, 1

blt t2, t5 , BubbleSort

end_BubbleSort:
#restore_context
lw a2, 0(sp)
lw a3, 4(sp)
lw a4, 8(sp)
lw ra, 12(sp)
addi sp, sp, 16
#-------------------
jalr zero, ra, 0
#-----------------------------------------------------------------------------------

SigNum:
#save_context
addi sp, sp, -12
sw ra, 8(sp)
sw a3, 4(sp)
sw a4, 0(sp)
#-------------------
li t2, 0
li t1, 0
mv t3, a3

begin_SigNum:
mv t4, a4
add t4, t4, t1 #lo inicializamos en 0
lw a1, 0(t4) #cargamos en a1 el elemento q corresponda a la dirrecion a2
jal ra, imprimir_enteros # Saltamos al procedimiento de imprimir entero con salto de linea
#-------------------
addi t1, t1, 4 # Se va sumando 4 a  la posicion actual del array, este corresponed al tama?o de un .word
addi t2, t2, 1 # Vamos contando uno a uno los elementes de la lista, para cuando sea igual al tama?o de esta, terminara el procedimiento
blt t2, t3, begin_SigNum

#restore_context
lw a4, 0(sp)
lw a3, 4(sp)
lw ra, 8(sp)
addi sp, sp, 12
#-------------------
jalr zero, ra, 0

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