	addi $a0, $0, 3
	jal fib
	add $t0, $0, $0
	jr $ra
	
fib:
	beq $a0, $0, done0
	beq $a0, 1, done1
	
	add $sp, $sp, -8
	sw $a0, 0($sp)
	sw $ra, 4($sp)
	
	addi $a0, $a0, -1
	jal fib
	
	lw $a0, 0($sp)
	sw $v0, 0($sp)
	
	addi $a0, $a0, -2
	jal fib
	
	lw $t0, 0($sp)
	lw $ra, 4($sp)
	add $sp, $sp, 8
	add $v0, $v0, $t0
	
	jr $ra
done0:
	add $v0, $0, $0
	jr $ra
done1:
	addi $v0, $0, 1
	jr $ra