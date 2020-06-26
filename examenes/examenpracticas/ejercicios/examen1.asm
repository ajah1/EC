# pedir dos numeros e indicar cual es el mayor o si son iguales.
.data
	cadena1: 	.asciiz "numero 1: "
	cadena2: 	.asciiz "numero 2: "
	cadena3:	.asciiz "el mayor es: "
	cadena4: 	.asciiz "son iguales"
.text
	li $v0, 4
	la $a0, cadena1
	syscall
	li $v0, 5
	syscall
	move $t1, $v0
	li $v0, 4
	la $a0, cadena2
	syscall
	li $v0, 5
	syscall
	move $t2, $v0
	bgt $t1, $t2, mayor1
	bgt $t2, $t1, mayor2
iguales:
	li $v0, 4
	la $a0, cadena4
	syscall	
	j fin
mayor1:
	li $v0, 4
	la $a0, cadena3
	syscall
	li $v0, 1
	move $a0, $t1
	syscall
	j fin
mayor2:	
	li $v0, 4
	la $a0, cadena3
	syscall
	li $v0, 1
	move $a0, $t2
	syscall
fin:	
	