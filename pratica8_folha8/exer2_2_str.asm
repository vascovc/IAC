.eqv print_str,4
.eqv read_int,5
.eqv end,10
.eqv print_int,1
.eqv read_str,8

.data 
prompt: .asciiz "Introduza uma string\n"
result: .asciiz "\nO numero de caracteres numericos: "
str: .space 40

.text

.globl main
main: 	la $a0, prompt
	li $v0, print_str
	syscall
	
	la $a0, str
	li $v0, read_str
	syscall 
	
	add $t0, $0, $0 # i = $t0 = 0
	add $s0, $0, $0 # n = $s0 = 0
	
	la $t1, str  # $t1 = &str
 for:	addu $t2, $t1, $t0 # $t2 = &str[i]
	lb $t3, 0($t2) # $t3 = str[i]
	
	beq $t3, '\0', end_for
	
	blt $t3, '0', else
	sgt $t4, $t3, '9'
	beq $t4, 1, else
	
	addiu $s0, $s0, 1

else:	addiu $t0, $t0, 1
	j for
 
 end_for:
 	la $a0, result
	li $v0, print_str
	syscall
	
	move $a0, $s0
	
	li $v0, print_int
	syscall
	
	li $v0, end
	syscall
 	
