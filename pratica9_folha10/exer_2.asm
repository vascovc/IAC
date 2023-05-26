.eqv print_str,4
.eqv read_int,5
.eqv end,10
.eqv print_int,1
.eqv read_str,8

.data
string1:	.asciiz "\nInsira a frase1: "
string2:	.asciiz "\nInsira a frase2: "
string3:	.asciiz "\nO numero de caracteres da frase1 é:"
string4:	.asciiz "\nA frase concatenada é: "
frase1:		.space 20
frase2:		.space 20
frase3:		.space 40
.text

.globl main
main:	
	la $a0, string1
	li $v0, print_str
	syscall #imprimir str1
	
	la $a0, frase1
	li $a1, 20
	li $v0, read_str
	syscall #read frase1
	
	la $a0, string2
	li $v0, print_str
	syscall #imprimir str2
	
	la $a0, frase2
	li $v0, read_str
	syscall #read frase2
	
	la $a0,string3
	li $v0,print_str
	syscall #imprimir str3
	
	la $a0, frase1
	jal strlen
	
	move $a0,$v0
	li $v0,print_int
	syscall # imprimir n
	
	la $a0,frase3
	la $a1,frase1
	jal strcpy
	move $t0,$v0
	
	la $a1,frase2
	jal strcat
	move $t1,$v0
	
	la $a0,string4
	li $v0,print_str
	syscall #imprimir str4
	
	move $a0,$t0
	li $v0,print_str
	syscall
	
	li $v0,end
	syscall

strlen: li $v0,0 # n = 0 mas devolve-se n por isso v
	addi $t0,$0,0 # i = 0
while_len:
	addu $t1, $a0, $t0 # str+i*1 = &str[i] em t1
	addi $t0,$t0,1 # i++
	
	lb $t2,0($t1) #t2 = str[i]
	beq $t2,'\0',end_while_len #se for fim salta
	addi $v0,$v0,1 #n++
	j while_len
end_while_len: jr $ra
##########
strcpy:
	li $t0,0#i=0
	
while_cpy:
	addu $t1, $a1, $t0 # str+i*1 = &str[i] em t1 temos src
	lb $t2,0($t1)      # t2 = str[i]
	
	beq $t2,'\0',end_while_cpy #se for fim salta
	
	addu $t3, $a0, $t0 # t3 = &dst[i]
	sb $t2, 0 ($t3)    # dst[i] = src[i}	
	addi $t0,$t0,1#i++
	
	j while_cpy
end_while_cpy:
	addu $t3, $a0, $t0
	sb $0,0($t3)
	move $v0,$a0
	jr $ra
#############
strcat:#dst = a0; src = a1
	addiu $sp,$sp,-8
	sw $ra,0($sp)
	
	sw $s0,4($sp)
	move $s0,$a0# s0 = dst
while_cat:
	lb $t0, 0($a0) #t0 = *dst; dst é um endereço
	beq $t0, '\0', end_while_cat
	addu $a0, $a0, 1 #dsr++
	j while_cat	
end_while_cat:
	jal strcpy
	move $v0,$s0
	lw $s0,4($sp)
	
	lw $ra,0($sp)
	addiu $sp,$sp,8 #subir a pilha
	jr $ra