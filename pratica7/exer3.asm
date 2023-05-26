.data
	str_1: .asciiz "Introduza dois numeros: "
	str_2: .asciiz "\nA soma dos numeros e: "
.text
.eqv print_str,4 #faz equivalencia de print_str para 4 que e o print do mars
.globl main
main:
	la $a0, str_1 # para carregar a str_1 para a0
	li $v0, print_str
 	syscall
 	
 	li $v0, 5 # 5 le inteiro para o v0
 	syscall
 	move $t0, $v0# passar de v0 para outra 
 	
 	li $v0, 5
 	syscall 
 	move $t1, $v0# mudar para outra
 	
 	la $a0, str_2
 	li $v0, print_str
 	syscall
 	
 	add $a0,$t1,$t0 #fazendo addu faz se a soma unsigned
 	li $v0, 1 #mudar aqui para 36 para mandar numero unsigned
 	syscall
 	
 	li $v0, 10 #para terminar
 	syscall # exit()
