#dando os valores de entradas possiveis para o programa
addi x1, x0, 0
addi x2, x0, 1 
addi x3, x0, 2
addi x4, x0, 3
addi x5, x0, 4
addi x6, x0, 5
addi x7, x0, 6
addi x8, x0, 7
addi x9, x0, 8
addi x10, x0, 9
#aqui comecam os fatoriais
addi x11, x0, 24 # fatorial de 4
addi x12, x0, 120 # fatorial de 5
lw x13, setecentos # fatorial de 6
lw x14, cincomil # fatorial de 7
lw x15, quarenta # fatorial de 8
lw x16, trinta # fatorial de 9
addi x18, x0, 48 # valor de 0 em ASCII
addi x20, x0, 13 # valor de enter em ASCII
addi x21, x0, 48 # valor de 0 em ASCII
#aqui inicio os valores 10, 100, 1000, 10000, 100000, 1000000 (que serao usados printar a soma dos fatoriais dos numeros)
addi x22, x0, 10
addi x23, x0, 100
lw x24, mil # dou load porque o valor de 1000 eh muito grande para ser usado no addi
lw x25, dezmil
lw x26, cemmil
lw x27, ummilhao
loop:
	lb x17, 1025(x0) # leio o valor digitado
	beq x17, x20, fim # se o valor digitado for enter, pula para o fim
	sub x17, x17, x18 # subtrai o valor de 0 em ASCII para que o valor digitado seja o numero correspondente
	beq x17, x1, zero # se o valor digitado for 0, soma o fatorial de zero
	beq x17, x2, um # se o valor digitado for 1, soma o fatorial de um
	beq x17, x3, dois # se o valor digitado for 2, soma o fatorial de dois
	beq x17, x4, tres # se o valor digitado for 3, soma o fatorial de tres
	beq x17, x5, quatro # se o valor digitado for 4, soma o fatorial de quatro
	beq x17, x6, cinco # se o valor digitado for 5, soma o fatorial de cinco
	beq x17, x7, seis # se o valor digitado for 6, soma o fatorial de seis
	beq x17, x8, sete # se o valor digitado for 7, soma o fatorial de sete
	beq x17, x9, oito # se o valor digitado for 8, soma o fatorial de oito
	beq x17, x10, nove # se o valor digitado for 9, soma o fatorial de nove
	#a partir daqui ocorrem as somas dos fatoriais, armazenados no registrador x19
	zero: 
		add x19, x19, x2   
		jal x0, loop # assim que terminar de somar, volta para o loop e le o proximo numero ate o enter ser pressionado
	um:
		add x19, x19, x2
		jal x0, loop
	dois: 
		add x19, x19, x3
		jal x0, loop
	tres:
		add x19, x19, x7
		jal x0, loop
	quatro: 
		add x19, x19, x11
		jal x0, loop
	cinco:
		add x19, x19, x12
		jal x0, loop
	seis: 
		add x19, x19, x13
		jal x0, loop
	sete:
		add x19, x19, x14
		jal x0, loop
	oito: 
		add x19, x19, x15
		jal x0, loop
	nove:
		add x19, x19, x16
		jal x0, loop
#aqui eh a parte onde ocorre a conversao do valor da soma dos fatoriais para ASCII
#explicacao da logica usada: digamos que voce tenha o valor 632. Apos subtrair 100 dele 6 vezes, voce tera 6 no contador e 32 sobrando. Apos subtrair 10 dele 3 vezes, voce tera 3 no contador e 2 sobrando. Essa foi a forma mais simples que encontrei para fazer a conversao.
fim:
	bge x19, x27, milhao # se o valor da soma dos fatoriais for maior ou igual a 1000000, subtrai 1000000 e soma 1 ao contador, ate o momento em que ele seja menor do que um milhao. Quando isso ocorrer, passe para as centenas de milhar
	add x28, x28, x21 #adiciona 48 ao contador para que ele seja convertido para ASCII
	sb x28, 1024(x0) #printa o contador
	add x28, x0, x0 #zera o contador
	jal x0, p1 #pula para a proxima conversao (centena de milhar)
	milhao:
		sub x19, x19, x27 #subtrai 1000000 do valor da soma dos fatoriais
		addi x28, x28, 1 #soma 1 ao contador
		jal x0, fim #reinicia o loop
	p1:
	bge x19, x26, centenaDeMilhar
	add x28, x28, x21
	sb x28, 1024(x0)
	add x28, x0, x0
	jal x0, p2
	centenaDeMilhar:
		sub x19, x19, x26
		addi x28, x28, 1
		jal x0, p1
	p2:
	bge x19, x25, dezenaDeMilhar
	add x28, x28, x21
	sb x28, 1024(x0)
	add x28, x0, x0
	jal x0, p3
	dezenaDeMilhar:
		sub x19, x19, x25
		addi x28, x28, 1
		jal x0, p2
	p3:
	bge x19, x24, milhar
	add x28, x28, x21
	sb x28, 1024(x0)
	add x28, x0, x0
	jal x0, p4
	milhar:
		sub x19, x19, x24
		addi x28, x28, 1
		jal x0, p3
	p4:
	bge x19, x23, centena
	add x28, x28, x21
	sb x28, 1024(x0)
	add x28, x0, x0
	jal x0, p5
	centena:
		sub x19, x19, x23
		addi x28, x28, 1
		jal x0, p4
	p5:
	bge x19, x22, dezena
	add x28, x28, x21
	sb x28, 1024(x0)
	add x28, x0, x0
	jal x0, p6
	dezena:
		sub x19, x19, x22
		addi x28, x28, 1
		jal x0, p5
	p6:
		add x19, x19, x21 #adiciona 48 ao valor que sobrou no registrador que contem a soma dos fatoriais
		sb x19, 1024(x0) #printa o valor que sobrou
		halt
#aqui inicio as variaveis que serao utilizadas no programa
setecentos: .word 720
cincomil: .word 5040
quarenta: .word 40320
trinta: .word 362880
mil: .word 1000
dezmil: .word 10000
cemmil: .word 100000
ummilhao: .word 1000000

