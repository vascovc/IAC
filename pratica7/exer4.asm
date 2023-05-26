.eqv print_str, 4 #faz equivalencia de print_str para 4 que e o print do mars
.eqv print_int_hex, 34
.eqv end,10
.text
.globl main
main:
	ori $t0,$0,0xF0000000
	and $t2,$t1,$t0
	srl $v0,$t2,2
	
 	li $v0, print_int_hex
 	syscall
 	
 	li $v0, end #para terminar
 	syscall # exit()