# programa que pide y tres valores a b y c. Muestra pro pantalla si c esta entre a y b. o si no esta entre a y b.
.data
	cadena1:	.asciiz		"Introduce el limite inferior: "
	cadena2:	.asciiz 	"Introduce el limite superior: "
	cadena3:	.asciiz 	"Introduce el valor: "
	cadena4:	.asciiz		"dentro"
	cadena5:	.asciiz		"fuera"

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

	# imprimir la cadena 3.
	li $v0, 4
	la $a0, cadena3
	syscall
	# leer el valor
	li $v0, 5
	syscall
	move $t3, $v0

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
		