#EJEMPLO DE RESTA
.data
	numero1:	.word	0x80000000
	numero2:	.word	1
.text
	main:
		lw $t1, numero1($0)  # $t1 = 0x80000000
		lw $t2, numero2($0)  # $t2 = 0x00000001
		subu $t1, $t1, $t2    # $t1 = 0x7FFFFFFF
		sw $t1, numero1,($0) # numero1 = 0x7FFFFFFF