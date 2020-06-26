# programa que pide 3 numeros a, b y c, muestra por pantalla si a esta entre b y c.
.data
	cadena1: .asciiz "Introduce limite inferior: "
	cadena2: .asciiz "Introduce limite superior: "
	cadena3: .asciiz "Introduce valor"
	cadena4: .asciiz "El valor esta dentro del rango"
	cadena5: .asciiz "El valor esta fuera del rango"

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
	li $v0, 4
	la $a0, cadena3
	syscall
	li $v0, 5
	syscall
	move $t3, $v0
	
	# $t1= inf $t2= sup $t3= valor
	blt $t3, $t1, fuera
	bgt $t3, $t2, fuera
dentro:
	li $v0, 4
	la $a0, cadena4
	syscall
	j fin
fuera:
	li $v0, 4
	la $a0, cadena5
	syscall
fin:
	
	