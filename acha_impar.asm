@ define constantes
     
     INTERVALO  .equ 0x00011  @ tamanho do vetor 17

_start:
	set r4, 00000001	   @  criei para comparar com r0, que recebe os valores vindo da lista
    set r2,0           @ usado como contador do loop
	
    set r3, 0
                       @ 
                       @ o registrador r3 é usado para contar a quantidade de números negativos 
                       
    set r1, lista      @
                       @ onde se encontram os numeros da lista de forma sequencial

     
	 
loop:  ld r0, [r1]     @ utiliza-se o R0 para guardar o valor lido da lista na memoria
	   and r0 , r4
		
	
       jnz num_impar    @  se o and de cima resultar em 0, então ele é par, indo para o num_par, que por sua vez coloca +1 no contador r3
    
	   jmp zzz			@ jmp zzz acontece caso o and r0, r4 resulte em 1, significando que ele é impar, e portanto não deve ser somado no contador
num_impar: 
     add  r3, 1			@ coloca +1 no contador r3
 zzz:
     add  r1, 4        @ incrementa imediatamente o registrador r1
                       @  assim, r1 ira apontar para nova posicao da lista
                       @  no caso a lista foi feita com espaçamento
                       @  de uma word = 4 bytes
     add  r2, 1				   
     cmp r2 ,INTERVALO @ 
     jge   fim          @ se a ultima iteração foi feita  vá para (fim) hlt   
  
     jmp loop           @ senao continua as iterações voltando para loop:
	 
     fim: hlt           @ termina o programa
     
    lista: .word 39,1,2,-2,9, 1, 3,10,332,-1,19,7,10,-4,2,89,-6