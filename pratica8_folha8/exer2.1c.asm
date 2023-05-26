.eqv print_str,4
.eqv read_int,5
.eqv end,10
.eqv print_int,1

#mais robusto na situacao de ser espaco mas nao verifica se e minuscula
.data 
minus: .asciiz "texto em minusculas" #ou entao .byte '0','l','a','\0'
#minus: .asciiz "TEXTO EM MAIUSCULAS" #alinea c
maius: .space 20

.text

.globl main
main: 
	la $a0,minus 
	la $a1,maius
	li $t0,0

while: 	addu $t1,$a0,$t0 # $t1 = minus + i*1 = &minus[i]
	lb $t2, 0($t1) #$t2 = minus[i]
	beq $t2,'\0',ewh#se for fim de string
	beq $t2,' ',skip#se for um espaco
	
	addi $t2,$t2,-32 #t2 = minus
	# para ser para maiuscula meter 32 em vez de -32
	
skip:	addu $t1,$a1,$t0 # &maius[i]
	sb $t2,0($t1) #guardar o espaco
	addi $t0,$t0,1#i++
	j while
ewh:	
	move $a0,$a1
	li $v0, print_str
 	syscall
	li $v0, end #para terminar
 	syscall # exit()
