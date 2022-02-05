.data
entero: .word 12
cadena: .string "Imprimir cadenas de caracteres"
salto: .word 10
.text
begin:
lw a1,entero

jal imprimir_enteros
jal salto_de_linea
la a1, cadena
jal imprimir_cadena
 
jal end

#-----------------------------------------------------------------------------------
# Apartado A procedimiento para imprimir enteros
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

end_imprimir_enteros:
#restore_context
lw a1, 0(sp)
lw ra, 4(sp)
addi sp, sp, 8
#-------------------
jalr zero, ra, 0
#-----------------------------------------------------------------------------------

#-----------------------------------------------------------------------------------
# Apartado B procedimiento para imprimir cadena de caracteres
imprimir_cadena:
begin_imprimir_cadena:
#save_context
addi sp, sp, -8
sw ra, 4(sp)
sw a1, 0(sp)
#-------------------
#Imprime la cadena de caracteres
mv a0, a1
li a7,4
ecall

end_imprimir_cadena:
#restore_context
lw a1, 0(sp)
lw ra, 4(sp)
addi sp, sp, 8
#-------------------
jalr zero, ra, 0
#-----------------------------------------------------------------------------------


#-----------------------------------------------------------------------------------
# Apartado C procedimiento para realizar un salto de línea
salto_de_linea:
begin_salto_de_linea:

lw a0,salto		# cargamos el valor 10
li a7,11 		# imprimimos el salto de linea ya que en codigo ASCII 10 es igual a \n
ecall

end_salto_de_linea:
jalr zero, ra, 0
#-----------------------------------------------------------------------------------

end:
li a7,10
ecall