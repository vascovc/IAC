.eqv print_str,4
.eqv read_int,5
.eqv end,10
.eqv print_int,1

# o problema deste codigo e que nao verifica se nao e caracter
.data 
minus: .asciiz "textOemminusculas" #ou entao .byte '0','l','a','\0'
maius: .space 20

.text

.globl main
main: 	addi $t0,$0,0 #t0 = i;i=0
	la $t1,minus #t1 com o endereco inicial de minus
	
while: 	add $t2,$t1,$t0 # $t2 = minus + i*1 = &minus[i]
	lb $t3, 0($t2) #$t3 = minus[i]
	beq $t3,'\0',done
	
	addu $t3,$t3,'A'
	sub $t3,$t3,'a'
	
	la $t4, maius #t4 contém o endereço inicial do array maius
	addu $t4, $t4, $t0 # $t4 = maius + i = &maius[i]
	sb $t3, 0($t4) # maius[i] = $t3
	
	#sb $t3,0($t2)
	
	addi $t0,$t0,1#i++
	j while
done:	
	la $a0,maius
	li $v0, print_str
 	syscall
	li $v0, end #para terminar
 	syscall # exit()
