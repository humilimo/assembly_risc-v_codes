addi x22, x0, 0
#vogais maiusculas
addi x12, x0, 65 #A
addi x13, x0, 69 #E
addi x14, x0, 73 #I
addi x15, x0, 79 #O
addi x16, x0, 85 #U
#vogais minusculas
addi x17, x0, 97 #a
addi x18, x0, 101 #e
addi x19, x0, 105 #i
addi x20, x0, 111 #o
addi x21, x0, 117 #u
#espaço e enter
addi x23, x0, 32 #espaço
addi x11, x0, 13 #enter
#ler os caracteres digitados pelo teclado um por vez
loop: 
	lb x10, 1025(x0)
	beq x10, x11, fim #se for enter, sai do loop
	#conferindo todas as vogais
	beq x10, x12, loop 
	beq x10, x13, loop
	beq x10, x14, loop
	beq x10, x15, loop
	beq x10, x16, loop
	beq x10, x17, loop
	beq x10, x18, loop
	beq x10, x19, loop
	beq x10, x20, loop
	beq x10, x21, loop
	beq x10, x23, loop #se for espaço, reinicia o loop
	addi x22, x22, 1 #se o programa chegar aqui, é porque o caractere não é uma vogal nem barra de espaco, então incrementa o contador
	beq x10, x11, fim #se for enter, sai do loop
	jal x0, loop #reinicia o loop
fim:
	addi x22, x22, 48 #transforma o contador em caractere de acordo com a tabela ascii
	sb x22, 1024(x0) #printa o contador
	halt
