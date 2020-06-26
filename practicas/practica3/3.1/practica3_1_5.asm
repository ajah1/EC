.data
	string1: .asciiz "Introduce un numero: "
	string2: .asciiz "La media es: "
	string3: .asciiz "Introduce otro numero nazi: "
.globl main
.text
main:
	la $a0, string1
	li $v0, 4
	syscall		# imprimir cadena string1
	li $v0, 5
	syscall		# lee y deja el resultado en $v0
	move $t0, $v0	# el valor leido lo pongo en $t0
	
	la $a0, string3
	li $v0, 4
	syscall		# imprimir cadena string3
	li $v0, 5
	syscall		# lee y deja el resultado en $v0
	move $t1, $v0	# el valor leido lo pongo en $t1
	
	# calculamos la media.
	# los sumo
	add $t0, $t0, $t1
	sra $t0, $t0, 1
	
	
	la $a0, string2
	li $v0, 4	
	syscall		# imprimir cadena string2
	move $a0, $t0	# en $a0 hay que poner el entero a imprimir
	li $v0, 1	# imprimir un entero
	syscall
	li $v0, 10	# finalizar el programa nazi.
	syscall
	
