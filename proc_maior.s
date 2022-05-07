@ programa para procurar o maior de uma lista de numeros
	
@ define constantes
     
     INTERVALO  .equ 0x0000a  @ tamanho do vetor

     .org 0x10
_start:
     set r2,INTERVALO -1
                       @ são necessários INTERVALO -1 comparações
                       @ para descobrir o maior valor de uma lista 
                       @ de tamanho INTERVALO
                       @ o registrador r2 é usado como contador 
                       @ que deve ser decrementado a cada passada pelo loop

     set r1, lista     @ 0x300 posicao inicial da memoria
                       @ onde se encontram os numeros da lista de forma sequencial

                       @ chute do algoritmo
                       @ o primeiro valor da lista possui o maior valor
     ld r0,  [r1]      @ utiliza-se o R0 para guardar o maior valor
     add  r1, 4        @ r1 estara apontando agora para o segunda posição da lista
loop:
     ld   r3, [r1]     @ carrega em r3 conteudo da memoria apontada por [r1]

     cmp r0 , r3       @ compara os conteudos de R0 e R3
                       @ se o valor de r3 for maior que o valor de r0
     jg nao_troca      @ então o conteudo de r3 deve ser colocado em R0
     mov r0, r3 
nao_troca: 
     add  r1, 4        @ incrementa imediatamente o registrador r1
                       @  assim, r1 ira apontar para nova posicao da lista
                       @  no caso a lista foi feita com espaçamento
                       @  de uma word = 4 bytes
     sub  r2, 1        @ r2 é decrementado, controla o numero de passadas
     jz   fim          @ se a ultima operação chegou a zero => 
	                   @ acabou o loop e vai para o fim
  
     jmp loop           @ senao continua as iterações voltando para loop:
     fim: hlt           @ termna op programa
     
     .org 0x300
lista: .word 9,1,2,10,3, 87, 15,0,33,8
     
