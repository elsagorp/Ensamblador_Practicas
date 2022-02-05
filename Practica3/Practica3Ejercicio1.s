.data
year: .word 1900

nois: .string " is not a leap year"
is:  .string " is a leap year"

.text
begin:
# Formula a?o bisiesto -> (((divisible entre 4) y no (divisible entre 100)) o (divisible entre 400))
# x = divisible entre 4
# y = divisible entre 100
# z = divisible entre 400


#Cargamos e imprimimos el a?o
lw a0, year
mv a1,a0
li a7,1
ecall

#Cargamos 4, 100 y 400
li s2, 4
li s3, 100
li s4, 400

#------------------------------------------------------------------------------------------------
# x =
#Divisible entre 4, lo comprobamos
rem a3,a1,s2

#Si el resto es diferente a 0, salta a la otra opcion de la formula, que no sea divisible entre 400
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
#------------------------------------------------------------------------------------------------

#Caso en el que no sea bisiesto:
la a0, nois
li a7,4
ecall
jal end

bisiesto:
#Caso en el que sea bisiesto:
la a0, is
li a7,4
ecall

end:
li a7,10
ecall