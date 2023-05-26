.text

.globl main
main:
	li $a0,-5
	li $a1,7

	jal x_to_y
	
	move $a0,$v0
	li $v0,1
	syscall # imprimir n
	
	li $v0,10
	syscall
x_to_y:
	bne $a1, 0,return
	li $v0,1
	jr $ra
return:
	addiu $sp,$sp,-8
	sw $ra,0($sp)
	sw $s0,4($sp)

	move $s0,$a0
	addiu $a1,$a1,-1
	jal x_to_y
	
	mul $v0,$s0,$v0
	
	lw $s0,4($sp)
	lw $ra,0($sp)
	addi $sp,$sp,8
	
	jr $ra