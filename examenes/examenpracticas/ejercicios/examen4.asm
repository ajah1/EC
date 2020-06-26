#programa que pide un numero y muestra por pantalla desde 1 hasta ese numero.
.data
	cadena1:.asciiz "Introduce un numero: "
.text
	li $v0, 4
	la $a0, cadena1
	syscall
	li $v0, 5
	syscall
	move $t2, $v0
	li $t1, 1
inicio_bucle:
	bgt $t1, $t2, fin_bucle
	li $v0, 1
	move $a0, $t1
	syscall
	addi $t1, $t1, 1
	j inicio_bucle

fin_bucle:
#5. programa que pide un numero y muestra la suma desde 1 hasta ese numero:
# numero: 3 => 1 + 2 + 3 = 6