#Aaron MacDougall
.globl log_two
.text 

#must be recursive
#recursive case: log_two(x) = 1 + log_two(x/2)
#base case: log_two(1) = 0

addi $a0, $0, 8
	
log_two:
	beq $a0, 1, done1
	blt $a0, 1, invalid
	
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $a0, 4($sp)
	
	sra $a0, $a0, 1
	jal log_two
	
	lw $ra, 0($sp)
	lw $a0, 4($sp)
	addi $sp, $sp, 8
	
	addi $v0, $v0, 1
	
	jr $ra
done1:
	add $v0, $0, $0
	jr $ra
invalid:
	addi $v0, $0, -1
	jr $ra