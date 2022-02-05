.data
year: .word 2020

salto: .word 10

nois: .string " is not a leap year"
is:  .string " is a leap year"

.text
begin:

#Cargamos year
lw a1, year

#Llamamos al procedimiento de imprimir enteros
jal imprimir_enteros

#Llamamos al procedimiento para ver si es o no bisiesto 
jal procedimiento

#Llamamos al procedimiento de imprimir la cadena de caracteres nois o is dependiendo del resultado de procedimiento
jal imprimir_cadena

#Llamamos al procedimiento de salto de linea
jal salto_de_linea

jal end

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

end_imprimir_enteros:
#restore_context
lw a1, 0(sp)
lw ra, 4(sp)
addi sp, sp, 8
#-------------------
jalr zero, ra, 0
#-----------------------------------------------------------------------------------

#--------------------------------------------------------------------------------------------------------------
procedimiento:
begin_procedimiento:
#save_context
addi sp, sp, -8
sw ra, 4(sp)
sw a1, 0(sp)
#-------------------
#Cargamos 4, 100 y 400
li s2, 4
li s3, 100
li s4, 400

#------------------------------------------------------------------------------------------------
# x =
#Divisible entre 4, lo comprobamos
rem a3,a1,s2

#Si el resto es diferente a 0, salta a la otra opci?n de la formula, que no sea divisible entre 400
bne a3, zero, divisible
#----------------------------------------
# y =
#Pero tiene que no ser divisible entre 100
rem a5,a1,s3
#Si el resto es diferente a 0, salta a la etiqueta bisiesto
bne a5, zero, bisiesto
#------------------------------------------------------------------------------------------------
# z =
divisible:
# Vemos si es divisible entre 400
rem t0,a1,s4
#Si el resto es igual a 0, salta a la etiqueta bisiesto
beq t0, zero, bisiesto

#No bisisesto:
li a0, 0
jal end_procedimiento

bisiesto:
#Caso en el que sea bisiesto:
li a0, 1
#--------------------------------------------------------------------
end_procedimiento:
#restore_context
lw a1, 0(sp)
lw ra, 4(sp)
addi sp, sp, 8
#-------------------
jalr zero, ra, 0
#------------------------------------------------------------------------------------------------

#-----------------------------------------------------------------------------------
imprimir_cadena:
begin_imprimir_cadena:
#save_context
addi sp, sp, -8
sw ra, 4(sp)
sw a0, 0(sp)
#-------------------
#Imprime la cadena de caracteres

# Si a0 es 1 se imprime es bisiesto y si es 0 se imprime no bisiesto
bne a0, zero, si_bisiesto

la a0, nois
li a7,4
ecall
jal end_imprimir_cadena

si_bisiesto:
la a0, is
li a7,4
ecall

end_imprimir_cadena:
#restore_context
lw a0, 0(sp)
lw ra, 4(sp)
addi sp, sp, 8
#-------------------
jalr zero, ra, 0
#-----------------------------------------------------------------------------------

#-----------------------------------------------------------------------------------
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