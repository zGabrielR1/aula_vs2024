programa{
	inclua biblioteca Texto
	inclua biblioteca Matematica
	funcao inicio(){
		 
     inteiro opcao, qtd = 0
     real valor, pgt , soma = 0
	cadeia usuario , senha , sn
		
     escreva("LOGIN DO SISTEMA \nINFORME O USUÁRIO ")
	leia(usuario)
	escreva("INFORME A SENHA ")
	leia(senha)
     limpa()

		se(usuario == "operador" e senha == "123abc"){
			escreva("BEM VINDO AO SISTEMA	\n MENU DE OPCÕENS \n ")
			escreva("[1] NOVA VENDA \n [2] SAIR DO SISTEMA \n ")
			leia(opcao)
     		limpa()
		
			 	se(opcao == 1 ou opcao == 2){
					escolha(opcao){
						caso(1):
							faca{
								escreva("VENDA EM ANDAMENTO	\n INFORME O VALOR DO PRODUTO EM R$ ")
								leia(valor)
                					limpa()
								escreva("DESEJA INCLUIR MAIS ALGUM PRODUTO NA VENDA? \n [S] Sim \n [N] NÃO \n")
								leia(sn) sn = Texto.caixa_alta(sn)
                					limpa()
								soma = soma + valor
								qtd++
							}enquanto(sn == "S")	
							escreva("RESUMO DA VENDA \nQUANTIDADE DE PRODUTOS " , qtd , " \nVALOR TOTAL A SER PAGO R$ " , Matematica.arredondar(soma , 2)," \nINFORME O VALOR PAGO PEGO CLIENTE R$ ")
							leia(pgt)
	              				limpa()
								se(pgt < soma){
									escreva("O CLIENTE AINDA DEVE R$ ", soma - pgt)
								}senao se(pgt > soma){
									escreva("O TROCO DO CLIENTE É R$ ", pgt - soma)
								}senao{
									escreva("O VALOR É SUFICIENTE PARA FINALIZAR A VENDA ")
								}
								pare	
							caso(2):
								escreva("SAINDO DO SISTEMA...")
								pare
					} 
				}senao{
					escreva("ESSA OPÇÃO É INVÁLIDA ")
				}
		} senao{
			escreva("USUÁRIO OU SENHA INVÁLIDOS ")
	  }
  }








































 //JHONI NÃO USA DROGAS,A NÃO SER AS NATURAIS!!!!
//#TODOSCOMCANABIS
}

/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 85; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */