# programa que pide un valor mayor que 0 e imprime por pantalla,
# los numeros desde 1 hasta n, si el valor es 0 menor, mostrara error y se saldra.

.data 
	cadena1:	.asciiz	"Introduce un valor: "
	cadenaError:	.asciiz "Error.\n"
.text
	li $v0, 4
	la $a0, cadena1
	syscall
	li $v0, 5
	syscall
	move $t1, $v0
	blt $t1, 1, error
	li $t2, 1 # $t2 = Contador
inicio_bucle:
	bgt $t2, $t1, fin
	li $v0, 1
	move $a0, $t2
	syscall
	addi $t2, $t2, 1 #i++
	j inicio_bucle
error:
	li $v0, 4
	la $a0, cadenaError
	syscall
fin:
	

