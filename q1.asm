#levando os valores contido nas variaveis a e b para os registradores x10 e x11 respectivamente
lw x10, a #x10 = a
lw x11, b  #x11 = b
add x12, x0, x10 #x12 = x10
beq x11, x12, bmenosa #se x11 = x12, vai para bmenosa
sub x12, x10, x11 #x12 = x10 - x11
sw x12, m #atualizando o valor de m
jal x0, fim #pule para o fim
bmenosa:
	sub x12, x11, x10 #x12 = x11 - x10
	sw x12, m #atualizando o valor de m
fim:
	halt #encerra o programa
#inicia as variaveis
a: .word 5
b: .word 9
m: .word 0
