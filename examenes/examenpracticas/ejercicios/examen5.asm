#5. programa que pide un numero y muestra la suma desde 1 hasta ese numero:
# numero: 3 => 1 + 2 + 3 = 6

.data
	cadena1: .asciiz "Introduce un numero: "
	cadena2: .asciiz " + "
	cadena3: .asciiz " = "
.text
	li $v0, 4
	la $a0, cadena1
	syscall
	li $v0, 5
	syscall
	move $t2, $v0
	li $t1, 1
	li $t4, 0 # para guardar la suma uso $t4.
inicio_bucle:
	bgt $t1, $t2, fin_bucle
	li $v0, 1
	move $a0, $t1
	syscall
	# si es menor esto si es igual mostraremos =
	bge $t1, $t2, mostrar_igual
	mostrar_suma:
	li $v0, 4
	la $a0, cadena2
	syscall
	j seguir
	mostrar_igual:
	li $v0, 4
	la $a0, cadena3
	syscall	
	seguir:
	add $t4, $t4, $t1 # suma = suma + contador
	addi $t1, $t1, 1
	j inicio_bucle
fin_bucle:
	li $v0, 1
	move $a0, $t4
	syscall
