.eqv print_str,4
.eqv read_int,5
.eqv end,10
.eqv print_int,1
.eqv read_str,8

.data 
prompt: .asciiz "O conteudo do Array e: \n"
str: .asciiz " ; "
lista: .word 4,3,-2,1,27,45

.text

.globl main
main: 	la $a0,prompt
	li $v0,print_str#imprimir prompt
	syscall
	
	add $t0, $0, $0 # t0 = i = 0
	
for:	sge $t1, $t0, 6 # i >=6 ?
	beq $t1, 1, endfor#se sim acaba
	
	la $t2, lista # t2 = &lista
	mulu $t3, $t0, 4 # t3 = i*4
	addu $t4, $t2, $t3 # t4 = &lista+ i*4 = &lista[i]
	lw $t5, 0($t4) # t4 = lista[i]
	
	move $a0, $t5
	li $v0, print_int
	syscall	#print do int
	
	la, $a0, str
	li $v0, 4
	syscall	#print do ;
	
	addi $t0, $t0, 1 # i++
	j for
	
endfor:	li $v0, end
	syscall
	