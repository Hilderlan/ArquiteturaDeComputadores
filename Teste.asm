.text
.globl main

main:	la $t0, stringword
#	la $t1, stringasciiz
	
	li $s0, 0 	# contador de letras Min
	li $s1, 0 	# contador de letras Mai
	li $s2, 0	# contador de Num
	addi $t0, $t0, -4
Loop:	addi $t0, $t0, 4
	lw $t3, 0($t0)
#	lw $t4, 0($t1)
	la $t1, LimitInfMin
	lw $t4, 0($t1)
	bge $t3, $t4, Min
	la $t1, LimitInfMai
	lw $t4, 0($t1)
	bge $t3, $t4, Mai
	la $t1, LimitInfNum
	lw $t4, 0($t1)
	bge $t3, $t4, Num	
saida:	beq $t3, $zero, SAI
	j Loop
	
Num:	la $t1, LimitSupNum
	lw $t4, 0($t1)
	ble $t3, $t4, ContaNum
	
Mai:	la $t1, LimitSupMai
	lw $t4, 0($t1)
	ble $t3, $t4, ContaMai
		
Min:	la $t1, LimitSupMin
	lw $t4, 0($t1)
	ble $t3, $t4, ContaMin
	
ContaMai: addi $s0, $s0, 1
	  j Loop

ContaMin:  addi $s1, $s1, 1
	  j Loop

ContaNum: addi $s2, $s2, 1
	  j Loop


SAI:	li $v0, 10
	syscall


.data
	stringword:	.word 'A', 'g', '5', 'L', 'H', 'i', 'e', '0', 0
#	stringasciiz:	.asciiz "A", "g", "5", "L", "H", "i", "e", "0"
	LimitInfNum:	.word 30
	LimitSupNum:	.word 39
	LimitInfMai:	.word 41
	LimitSupMai:	.word 0x5A
	LimitInfMin:	.word 61
	LimitSupMin:	.word 0x7A