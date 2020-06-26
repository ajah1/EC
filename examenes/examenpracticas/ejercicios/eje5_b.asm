#programa que pide un numero mayor que 0, en caso de que no sea mayor que 0, mostrara error y lo volvera a pedir.
# Finalmente imprime la suma de los numeros desde 1 hasta n, mostrando todo el desarroollo.
# n: 3
# 1 + 2 + 3 = 6

.data
	cadena1: .asciiz "n: "
	cadena2: .asciiz "+"
	cadena3: .asciiz "="
	cerror: .asciiz "error"
.text

pedir_n:
	li $v0, 4
	la $a0, cadena1
	syscall
	li $v0, 5
	syscall
	move $t1, $v0
	bgt $t1, 0, salir_pedir_n
	li $v0, 4
	la $a0, cerror
	syscall
	j pedir_n
salir_pedir_n:
	
	li $t2, 1 # $t2 = Contador
	li $t4, 0 # $t4 = suma
inicio_bucle:
	bgt $t2, $t1, fin
	li $v0, 1
	move $a0, $t2
	syscall
	beq $t2, $t1, mostrar_igual
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
	add $t4, $t4, $t2
	addi $t2, $t2, 1 #i++
	j inicio_bucle
fin:	
	# muestro el resultado de la suma.
	li $v0, 1
	move $a0, $t4
	syscall
