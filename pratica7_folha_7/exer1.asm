.eqv print_str,4
.eqv read_int,5

.data
prompt: .asciiz "introduza um numero"
strpar: .asciiz "o numero e par\n"
strimp: .asciiz "o numero e impar\n"

.text

.globl main
main:   la $a0,prompt
	li $v0, print_str
 	syscall
 	
 	li $v0, read_int
 	syscall
 	move $t0, $v0
 	
 	andi $t1,$v0,1
 	
 	bne $t1,$0,impar
 	
 	la $a0,strpar
	li $v0, print_str
 	syscall
 	j fim
 
 impar: la $a0,strimp
	li $v0, print_str
 	syscall
 
 fim: 	li $v0, 10 #para terminar
 	syscall # exit()