@ Autores: Vanessa Santos de Andrade | Gabriel Lima Prisco Madureira
@ O programa calcula a multiplicacao de dois binarios de 10 bits!

        @ Programa                              @ Comentarios

_start:
        set r8, 0                @ usado como contador do loop
	
	    set r0,  0x3E8		     @ primeiro numero em binario - 1000 em decimal

	
	    set r10, 0		         @ armazena o valor da soma, que sera o resultado final
	
	    set r1,  0x3B6  	     @ segundo numero em binario - 950 em decimal
	
	
loop:	
		rcr r1, 1                @ testando se é 0 ou 1

        jc desloca               @ se for 1 vai para a etapa desloca
                                 
	    jmp continua		     @ senao vai para a linha continua
			
desloca:                        
		mov r2, r0			     @ carrega o conteudo de r0 para r2(copia)
		shl r2, r8			     @ desloca para a esquerda de acordo com o valor do contador - representa quantidade de "zero"
		add r10, r2		         @ Adiciona o conteudo no r10, que ira sempre somar e guardar o valor final
			
continua:
		add r8, 1			     @ incrementa  em 1 o contador
			
		cmp r8, 11               @ ve se contador ja atingiu o valor 11

		jg fim				     @ se maior, vai para final do programa
			
		jmp loop                 @ senao continua as interações voltando para loop:
	
fim: hlt                         @ fim do programa!