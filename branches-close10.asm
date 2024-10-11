#Aaron MacDougall
.globl close10
.text 				 

#Params go in a0, a1, a2
#return value goes in v0
#end with jr $ra
#1 = true, 0 = false

	addi $a0, $0, 7
	addi $a1, $0, 13
close10:				 
	#a0 = a, a1 = b
	subi $t0, $a0, 10
	subi $t1, $a1, 10
	beq $a0, $a1 equal #check if a0 and a1 are equal	
	#absolute value instructions
	#https://stackoverflow.com/questions/2312543/integer-absolute-value-in-mips
	sra $t7, $t0, 31
	xor $t0, $t0, $t7
	sub $t0, $t0, $t7
	sra $t7, $t1, 31
	xor $t1, $t1, $t7
	sub $t1, $t1, $t7
	beq $t0, $t1 equal #check if difference w/10 are same
	slt $t2, $t0, $t1
	beq $t2, 1, closerA
	move $v0, $a1
	jr $ra
equal:
	move $v0, $0
	jr $ra
closerA:	
	move $v0, $a0
	jr $ra