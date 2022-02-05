.data
arg: .word 4

.text
begin:
#Cargamos el 7 en a0 y llamamos al procedimiento fact(int)
lw a0, arg
jal ra,fact(int)

# Imprimimos el resultado
li a7, 1
ecall

end:
li a7, 10
ecall

fact(int): 
        blez    a0, .LBB0_4 
		
#Comparandolo con el código de C, en a0 esta n (arg en este caso) siendo la variable de entrada
        mv      a1, a0     #n(arg) esta en a1 ahora
        addi    a0, zero, 1 #result(la variable de retorno de la funcion) se inicializa con un 1
        addi    a2, zero, 1 #c (variable que controla el bucle) inicializada a 1
        beq     a1, a2, .LBB0_3 #Si n=c entonces salta a la etiqueta .LBB0_3, es el caso en el que n(arg) sea 1
.LBB0_2:                                
        addi    a2, a2, 1  # c + 1 igual que  c++
        mul     a0, a0, a2 # result = result * c (guardandose el resultado en a0, que es donde se encuentra result)
        bne     a1, a2, .LBB0_2 # si n es diferente de c se repite el bucle .LBB0_2
.LBB0_3:
        ret #Termina el procedimiento 
.LBB0_4:
# Salta directamente a esta etiqueta si el numero es menor o igual a 0
# si es negativo no se puede hacer factorial ya que tienen que ser numeros naturales
        addi    a0, zero, 1 #Devolviendo un 1, ya que, 0! = 1
        ret
