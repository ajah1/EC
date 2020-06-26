# programa que suma los elementos que ocupan posicion par,
# los elementos que ocupan la posicion impar y muestra por pantalla
# la mayor suma.

.data
	vector:		.byte 2, 3, 1, 1, 1, 10, 7
	numElementos: 	.byte 7
	cadenaIguales:	.asciiz "los numeros son iguales\n"
.text
	# 1 + 2 + 3 + 5 = 11
	# 3 + 1 + 4 = 8
	# la mayor suma es: 11
	lb $t2, numElementos # t2 = limite del bucle
	li $t1, 0 # contador = 0
	li $t4, 0 # t4 = suma de los pares.
inicio_bucle_pares:
	beq $t1, $t2, fin_bucle_pares # si es igual me voy
	bgt $t1, $t2, fin_bucle_pares # si es mayor me voy 
	lb $t3, vector($t1)
	add $t4, $t4, $t3 # suma = suma + valor
	addi $t1, $t1, 2
	j inicio_bucle_pares
fin_bucle_pares:
	
	li $t1, 1 # contador = 0
	li $t5, 0 # t5 = suma de los impares.
inicio_bucle_impares:
	beq $t1, $t2, fin_bucle_impares # si es igual me voy
	bgt $t1, $t2, fin_bucle_impares # si es mayor me voy 
	lb $t3, vector($t1)
	add $t5, $t5, $t3 # suma = suma + valor
	addi $t1, $t1, 2
	j inicio_bucle_impares
fin_bucle_impares:
	 bgt $t4, $t5, mayor_pares
	 bgt $t5, $t4, mayor_impares
son_iguales:
	# mostrar son iguales
	li $v0, 4
	la $a0, cadenaIguales
	syscall
	j fin
mayor_pares:
	#mostrar $t4
	li $v0, 1
	move $a0, $t4
	syscall
	j fin
mayor_impares:
	#mostrar $t5
	li $v0, 1
	move $a0, $t5
	syscall
	j fin	
fin:
		
		