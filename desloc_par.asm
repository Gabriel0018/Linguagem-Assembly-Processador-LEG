@ programa que conta a quantidade de numeros negativos existentes numa lista com 14 numeros.
	
@ define constantes
     
     INTERVALO  .equ 0x00011  @ tamanho do vetor 17

_start:
    set r2,0           @ usado como contador do loop
	
	
    set r3, 0
                         
                       @ o registrador r3 é usado para saber a quantidade de numeros impares  
                       
    set r1, lista      @
                       @ onde se encontram os numeros da lista de forma sequencial

     
	 
loop:  ld r0, [r1]     @ utiliza-se o R0 para guardar o valor lido da lista na memoria
       shr r0, 1
    
       jnc num_par    @  a compara para saber se o numero é impar
    
	   jmp zzz
num_par: 
     add  r3, 1
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
     
    lista: .word 39,11,2,3,1, 81, 3,10,332,1,19,0,2,4,2,9,6