programa
{
	inclua biblioteca Texto
	inclua biblioteca Matematica
	
	funcao inicio()
	{
		cadeia usuario,senha,sn
		real valor, soma=0, pgt
		inteiro opcao, qtd=0
		escreva("####### LOGIN DO SISTEMA #######\nInforme o Usuário: ")
		leia(usuario)
		escreva("Informe a Senha: ")
		leia(senha)limpa()

		se (usuario=="operador" e senha=="123abc"){
			escreva("#######	BEM VINDO AO SISTEMA	#######\n#######	MENU DE OPÇÕES	#######\n")
			escreva("[1] Nova Venda\n[2] Sair do Sistema\n\n")
			leia(opcao)limpa()
		
				se(opcao==1 ou opcao==2){
					escolha (opcao){
						caso(1):
							faca{
								escreva("#######	VENDA EM ANDAMENTO	#######\nInforme o valor do produto: R$")
								leia(valor)limpa()
								escreva("#######	Deseja incluir mais um produto na venda?	#######\n[S] Sim\n[N] Não\n\n")
								leia(sn) sn = Texto.caixa_alta(sn)limpa()
								soma = soma+valor
								qtd++
							}enquanto(sn=="S")	

							escreva("#######	RESUMO DA VENDA	#######\nQuantidade de Produtos: ",qtd,"\nValor Total a ser Pago: R$",Matematica.arredondar(soma, 2),"\nInforme o Valor Pago pelo Cliente: R$")
							leia(pgt)limpa()

							se(pgt<soma){
								escreva("O cliente ainda deve: R$",soma-pgt)
							}senao se(pgt>soma){
								escreva("O Troco do Cliente é: R$",pgt-soma)
							}senao{
								escreva("Valor Suficiente para Finalizar a venda. Venda Finalizada")
							}
							
							pare	
						caso(2):
							escreva("Saindo Do Sistema...")
							pare
					} 
				}senao{
					escreva("Opção Inválida!")
				}
			
		} senao{
			escreva("Usuário ou Senha Inválidos")
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1131; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */