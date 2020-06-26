# programa que imprimia por pantalla un vector que acaba en -1.
.data
	vector: .byte 2, 3, 1, 8, -1
.text
	li $t0, 0	# t0 = 0	
#	lb $t1, vector($t0) # $t1 = 2
#	addi $t0, $t0, 1 # $t0 = 1
#	lb $t1, vector($t0) # $t1 = 3
#	addi $t0, $t0, 1 # $t0 = 2
#	lb $t1, vector($t0) # $t1 = 1

	li $t0, 0
inicio_bucle:
	lb $t1, vector($t0)
	beq $t1, -1, fin_bucle
	# si la comparacion no es cierta continua aqui.
	li $v0, 1
	move $a0, $t1 # muevo a a0 que es lo que quiero mostrar
	syscall
	addi $t0, $t0, 1 # $t0 = $t0 + 1 (comentario aki lucia)
	j inicio_bucle #volvemos incondicionamelmente a inicio bucle nazi.	
fin_bucle:
