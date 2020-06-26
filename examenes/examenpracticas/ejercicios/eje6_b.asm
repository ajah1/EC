# programa que muestra por pantalla el vector que se encuentra en la etiqueta vector
# y que acaba en -1.
.data
	vector:
		.byte	4, 3, 1, 3, -1
.text
	li $t0, 0
inicio_bucle:
	lb $t1, vector($t0) # t1 = 4
	beq $t1, -1, fin_bucle
	li $v0, 1
	move $a0, $t1
	syscall
	addi $t0, $t0, 1 # t0++
	j inicio_bucle
fin_bucle:

	