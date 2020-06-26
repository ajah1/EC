# pedir dos numeros y mostrar el mayor por pantalla, o si son iguales.
.data
	cadena1: .asciiz "Introduce un numero: "
	cadena2: .asciiz "Introduce otro numero: "
	cadena3: .asciiz "El mayor numero es: "
	cadena4: .asciiz "Los numeros son iguales\n"
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
	j fin	
fin:
