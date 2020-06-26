# programa que muestra la diferencia entre la suma de los elementos que ocupan posicion
# impar y la suma de los elementos que ocupan posicio par.

# 0 + 2
# 1 + 2

.data
	vector:	.byte 3, 4, 1, 3, 5, 2, 6
	numElementos: .byte 7
.text

	# hacer un bucle que haga 0, 2, 4, 6
	li $t0, 0
	li $t3, 0 # suma de los elementos pares.
	lb $t5, numElementos # cantidad de elementos.
sumar_pares:
	bgt $t0, $t5, fin_sumar_pares
	beq $t0, $t5, fin_sumar_pares
	lb $t2, vector($t0)
	add $t3, $t3, $t2
	addi  $t0, $t0, 2
	j sumar_pares
fin_sumar_pares:	
	# hacer un bucle que haga 1, 3, 5, 7
	li $t0, 1
	li $t4, 0 # suma de los elementos impares.
	lb $t5, numElementos # cantidad de elementos.
sumar_impares:
	bgt $t0, $t5, fin_sumar_impares
	beq $t0, $t5, fin_sumar_impares
	lb $t2, vector($t0)
	add $t4, $t4, $t2
	addi  $t0, $t0, 2
	j sumar_impares
fin_sumar_impares:
	sub $t3, $t3, $t4 # te = suma_pares - suma_impares
	li $v0, 1
	move $a0, $t3
	syscall


