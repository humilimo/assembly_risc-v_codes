# 0000 --> 0
# 0001 --> 1
# 0010 --> 2
# 0011 --> 3
# 0100 --> 4
# 0101 --> 5
# 0110 --> 6
# 0111 --> 7
# 1000 --> 8
# 1001 --> 9
# 1111 --> Clear
lw x10, mil #carrega o endereço de mil
lw x11, mileum #carrega o endereço de mil e um
lw x12, milcentoeonze #carrega o endereço de mil cento e onze
#iniciando os valores possiveis em binario
addi x13, x0, 1 
addi x22, x0, 10
addi x23, x0, 11
addi x24, x0, 100
addi x25, x0, 101
addi x26, x0, 110
addi x27, x0, 111
addi x30, x0, 13 #enter
addi x31, x0, 48 #0 em ascii
loop:
    lb x1, 1025(x0) #le o teclado
    beq x1, x30, comparar #lendo enquanto o enter nao for pressionado
    sub x5, x1, x31 #transformando o valor lido em inteiro e passando para x5
    #forma de conseguir multiplicar por 10, fazendo x*2 + x*8
    slli x2, x3, 3 #x*8
	slli x4, x3, 1 #x*2
	add x3, x2, x4 #x*10
	add x3, x3, x5 
    jal x0, loop
    #comparando o valor lido com os valores possiveis
    comparar:
        beq x3, x0, zero #0000
        beq x3, x13, um #0001
        beq x3, x22, dois #0010
        beq x3, x23, tres #0011
        beq x3, x24, quatro #0100
        beq x3, x25, cinco #0101
        beq x3, x26, seis #0110
        beq x3, x27, sete #0111
        beq x3, x10, oito #1000
        beq x3, x11, nove #1001
        beq x3, x12, clear #1111
        #convertendo as possibilidades de print no display de binario para decimal
        #o primeiro valor vai para os pinos de 7 a 2 e o segundo valor vai para o pino 8
        #63 0 --> 0
        #24 0 --> 1
        #54 1 --> 2
        #60 1 --> 3
        #25 1 --> 4
        #45 1 --> 5
        #47 1 --> 6
        #56 0 --> 7
        #63 1 --> 8
        #61 1 --> 9
        #utilizando a = 7, b = 6, c = 5, d = 4, e = 3, f = 2, g = 8
        zero:
            addi x17, x0, 63
            #em 1029 vao os pinos de 2 ao 8 e em 1027 vao os pinos de 8 ao 13
            sb x17, 1029(x0) #escreve no display de 7 segmentos
            sb x0, 1027(x0)
            halt
        um:
            addi x17, x0, 24
            #mesmo da passada e sera utilizado a seguir tambem
            sb x17, 1029(x0)
            sb x0, 1027(x0)
            halt
        dois:
            addi x17, x0, 54
            sb x17, 1029(x0)
            sb x13, 1027(x0)
            halt
        tres:
            addi x17, x0, 60
            sb x17, 1029(x0)
            sb x13, 1027(x0)
            halt
        quatro:
            addi x17, x0, 25
            sb x17, 1029(x0)
            sb x13, 1027(x0)
            halt
        cinco:
            addi x17, x0, 45
            sb x17, 1029(x0)
            sb x13, 1027(x0)
            halt
        seis:
            addi x17, x0, 47
            sb x17, 1029(x0)
            sb x13, 1027(x0)
            halt
        sete:
            addi x17, x0, 56
            sb x17, 1029(x0)
            sb x0, 1027(x0)
            halt
        oito:
            addi x17, x0, 63
            sb x17, 1029(x0)
            sb x13, 1027(x0)
            halt
        nove:
            addi x17, x0, 61
            sb x17, 1029(x0)
            sb x13, 1027(x0)
            halt
        clear:
            sb x0, 1029(x0)
            sb x0, 1027(x0)
            halt
mil: .word 1000
mileum: .word 1001
milcentoeonze: .word 1111