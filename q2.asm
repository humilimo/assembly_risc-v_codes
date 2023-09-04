addi x5, x0, 62 #parametro de comparacao
addi x6, x0, 15 #parametro de comparacao
addi x7, x0, 1
addi x8, x0, 2
addi x9, x0, 16 #numero de vezes que o loop deve rodar
addi x10, x0, 3
addi x11, x0, 48 #valor de 0 em ASCII
addi x17, x0, 13 #valor do enter em ASCII
addi x18, x0, 32 #valor do espaco em ASCII
zerar:
	add x21, x0, x0 #zerando o contador interno que vai de 1 a 3
	add x12, x0, x0
	addi x22, x22, 1 #contador de vezes que o loop externo deve rodar (15 vezes)
	beq x22, x9, fim #se o contador atingir 16 vezes (pois ele comeca em 1), o programa acaba
	zerandox12:
		add x12, x0, x0 #zerando o valor de x12
	scanf: 
		lb x20, 1025(x0) #le o proximo caractere
		sb x20, 1024(x0) #printa o caractere lido (primeiro printa o Valor de A, depois o de B e por fim o de C)
		sub x25, x20, x11 #tira o valor de 0 em ASCII do caractere lido
		#se o caracter lido for um espaco ou enter, o programa pula para a proxima iteracao
		beq x20, x18, vezDoA 
		beq x20, x17, vezDoA
		slli x13, x12, 3 #multiplica o valor de x12 por 8
		slli x14, x12, 1 #multiplica o valor de x12 por 2
		add x12, x13, x14 #efetua a soma dos dois valores anteriores, resultando em x12*10
		add x12, x12, x25 #soma o valor de x12*10 com o valor de x25, resultando em x12*10 + x25
		jal x0, scanf #chama a funcao scanf novamente
	#o contador x21 dira para quem ira o dado lido. Se o contaodr for igual a 1, o dado vai para a, se for igual a 2, vai para b e se for igual a 3, vai para c
	#valor digitado vai para o a
	vezDoA:
		addi x21, x21, 1 #somando 1 ao contador interno
		bne x21, x7, vezDoB #se o contador interno for diferente de 1, o programa pula para a proxima iteracao
		add x1, x0, x12 #a = x12
		sw x1, a #atualiza o valor de a
		jal x0, contador #chama a funcao contador
	#valor digitado vai para o b
	vezDoB:
		bne x21, x8, vezDoC
		add x2, x0, x12
		sw x2, b #atualiza o valor de b
		jal x0, contador
	#valor digitado vai para o c
	vezDoC:
		add x3, x0, x12
		sw x3, c
	contador:
		bne x21, x10, zerandox12 #se o contador interno for diferente de 3, o programa passa para recolher o numero da proxima variavel
		bge x1, x0, maiorIgual #aqui comecam as checagens do if mostrado no enunciado
		jal x0, cancela #assim que um dos requisitos falharem(por se tratar de um &&), o programa pula para a funcao cancela
		maiorIgual:
			bge x5, x2, menorIgual
			jal x0, cancela
		menorIgual:
			blt x6, x3, menor
			jal x0, cancela
		menor:
			addi x4, x0, 1 #se todas as checagens forem verdadeiras, o valor de x4(x) eh alterado para 1
			sw x4, x #atualiza o valor de x
			jal x0, prossegue
		cancela:
			add x4, x0, x0
			sw x4, x #atualiza o valor de x
		prossegue:
			add x4, x4, x11 #soma o valor de x4 com o valor de 0 em ASCII
			sb x4, 1024(x0) #printa o valor de x4
			jal x0, zerar #chama a funcao zerar para recolher os proximos valores de a, b e c
fim:
	halt
a: .word 0 
b: .word 0
c: .word 0
x: .word 0
