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
	addiu $sp,$sp,-4
	sw $ra,0($sp)
	
	li $v0,1
	beqz $a1,xtex
	
	addi $a1,$a1,-1
	jal x_to_y
	mul $v0,$a0,$v0
xtex:
	lw $ra,0($sp)
	addiu $sp,$sp,4
	jr $ra