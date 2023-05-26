.text
main:
ori $t0,$0,0x12345678
ori $t1,$0,0x0000ABCD
	
and $t2,$t0,$t1
or  $t3,$t0,$t1
nor $t4,$t0,$t1
xor $t5,$t0,$t1

# 1.3
not $t6,$t0#instrucao virtual
nor $t6,$t0,$0#esta e real

# se for do tipo i tem no maximo 16 bits se for do tipo r tem os 32 bits do registo
