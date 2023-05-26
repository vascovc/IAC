.eqv print_str,4
.eqv read_int,5
.eqv end,10
.eqv print_char,11

.data
prompt: .asciiz "introduza um numero\n"

.text

.globl main
main:   la $a0,prompt
	li $v0, print_str
 	syscall
 	
 	li $v0, read_int
 	syscall
 	move $t0, $v0 #t0 = a
 	
 for: 	bge $t1,$t0,done #t1 = i
 	
 	li $a0,'-'
	li $v0,print_char
 	syscall
 	
 	addi $t1,$t1,1
 	j for
 	
 done:	li $v0, end #para terminar
 	syscall # exit()