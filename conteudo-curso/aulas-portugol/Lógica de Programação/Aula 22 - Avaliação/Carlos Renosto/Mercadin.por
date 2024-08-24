programa
{
	inclua biblioteca Texto
	inclua biblioteca Matematica
	funcao inicio(){
		cadeia user, senha
		escreva("######## LOGIN DO SISTEMA ########\nInforme o Usuário: ")	
		leia(user)
		escreva("Informe a senha: ")	
		leia(senha)
		limpa()
		real valor, valor_total=0
		real contador = 0
		inteiro qtd_produtos 
		real valor_pagar
		real valor_pago
		inteiro prod=0
		se(user == "operador" e senha == "123abc"){
			escreva("### BEM VINDO AO SISTEMA!### \n MENU DE OPÇÕES\n")
			cadeia opcao2
			inteiro opcao
			escreva("[1] Nova Venda \n")
			escreva("[2] Sair do Sistema \n")
			leia(opcao)
			limpa()

			escolha (opcao){
				caso 1:
					faca{
						escreva("####VENDA EM ANDAMENTO####\nInforme o valor do produto: R$ ")
						leia(valor)
						limpa()
						valor_total=valor_total+valor
						prod++
						contador++
						escreva("Deseja incluir mais um produto na venda?")
						escreva("\n [S] Sim")
						escreva("\n [N] Não","\n")
						leia(opcao2)
						opcao2 = Texto.caixa_alta(opcao2)
					}enquanto (opcao2 == "S" ou opcao2 == "SIM")
						limpa()
						escreva("###RESUMO DA VENDA VENDA###")
						escreva("\n Quantidade de produtos: ", prod)
						escreva("\n Valor a ser pago: R$", Matematica.arredondar(valor_total, 2))
						escreva("\n Informe valor pago pelo cliente:  R$")
						leia (valor_pago)
						limpa()
						real troco = Matematica.arredondar(valor_pago-valor_total , 2)
							se (valor_pago < valor_total){
								escreva("O cliente ainda deve: R$", Matematica.arredondar(troco, 2 ))
							} senao se (valor_pago > valor_total){
								escreva("O troco do cliente é de: R$", Matematica.arredondar(troco, 2 ))
							}senao {
							escreva("Valor suficiente para finalizar a venda. Venda Finalizada")}
					pare
				caso 2: 
					escreva("Saindo do sistema...")
					pare
				caso contrario:
					escreva("Opção Invalida!")
			}	
		}senao{
			escreva("Usuário ou Senha Inválidos")}
  }
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1403; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */