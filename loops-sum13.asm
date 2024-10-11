#Aaron MacDougall
.globl 	sum13
.data 
	myArray: .space 32
.text 				 

#Params go in a0, a1, a2
#return value goes in v0
#end with jr $ra
#1 = true, 0 = false


	#a0 is the address of the start of the array
	#a1 is the length of the array
	#t0 is array counter/index
	#t1 is current summed Value
	#t2 is current value at index t0
	
defineArray:
	addi $s0, $0, 5
	addi $s1, $0, 4
	addi $s2, $0, 7
	addi $s3, $0, 6
	addi $s4, $0, 9
	addi $s5, $0, 8
	addi $s6, $0, 2
	addi $s7, $0, 1
	
	addi $t0, $0, 0
	sw $s0, myArray($t0)
	addi $t0, $t0, 4
	sw $s1, myArray($t0)	
	addi $t0, $t0, 4
	sw $s2, myArray($t0)
	addi $t0, $t0, 4
	sw $s3, myArray($t0)
	addi $t0, $t0, 4
	sw $s4, myArray($t0)
	addi $t0, $t0, 4
	sw $s5, myArray($t0)
	addi $t0, $t0, 4
	sw $s6, myArray($t0)
	addi $t0, $t0, 4
	sw $s7, myArray($t0)

	addi $t0, $0, 0
	la $a0, myArray($t0)
	addi $a1, $0, 8
sum13:				 
	move $t0, $0
	move $t1, $0
loop:	
	beq $t0, $a1 endLoop
	lw $t2, ($a0)
	addi $a0, $a0, 4
	addi $t0, $t0, 1
	beq $t2, 13, skip
	add $t1, $t1, $t2
	j loop
skip:
	beq $t0, $a1, endLoop
	addi $t0, $t0, 1
	addi $a0, $a0, 4
	j loop
endLoop:
	move $v0, $t1
	jr $ra
	
