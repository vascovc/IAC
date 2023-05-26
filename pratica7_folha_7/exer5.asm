.eqv print_str,4
.eqv read_int,5
.eqv end,10
.eqv print_int,1
.eqv print_int_hex, 34
.eqv print_char,11
.data
prompt: .asciiz "introduza um numero\n"
result: .asciiz "\n O numero em hexadecimal e: "

.text

.globl main
main:   la $a0,prompt
	li $v0, print_str
 	syscall
 	
 	li $v0, read_int
 	syscall
 	move $t0, $v0  #t0 = num
 	
 	la $a0,result
	li $v0, print_str
 	syscall
 	
 	addi $t1,$t1,0 #t1 = n
 	addi $t2,$0,8  #t2 = 8
 for:	bge $t1,$t2,done
 	
 	andi $t3,$t0,0xF0000000
 	srl $t3,$t3,28
 	
 	move $a0,$t3
 	li $v0,print_int_hex
 	syscall
 	li $a0,' '
	li $v0,print_char
 	syscall
 	
 	sll $t0,$t0,4#num = num<<4
 	
 	addi $t1,$t1,1#n++
 	j for
 done:	
 	
 	li $v0, end #para terminar
 	syscall # exit()