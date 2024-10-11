#Aaron MacDougall
.globl intMax
.text 				 

#Params go in a0, a1, a2
#return value goes in v0
#end with jr $ra
#1 = true, 0 = false


intMax:				 
	#a0 = a, a1 = b, a2 = c
	slt $t0, $a1, $a0
	slt $t1, $a2, $a0
	and $t2, $t0, $t1
	beq $t2, 1, returnA
	slt $t3, $a2, $a1
	beq $t3, 1, returnB
	add $v0, $a2, $0
	jr $ra	
returnA:
	add $v0, $a0, $0	
	jr $ra			 
returnB:
	add $v0, $a1, $0	
	jr $ra	
	
