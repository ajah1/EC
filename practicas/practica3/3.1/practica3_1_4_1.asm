#EJEMPLO DE RESTA
.data
	numero1:	.word	0x80000000
	numero2:	.word	1
.text
	main:
		lw $t1, numero1($0)  # $t1 = 0x80000000
		lw $t2, numero2($0)  # $t2 = 0x00000001
		sub $t1, $t1, $t2    # $t1 = 0x7FFFFFFF
				     # resta dos numeros en C2. :)
		sw $t1, numero1,($0) # numero1 = 0x7FFFFFFF
# cuando hace la resta da overflow y se para el programa, el
# 0x8000 0000 es el maximo valor negativo representable y como
# le resto 1, es decir, le sumo -1 de desborda y el programa
# se para por OVERFLOW NAZI.



		