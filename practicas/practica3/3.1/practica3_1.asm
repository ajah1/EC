.data
	vector:	.word 10, 7, 9
	
.text
	# sumar los elementos del vector
	li $t2, 0
	lw $t1, vector
	add $t2, $t2, $t1
	lw $t1, vector + 4
	add $t2, $t2, $t1
	lw $t1, vector + 8
	add $t2, $t2, $t1
	la $a0, 0x10010100
	sw $t2, ($a0)
	# multiplicar x 8
	sll $t2, $t2, 3
	la $a0, 0x10010120
	sw $t2, ($a0)
	# copia el contenido y cambia los bits 5, 7, 8
	la $a0, 0x10010120
	lw $t1, ($a0)
	xori $t1, $t1, 0x1A0
	la $a0, 0x10101040
	sw $t1, ($a0)
	
	