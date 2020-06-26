#programa que pide un numero entre 1 y 31 y muestra por pantalla
# dos elevado a ese numero, si el numero introducido no esta entre 1 y 31
# salir del programa

.data
	cadena: .asciiz "Introduce un numero entre 1 y 31: "
	cadenaError: .asciiz "Error. debe estar entre 1 y 31"
.text
	li $v0, 4
	la $a0, cadena
	syscall 
	li $v0, 5
	syscall
	move $t1, $v0
	blt $t1, 1, error
	bgt $t1, 31, error
	li $t2, 1
	sllv $t2, $t2, $t1
	li $v0, 1
	move $a0, $t2
	syscall	
	j fin
error:
	li $v0, 4
	la $a0, cadenaError
	syscall
fin:
