.text
main:
ori $t0,$0,0xF0000003
	sll $t1,$t0,4
	srl $t2,$t0,4
	sra $t3,$t0,4

# ao ser logico shift right multiplica 2^x
# ao ser logico shift esquerda divide por 2^x
# ao ser aritmentico mantem o sinal