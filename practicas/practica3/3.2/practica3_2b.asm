#ESTRUCTURA DE COMPUTADORES
#CURSO 2015-2016
#EJEMPLO DE MENÚ GENÉRICO CON BIFURCACIONES
.data
cadena1: .asciiz"\n\n MENU DE OPERACIONES\n"
cadena2: .asciiz"1.-Sumar números\n"
cadena3: .asciiz"2.-Restar números\n"
cadena4: .asciiz"3.-Multiplicar números\n"
cadena14: .asciiz"4. Dividir numeros\n"
#cadena5: .asciiz"5.-Salir\n\t"
cadena6: .asciiz"Introduce opcion: "
cadena61:.asciiz "Opción no válida."
cadena7: .asciiz"Introduce el primer número: "
cadena8: .asciiz"Introduce el segundo número: "
cadena9: .asciiz"La suma es "
cadena10: .asciiz"La resta es "
cadena11: .asciiz"El producto es "
cadena15: .asciiz"El cociente es "
cadena12: .asciiz"\n\nFindel programa. Adios..."
cadena16: .asciiz"\n¿Deseas realizar otra operacion(S/N)?"
.text
main:
menu:
li $v0, 4		#LLamadaa imprimir cadena
la $a0, cadena1		#Muestra la cadena por pantalla
syscall
li $v0, 4
la $a0, cadena2
syscall
li $v0, 4
la $a0, cadena3
syscall
li $v0, 4
la $a0, cadena4
syscall
li $v0, 4
la $a0, cadena14
syscall
# no imprimo la opcion de salir
#li $v0, 4
#la $a0, cadena5
#syscall
valmaxmin:
li $t8, 1	#Almacena el valor mínimo posible de la opción
li $t9, 4	# la opcion 5 ya no es una opcion valida.
#li $t9,5	#Almacena el valor máximo posible de la opción
opcion:
la $a0, cadena6
li $v0,4
syscall
li $v0, 5	#Lee el valor introducido por teclado
syscall
move $t1,$v0	#Almacena el valor leído
blt $t1,$t8,volver	#Compara el valor leído con el valosmínimo.
bgt $t1,$t9,volver	#Compara el valor leído con el valor máximo.
seleccion:
move $s0,$v0
beq $s0,1, sumar		#Si el valor introducido es 1 salta a sumar:
beq $s0,2, restar	#Idemsi es 2
beq $s0,3, multiplicar	#Idemsi es 3
beq $s0,4, dividir
sumar:
li $v0, 4
la $a0, cadena7
syscall #pido el numero
li $v0, 5
syscall #lo recogo
move $t0, $v0 #lo meto en t0
li $v0, 4
la $a0, cadena8 #pido el numero 2
syscall
li $v0, 5 # lo recojo
syscall
move $t1, $v0 # lo muevo a t1
li $v0, 4
la $a0, cadena9
syscall
add $a0, $t0, $t1	#Efectúa la suma
li $v0, 1		#Muestra por pantalla el mensaje correspondiente
syscall
j preguntar
#j menu			#Vuelve a mostrar el menú de operaciones
restar:
li $v0, 4
la $a0, cadena7
syscall
li $v0, 5
syscall
move $t0, $v0
li $v0, 4
la $a0, cadena8
syscall
li $v0, 5
syscall
move $t1, $v0
li $v0, 4
la $a0, cadena10
syscall
sub $a0, $t0, $t1
li $v0, 1
syscall
j preguntar
#j menu
multiplicar:
li $v0, 4
la $a0, cadena7
syscall
li $v0, 5
syscall
move $t0, $v0
li $v0, 4
la $a0, cadena8
syscall
li $v0, 5
syscall
move $t1, $v0
li $v0, 4
la $a0, cadena11
syscall
mul $a0, $t0, $t1
li $v0, 1
syscall
j preguntar
#j menu ## faltaba esto porque si no se va del programa despues de mutliplicar

# dividir
dividir:
# peticion de los datos
li $v0, 4
la $a0, cadena7
syscall
li $v0, 5
syscall
move $t0, $v0
li $v0, 4
la $a0, cadena8
syscall
li $v0, 5
syscall
move $t1, $v0
li $v0, 4
la $a0, cadena15
syscall
# dividir y mostrar el resultado
div $a0, $t0, $t1 # $a0 = $t0/$t1
li $v0, 1
syscall
j preguntar
#j menu

############
preguntar:
li $v0, 4
la $a0, cadena16
syscall
li $v0, 12
syscall
# el caracter esta en $v0
li $t1, 115
beq $v0, $t1, menu
li $t1, 83
beq $v0, $t1, menu

li $t1, 110
beq $v0, $t1, fin
li $t1, 78
beq $v0, $t1, fin

j preguntar
#############
fin:
la $a0, cadena12
li $v0,4
syscall
li $v0,10
syscall

volver:
la $a0,cadena61
li $v0,4
syscall		#muestra por pantalla el mensaje Opción no válida
j opcion#
