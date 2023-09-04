addi x1, x0, 65			#65 e o valor ASCII de 'A'
# addi x2, x0, 66 		66 e o valor ASCII de 'B'
# addi x3, x0, 67 		67 e o valor ASCII de 'C'
# addi x4, x0, 68 		68 e o valor ASCII de 'D'
addi x5, x0, 69 		#69 e o valor ASCII de 'E' 
# addi x6, x0, 70 		70 e o valor ASCII de 'F' 
# addi x7, x0, 71 		71 e o valor ASCII de 'G'
# addi x8, x0, 72 		72 e o valor ASCII de 'H'
# addi x9, x0, 73 		73 e o valor ASCII de 'I'
# addi x10, x0, 74 		74 e o valor ASCII de 'J'
# addi x11, x0, 75 		75 e o valor ASCII de 'K'   
# addi x12, x0, 76 		76 e o valor ASCII de 'L'   
addi x13, x0, 77 		#77 e o valor ASCII de 'M'
# addi x14, x0, 78 		78 e o valor ASCII de 'N'   
# addi x15, x0, 79 		79 e o valor ASCII de 'O'  
addi x16, x0, 80 		#80 e o valor ASCII de 'P'   
# addi x17, x0, 81 		81 e o valor ASCII de 'Q'   
# addi x18, x0, 82 		82 e o valor ASCII de 'R'   
# addi x19, x0, 83 		83 e o valor ASCII de 'S'  
addi x20, x0, 84 		#84 e o valor ASCII de 'T'  
# addi x21, x0, 85 		85 e o valor ASCII de 'U'   
# addi x22, x0, 86 		86 e o valor ASCII de 'V'   
# addi x23, x0, 87 		87 e o valor ASCII de 'W'  
# addi x24, x0, 88 		88 e o valor ASCII de 'X'   
# addi x25, x0, 89 		89 e o valor ASCII de 'Y'   
# addi x26, x0, 90 		90 e o valor ASCII de 'Z'   
addi x2, x0, 13 		#13 e o valor ASCII de 'Enter'
addi x3, x0, 2 			#para comparar com o contador
addi x21, x0, 48		#48 e o valor ASCII de '0'
addi x23, x0, 100		#para subtrair das centenas
addi x24, x0, 10		#para subtrair das dezenas
jal x0, loop
#aqui serao printadas as pontuacoes totais de cada jogador // funcoes reaproveitadas da questao 6
#primeiro printo a pontuacao do jogador 1 e depois a do jogador 2
main: 
	add x29, x0, x28 #x29: o valor da palavra do jogador 1 ou 2
	 #vou reduzir as centenas ate que sobre apenas as dezenas e assim por diante
	p1:
	bge x29, x23, centena #se o valor for maior ou igual a 100, entao ele vai para a funcao centena
	add x10, x10, x21 #soma 48 para ser printado de acordo com a tabela ascii
	sb x10, 1024(x0) #printa x10
	add x10, x0, x0 #zera x10
	jal x0, p2 #vai para a funcao dezena
	centena:
		sub x29, x29, x23 #subtrai 100 do valor
		addi x10, x10, 1 #soma um no contador de quantas centenas foram retiradas
		jal x0, p1 #reinicia o loop
	#vou reduzir as dezenas ate que sobre apenas as unidades
	p2: 
	bge x29, x24, dezena #se o valor for maior ou igual a 10, entao ele vai para a funcao dezena
	add x10, x10, x21 #soma 48 para ser printado de acordo com a tabela ascii
	sb x10, 1024(x0) #printa x10
	add x10, x0, x0 #zera x10
	jal x0, p3 #vai para a funcao unidade
	dezena:
		sub x29, x29, x24 #subtrai 10 do valor
		addi x10, x10, 1 #soma um no contador de quantas dezenas foram retiradas
		jal x0, p2 #reinicia o loop
	p3:
		add x29, x29, x21 #soma 48 para ser printado de acordo com a tabela ascii
		sb x29, 1024(x0) #printa x29, que eh o que sobrou do valor inicial
		sb x2, 1024(x0) #printa o enter

	addi x4, x4, 1 
	blt x4, x3, primeiro #aqui se decide para quem vai o valor atual, se para o jogador 1 ou 2
	add x31, x0, x28 #x31 registrador do jogador 2
	jal x0, fim #como ja preencheu os dois jogadores, entao vai para a funcao fim
	 #se o contador for menor que 2, entao o valor vai para o jogador 1 e o contador foi zerado
	primeiro:
		add x30, x0, x28
		add x28, x0, x0
loop:
	lb x27, 1025(x0) #le o valor do teclado
	beq x27, x2, main #se for enter significa que o jogador terminou de digitar a palavra, logo ta na hora de calcular a soma das suas letras
	#para nao usar 26 registradores reaproveitei um mesmo registrador e fui mudando o valor dele varias vezes
	#aqui comparo o valor digitado com a tabela e mando para a funcao indicada
	addi x1, x0, 65
	beq x27, x1, um
	addi x1, x0, 69
	beq x27, x5, um
	addi x1, x0, 73
	beq x27, x1, um
	addi x1, x0, 79
	beq x27, x1, um
	addi x1, x0, 85
	beq x27, x1, um

	addi x1, x0, 75
	beq x27, x1, dois
	addi x1, x0, 82
	beq x27, x1, dois
	addi x1, x0, 83
	beq x27, x1, dois

	addi x1, x0, 68
	beq x27, x1, tres
	addi x1, x0, 71
	beq x27, x1, tres
	addi x1, x0, 84
	beq x27, x1, tres

	addi x1, x0, 70
	beq x27, x1, quatro
	addi x1, x0, 72
	beq x27, x1, quatro
	addi x1, x0, 86
	beq x27, x1, quatro
	addi x1, x0, 87
	beq x27, x1, quatro
	addi x1, x0, 89
	beq x27, x1, quatro

	addi x1, x0, 66
	beq x27, x1, cinco
	addi x1, x0, 67
	beq x27, x1, cinco
	addi x1, x0, 77
	beq x27, x1, cinco
	addi x1, x0, 78
	beq x27, x1, cinco
	addi x1, x0, 80 
	beq x27, x1, cinco

	addi x1, x0, 74
	beq x27, x1, seis
	addi x1, x0, 76
	beq x27, x1, seis
	addi x1, x0, 88
	beq x27, x1, seis

	addi x1, x0, 81
	beq x27, x1, nove
	addi x1, x0, 90
	beq x27, x1, nove
	#aqui comecam as funcoes baseada na pontuacao mostrada na tabela:
	#um, dois, tres, quatro, cinco, seis, nove
	um:
		addi x28, x28, 1
		jal x0, loop
	dois:
		addi x28, x28, 2
		jal x0, loop
	tres:
		addi x28, x28, 3
		jal x0, loop
	quatro:
		addi x28, x28, 4
		jal x0, loop
	cinco:
		addi x28, x28, 5
		jal x0, loop
	seis:
		addi x28, x28, 6
		jal x0, loop
	nove:
		addi x28, x28, 9
		jal x0, loop
	fim:
		blt x31, x30, primeiroVenceu #compara se o primeiro jogador venceu
		blt x30, x31, segundoVenceu #compara se o segundo jogador venceu
		jal x0, empate #se nenhum dos dois venceu, empate
		primeiroVenceu:
			addi x6, x0, 49 #se o primeiro venceu, printa 1
			sb x6, 1024(x0)	 #printa
			jal x0, encerrar # leva para o fim do programa
		segundoVenceu:
			addi x6, x0, 50 #se o segundo venceu, printa 2
			sb x6, 1024(x0) #printa
			jal x0, encerrar
		#em caso de empate sera printado EMPATE na tela
		empate:
			sb x5, 1024(x0)
			sb x13, 1024(x0)
			sb x16, 1024(x0)
			sb x1, 1024(x0)
			sb x20, 1024(x0)
			sb x5, 1024(x0)
	encerrar:
		halt

