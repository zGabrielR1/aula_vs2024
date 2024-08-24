programa {
	funcao inicio() {
		inteiro pilha[5], cod_container, container_removido
		inteiro topo = 0, opcao

		faca {
			escreva("######## MENU ########\n")
			escreva("[1] Inserir Container na Pilha\n")
			escreva("[2] Remover Container da Pilha\n")
			escreva("[3] Visualizar a Pilha de Containers\n")
			escreva("[4] Sair\n")
			leia(opcao)

			limpa()

			escolha (opcao) {
				caso 1:
					se (topo == 5) {
						escreva("Pilha cheia, não é possível incluir mais containers!\n")
					} senao {
						logico validou = verdadeiro
						faca {
							escreva("Informe o Código do Container: ")
							leia(cod_container)
	
							para (inteiro i = 0; i < topo; i++) {
								se (pilha[i] == cod_container) {
									validou = falso
								}
							}
	
							se (validou) {
								pilha[topo] = cod_container
								topo++
							} senao {
								escreva("Este container já está na pilha! Por favor informe outro código.\n")
							}
						} enquanto (nao validou) 
					}
					pare
				caso 2:
					se (topo == 0) {
						escreva("Pilha vazia, não é possível remover nenhum container!\n")
					} senao {
						container_removido = pilha[topo-1]
						escreva("Container de código " , container_removido , " foi removido com sucesso!\n")
						topo--
						pilha[topo] = 0
					}
					pare
				caso 3:
					para (inteiro i = 0; i < topo; i++) {
						escreva("Posição: " , i+1 , " - Container: " , pilha[i] , "\n")
					}
					pare
				caso 4:
					escreva("Saindo do programa...")
					pare
				caso contrario:
					escreva("Opção inválida! Tente novamente.\n")
			}
		} enquanto (opcao != 4)
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1026; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {pilha, 3, 10, 5};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */