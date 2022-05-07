@ programa que conta a quantidade de valores que foram necessarios para a soma deles serem maior ou igual a 55, dado a lista
	
     
     INTERVALO  .equ 0x0000a  @ tamanho do vetor, ou seja a = 10

     .org 0x10

_start:              
     set r2, 0           @ conta a quantidade de valores para chegar a soma maior ou igual a 55, incluindo o valor que ultrapassou o limite
     set r3, 0           @ sera usado para armazenar as somas sucessivas da lista e saber quando ficou maior ou igual a 55    

     set r1, lista       @ r1 esta apontando para a lista
                         
loop:
     ld r0, [r1]         @ r0 esta recebendo o conteudo na posicao 0x300, ou seja, esta recebendo o valor do primeiro termo da lista
     add r2, 1           @ a cada passada do loop, o contador deve ser adicionado +1 e ele sempre sera igual ou maior que 1    
     add r3, r0          @ r3 sera adicionado pelo conteudo que r1 esta apontando, que esta em r0
       			
     cmp r3, 55          @ compara para saber se r3 esta maior ou igual a 55
     jge fim             @ caso r3 esteja maior ou igual a 55, ele ira para o fim do programa

     add  r1, 4          @ ao adicionar 4 a r1, faz com que r1 comece a apontar para o proximo termo da lista
  
     jmp loop            @ quando a expressao "jge = maior ou igual a que" for FALSE, ou seja, r3 
                         @ ainda nao eh maior que 55, entao volta para o loop

     fim: hlt            @ significa que finaliza o programa
     
     .org 0x300          @ significa que a lista ira ocupar o espaco de memoria 300, e cada valor da lista utiliza 4 bits
                         @ entao a posicao 300 tem o conteudo 9, posicao 304 conteudo 10, posicao 308 conteudo 100...             

lista: .word 9, 10, 100, 50, 7, 17, 15, 0, 33, 8
