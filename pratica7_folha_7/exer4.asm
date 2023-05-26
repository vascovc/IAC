.eqv print_str,4
.eqv read_int,5
.eqv end,10
.eqv print_int,1

.data
prompt: .asciiz "introduza um numero\n"
result: .asciiz "a soma e: "

.text

.globl main
main: 	addi $t0,$t0,0# t0 = soma
	addi $t1,$0,0# i = 0
	addi $t2,$0,5# n = 5
for:	bge $t1,$t2,done #se for maior que 5 salta
	
	la $a0,prompt
	li $v0, print_str #imprime a frase
 	syscall
 	
 	li $v0, read_int
 	syscall
 	add $t0,$v0,$t0 # soma = lido+soma
	addi $t1,$t1,1 #i++
	j for

done: 	la $a0,result
	li $v0, print_str #imprime a frase
 	syscall
 	move $a0,$t0
 	li $v0, print_int
 	syscall
	li $v0, end #para terminar
 	syscall # exit()