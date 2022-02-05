.data
line: .word 10
length: .word 7
space: .word 32
lista: .word 7
	   .word 5
	   .word -4
	   .word 100
	   .word -250
	   .word 73
	   .word -50

.text
begin:
#Cargamos el tamaño de la lista
lw a0, length
la a1, lista
jal ra, ordenaArray

end:
li a7,10
ecall
#-------------------
ordenaArray:
begin_ordenaArray:
li t0, 1
bgt a0, t0, ordena

orden:
addi sp, sp, -12
sw ra, 8(sp)
sw a0, 4(sp)
sw a1, 0(sp)
#-----------------------------------------------------------------------------------
mv a4, a1
mv t2, a0
mv t4, a0

L1:
addi a0, t2, -1
addi t1, a4, 0

L2:
lw a1, 0(t1)
lw a2, 4(t1)

blt a2, a1, cambio

ordena:
sw a1, 0(t1)
sw a2, 4(t1)

addi t1, t1, 4
addi a0, a0, -1

blt zero, a0, L2
addi t2, t2, -1
blt zero, t2, L1

#jal print

mv a0, a1
li a7,1
ecall

lw a0,line		# cargamos el valor 10
li a7,11 		# imprimimos el salto de linea ya que en codigo ASCII 10 es igual a \n
ecall

printArray:
lw a1, 8(sp)
lw a0, 4(sp)
lw ra, 0(sp)
addi sp, sp, 12

cambio:
mv a3, a1
mv a1, a2
mv a2, a3
j orden

L: 
lw a1, 0(t1)
li a0, 1
ecall

la a1, space
li a0, 4
ecall

addi t1, t1, 4
addi t4, t4, -1
blt zero, t4, L
jal end

#print:
