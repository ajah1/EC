# funcion que muesta por pantalla los elementos del vector que son pares.
# el vector esta en la etiqueta vector, el numero de elementos del vector es un byte
# que esta en numElementos

.data
	vector: .byte	2, 4, 5, 6
	numElementos: .byte 4
.text
	# 1. imprimirlos todos.
	# 2. solo los pares.
	
	lb $t2, numElementos # t2 = limite del bucle
	li $t1, 0 # contador = 0
	li $t4, 2 # divisor de la division entera
inicio_bucle:
	beq $t1, $t2, fin_bucle
	#coger el dato y comprobar que es par.
	lb $t3, vector($t1)
	div $t3, $t4 # elemento / 2
	mfhi $t5 # cuando dividimos el resto se queda en el registro hi, lo muevo a t5
	bne $t5, 0, seguir
mostrar:
	li $v0, 1
	move $a0, $t3
	syscall
seguir:
	addi $t1, $t1, 1
	j inicio_bucle
fin_bucle:
	