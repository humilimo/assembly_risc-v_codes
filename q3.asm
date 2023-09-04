addi x10, x0, 3
addi x11, x0, 4 #escolhendo valores arbitrarios
srli x12, x10, 8 #movendo 8 bits para a direita a fim de colocar 0s no final
slli x12, x12, 24 #movendo 24 bits para a esquerda a fim de colocar 0s no inicio, deixando somente os 8 bits que nos interessam
srli x11, x11, 8 #movendo 8 bits para esquerda e para a direita para zerar os bits 31 a 24
slli x11, x11, 8
add x11, x12, x11  #somando os valores para obter o valor final, mesma coisa que um or logico
#quando o x12 tiver 1 o x11 vai ficar com 1, quando o x12 tiver 0 o x11 vai ficar com 0
