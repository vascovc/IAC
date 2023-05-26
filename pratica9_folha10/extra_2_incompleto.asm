bubble_sort:
	
do:
	li $t0,1#houve_troca
	move $t1,$a0#t1 = paux = p

	li $t2,0 #t2 = i = 0
	addi $t3,$s1,-1;#t3 = n-1	
for:
	bge $t2,$t3,end_for
	addi $t4,$t4,1#paux+1
	ble $t1,$t4,end_if
	
	addi $t5,$t1,0
	addi $t1,$t4,0
	addi $t4,$t5,0
	addi $t1,$t1,-1
end_if:
	addi $t1,$t1,1
end_for:
	bne $t1,0,end_do
	j do
end_do: