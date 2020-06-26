# programa que pide dos valores y muestra la suma de ambos.
.data
	cadena1:	.asciiz "Introduce el primer valor: "
	cadena2:	.asciiz "Introduce el segundo el valor: "
	cadena3:	.asciiz "La suma es: "
.text
	# imprimir la cadena 1.
	li $v0, 4
	la $a0, cadena1
	syscall
	# leer el valor
	li $v0, 5
	syscall
	move $t1, $v0
	# imprimir la cadena 2.
	li $v0, 4
	la $a0, cadena2
	syscall
	# leer el valor
	li $v0, 5
	syscall
	move $t2, $v0
	add $t3, $t1, $t2
	li $v0, 4
	la $a0, cadena3
	syscall
	
	li $v0, 1
	move $a0, $t3
	syscall
	

	 