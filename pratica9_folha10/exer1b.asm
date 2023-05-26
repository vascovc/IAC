.eqv print_str,4
.eqv read_int,5
.eqv end,10
.eqv print_int,1

.data 
prompt: .asciiz "Introduza um numero: "
result: .asciiz "o fatorial do numero "
result2: .asciiz " e: "

.text

.globl main
main: 	la $a0, prompt
	li $v0, print_str
	syscall #imprimir o texto
		
	li $v0, read_int
	syscall # v0 = num
		
	move $a0, $v0 # a0 = num
	move $s0, $v0 # s0 = num
	
	jal fact
	move $t1, $v0 #resultado em v0 mete-se em t1
	
	la $a0,result
	li $v0,print_str
	syscall
	
	move $a0,$s0
	li $v0,print_int
	syscall#imprimir o num
	
	la $a0,result2
	li $v0,print_str
	syscall
	
	move $a0,$t1
	li $v0,print_int
	syscall
	
	li $v0, end
	syscall
	
fact:	li $v0,1# v0 = res = 1
	move $t0,$a0# t0 = num e t0 vai ser o i
for:	ble $t0,0,endfor #se ja for menor que 0 parte
	mul $v0,$v0,$t0 # res=res*i
	addi $t0,$t0,-1 # i--
	j for#repete o ciclo
endfor:	jr $ra#acabou a func