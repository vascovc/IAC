.eqv print_str,4
.eqv read_int,5
.eqv end,10
.eqv print_int,1

.data
prompt: .asciiz "introduza um numero\n"
result: .asciiz "o fatorial do numero inserido e: "

.text

.globl main
main:	la $a0,prompt
	li $v0, print_str
 	syscall
 	
 	li $v0, read_int
 	syscall
 	move $t0, $v0  #t0 = n
 	
 	addi $t1,$0,1  #t1 = f
 	addi $t2,$t0,0 #t2 = i
 	
 for: 	ble $t2,$0,done
 	mul $t1,$t1,$t2#f=f*i
 	subi $t2,$t2,1#i--
 	j for
 	
 done: 	la $a0, result
	li $v0, print_str
 	syscall
 	
 	move $a0,$t1
 	li $v0, print_int
 	syscall
 	li $v0, end #para terminar
 	syscall # exit()
