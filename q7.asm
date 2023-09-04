lb x10, 0(x0)
sb x10, 1030(x0)
#aqui passo os valores das variaveis para os registradores
lw x20, quinze 
lw x21, vinte
lw x22, vinteecinco
lw x23, trinta
lw x24, trintaecinco
loop:
	lh x11, 1031(x0) #aqui comeca a leitura
    #aqui eu coloco os valores dos leds em registradores (3, 5, 6, 9, 10, 11)
    addi x1, x0, 3
    addi x2, x0, 5
    addi x3, x0, 6
    addi x4, x0, 9
    addi x5, x0, 10
    addi x6, x0, 11
    addi x7, x0, 254
    add x8, x0, x0
    blt x24, x11, cinco #maior que 35
    blt x23, x11, onze #entre 30 e 35
    blt x22, x11, dez #entre 25 e 30
    blt x21, x11, nove #entre 20 e 25
    blt x20, x11, seis #entre 15 e 20
    #menos que isso fica entre 0 e 15
    jal x0, tres
    tres:
        sb x1, 1033(x0) #aqui informo qual led sera aceso
        sb x7, 1034(x0) #aqui acendo o led
        #aqui eu apago todos os leds fora o que deve estar aceso
        sb x2, 1033(x0)
        sb x0, 1034(x0)
        sb x3, 1033(x0)
        sb x0, 1034(x0)
        sb x4, 1033(x0)
        sb x0, 1034(x0)
        sb x5, 1033(x0)
        sb x0, 1034(x0)
        sb x6, 1033(x0)
        sb x0, 1034(x0)
        jal x0, loop #volta para o inicio da leitura
    cinco:
        sb x2, 1033(x0)
        sb x7, 1034(x0)
        #mesma coisa para todas as outras funcoes
        sb x1, 1033(x0)
        sb x0, 1034(x0)
        sb x3, 1033(x0)
        sb x0, 1034(x0)
        sb x4, 1033(x0)
        sb x0, 1034(x0)
        sb x5, 1033(x0)
        sb x0, 1034(x0)
        sb x6, 1033(x0)
        sb x0, 1034(x0)
        jal x0, loop
    seis:
        sb x3, 1033(x0)
        sb x7, 1034(x0)
        sb x1, 1033(x0)
        sb x0, 1034(x0)
        sb x4, 1033(x0)
        sb x0, 1034(x0)
        sb x5, 1033(x0)
        sb x0, 1034(x0)
        sb x6, 1033(x0)
        sb x0, 1034(x0)
        jal x0, loop
    nove:
        sb x4, 1033(x0)
        sb x7, 1034(x0)
        sb x1, 1033(x0)
        sb x0, 1034(x0)
        sb x3, 1033(x0)
        sb x0, 1034(x0)
        sb x5, 1033(x0)
        sb x0, 1034(x0)
        sb x6, 1033(x0)
        sb x0, 1034(x0)
        jal x0, loop                
    dez:
        sb x5, 1033(x0)
        sb x7, 1034(x0)
        sb x1, 1033(x0)
        sb x0, 1034(x0)
        sb x3, 1033(x0)
        sb x0, 1034(x0)
        sb x4, 1033(x0)
        sb x0, 1034(x0)
        sb x6, 1033(x0)
        sb x0, 1034(x0)
        jal x0, loop
    onze:
        sb x6, 1033(x0)
        sb x7, 1034(x0)
        sb x1, 1033(x0)
        sb x0, 1034(x0)
        sb x3, 1033(x0)
        sb x0, 1034(x0)
        sb x4, 1033(x0)
        sb x0, 1034(x0)
        sb x5, 1033(x0)
        sb x0, 1034(x0)
        jal x0, loop
#peguei os valores de 15, 20, 25, 30 e 35 mostrados no arduino e coloquei em variaveis
quinze: .word 0b0000000100110010
vinte: .word 0b0000000110011001
vinteecinco: .word 0b0000000111111111
trinta: .word 0b0000001001100101
trintaecinco: .word 0b0000001011001100
