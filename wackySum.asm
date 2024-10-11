#Aaron MacDougall
.globl wackySum
.text 

#testing 3,7,2, output should be 27
addi $a0, $0, 3
addi $a1, $0, 7
addi $a2, $0, 2


#WackySum(int a, int b, int c)
#a = a0, b = a1, c = a2
#sum = s0
wackySum:
	addi $sp, $sp, -28
	sw $ra, 0($sp)
	sw $s0, 4($sp)
	sw $s1, 8($sp)
	
	addi $s0, $0, 0 #sum = s0
	addi $s1, $a0, 0 #index = s1
	jal for	#always store ra before jal
	lw $ra, 0($sp)
	lw $s0, 4($sp)
	lw $s1, 8($sp)
	add $sp, $sp, 28
	jr $ra
for:
	bgt $s1, $a1, done
	#Store current RA on stack
	sw $ra, 12($sp) 
	#Store arguments for wackysum on stack
	sw $a0, 16($sp)
	sw $a1, 20($sp)
	sw $a2, 24($sp)
	#set a0, a1, a2, a3 to values for combineFour
	add $a0, $s1, $0
	addi $t0, $s1, 1
	sra $a1, $t0, 1
	addi $t0, $s1, 2
	sra $a2, $t0, 1
	addi $a3, $s1, 3 
	#jump to combineFour
	jal combineFour
	add $s0, $s0, $v0
	#load the arguments for wackysum
	lw $ra, 12($sp)
	lw $a0, 16($sp)
	lw $a1, 20($sp)
	lw $a2, 24($sp)
	#increment the index of the FOR loop
	add $s1, $s1, $a2
	j for
done:
	add $v0, $s0, $0
	jr $ra
combineFour:
	add $t0, $a0, $a1
	add $t1, $a2, $a3
	add $t0, $t0, $t1
	and $t1, $t0, 1
	beq $t1, 0, even #branch if the sum is even
	sra $v0, $t0, 1
	jr $ra	
even:
	add $v0, $t0, 0
	jr $ra
