.data
cadena1:	.asciiz "Introduce el tamano del vector (0,127): "
error1:		.asciiz "Error. El tamaño debe ser un valor entre 0 y 127\n"
cadena2:	.asciiz	"Introduce un valor (0, 99) valor ( "
cadena2b:	.asciiz "): "
error2:		.asciiz	"Error. Debe ser un valor 0 y 99.\n"
cadena3:	.asciiz "Ordena (A)scendente o (D)escendete."
error3:		.asciiz "Error. (A)scendente p (D)escente."


tamano:		.byte	0
# reservo 127 bytes para el tamaño del vector
vector:		.space 127

.text
pedir_tamano:
	li $v0, 4		#imprimo la cadena
	la $a0, cadena1
	syscall
	
	li $v0, 5		#leer el tamaño
	syscall
	
	blt $v0, 0, error_tamano
	bgt $v0, 127, error_tamano
	j pedir_elementos
error_tamano:
	li $v0, 4
	la $a0, error1
	syscall
	j pedir_tamano

pedir_elementos:
	sb $v0, tamano	# almaceno el tamano en $v0
	move $t1, $v0   # guardo el tamano en $t1
	la $t2, vector	# guardo en $t2 la direccion del vector.
	li $t5, 1	# contador que empieza en 1.
bucle_pedir_elementos:
	beq $t1, 0, fin_pedir_elementos #cuando $t1 es 0 ya pedi todos.
	li $v0, 4
	la $a0, cadena2
	syscall
	#imprimo el valor del contador.
	li $v0, 1
	move $a0, $t5
	syscall
	li $v0, 4
	la $a0, cadena2b
	syscall
	
	li $v0, 5
	syscall
	# hay que comprobar que el valor $v0 esta entre 0 y 99.
	blt $v0, 0, error_valor
	bgt $v0, 99, error_valor
	j almacenar_y_seguir	
	error_valor:
	li $v0, 4
	la $a0, error2
	syscall
	j bucle_pedir_elementos
	# meto en el vector el elemento recogido.
	almacenar_y_seguir:
	sb $v0, ($t2)
	add $t2, $t2, 1		# sigiuiente posicion en memoria.
	sub $t1, $t1, 1		#decremento $t1
	add $t5, $t5, 1
	j bucle_pedir_elementos
	
fin_pedir_elementos:
	

ordenar_vector:
	lb $t4, tamano
	li $t0, 1
bucle_exterior:
	beq $t0, $t4, fin_ordenar_vector	
	move $t1, $t4
	sub $t1, $t1, 1
bucle_interior:
	blt $t1, $t0, fin_bucle_interior

	# comparamos la direccion de memoria t1 y t1-1 para saber si las tenemos que intercambiar.
	lb $t5, vector($t1)
	move $t7, $t1
	sub $t7, $t7, 1
	lb $t6, vector($t7)
	bgt $t5, $t6, no_intercambiar
intercambiar:
	sb $t5, vector($t7)
	sb $t6, vector($t1)

no_intercambiar:
	sub $t1, $t1, 1
	j bucle_interior	
fin_bucle_interior:
	add $t0, $t0, 1
	j bucle_exterior								
fin_ordenar_vector:

imprimir_vector:
	li $t0, 0 # primera posicion a imprimir del vector.
	lb $a2, tamano
bucle_imprimir_vector:
	beq $t0, $a2, fin_imprimir_vector
	lb $t1, vector($t0) #t1 = elemento a imprimir.
	# dividimos por 10 para separar el numero en dos digitos
	
	li $t3, 10 # para separar en digitos.
	div $t1, $t3 # hi = resto lo = cociente
	
	mfhi $a1
	li $a2,  0xFFFF0010 # display derecho
	jal imprimir_display # salta a imprimir_display pero guarda en $ra la direccion de la
	
	mflo $a1
	li $a2, 0xFFFF0011 # display izquiero
	jal imprimir_display # guarda en $ra la direccion de la direccion de la siguiente instruccion.
	
	addi $t0, $t0, 1	# siguiente posicion del vector a cargar.
	lb $a2, tamano
	j bucle_imprimir_vector
fin_imprimir_vector:
j fin_programa
			
	
	############################################
	# antes de llamar al procedimiento cargo los parametros.
	#li $a1, 6
	#li $a2,  0xFFFF0010 # display derecho
	#jal imprimir_display # salta a imprimir_display pero guarda en $ra la direccion de la
	#			## siguientes instruccion (direccion de retorno)
	#li $a1, 8
	#li $a2, 0xFFFF0011 # display izquiero
	#jal imprimir_display # guarda en $ra la direccion de la direccion de la siguiente instruccion.
	#############################################	

j fin_programa
	
# $a2 => direccion del display donde mostrar
# $a1 => el numero a mostrar (0..9) 
imprimir_display:
beq $a1, 0, cero
beq $a1, 1, uno
beq $a1, 2, dos
beq $a1, 3, tres
beq $a1, 4, cuatro
beq $a1, 5, cinco
beq $a1, 6, seis
beq $a1, 7, siete
beq $a1, 8, ocho
beq $a1, 9, nueve

cero:
	li $t1, 0x3F
	j guardar
uno:
	li $t1, 0x06
	j guardar		
dos:
	li $t1, 0x5b
	j guardar
tres:
	li $t1, 0x4f
	j guardar
cuatro:
	li $t1, 0x66
	j guardar
cinco:
	li $t1, 0x6D
	j guardar
seis:
	li $t1, 0x7D
	j guardar
siete:
	li $t1, 0x07
	j guardar
ocho:
	li $t1, 0x7f
	j guardar
nueve:
	li $t1, 0x67
guardar:
	#almaceno en la direccion de memoria que hay en $a2 (direccion del display)
	# el valor que hay en $t1 (codificacion del digito a mostrar)
	sb $t1, ($a2)

jr $ra # vuelvo al punto de llamada.

fin_programa:

	
	
	
	
	
