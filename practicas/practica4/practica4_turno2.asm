# Ejemplo displaysdel periférico Digital LabSim
.text
main:
li $s0, 0xFFFF0010 # carga dirección base del displayderecho
li $s1, 0xFFFF0011 # carga dirección base del displayizquierdo

# borro lo que tenia de la ejecucion anterior. 
li $t1, 0x00	
sb $t1, 0($s0)
sb $t1, 0($s1)

inicio:

li $t1, 0x01 	# a display derecho
sb $t1, 0($s0) 	# 

li $t1, 0x00 	# 
sb $t1, 0($s0) 	# borro el display derecho. 

li $t1, 0x01	# a display izquierdo
sb $t1, 0($s1)

li $t1, 0x20	# f display izquierdo
sb $t1, 0($s1)

li $t1, 0x10 	# e display izquierdo.
sb $t1, 0($s1)

li $t1, 0x08 	# d display izquierdo.
sb $t1, 0($s1)

li $t1, 0x0 	# e display izquierdo.
sb $t1, 0($s1)

li $t1, 0x08 	# d display derecho.
sb $t1, 0($s0)

li $t1, 0x04 	# c display derecho.
sb $t1, 0($s0)

li $t1, 0x02 	# b display derecho.
sb $t1, 0($s0)

li $t1, 0x01 	# b display derecho.
sb $t1, 0($s0)

j inicio


li $v0, 10 # Fin programa
syscall


