programa {
	funcao inicio() {
		cadeia fila[5], nome
		inteiro inicio_fila = 0, fim_fila = 0, opcao

		faca {
			escreva("######## MENU ########\n")
			escreva("[1] Inserir Paciente na Fila\n")
			escreva("[2] Atender Paciente\n")
			escreva("[3] Visualizar Fila\n")
			escreva("[4] Sair\n")
			leia(opcao)

			limpa()

			escolha (opcao) {
				caso 1:
					se (fim_fila == 5) {
						escreva("Fila cheia, não é possível incluir mais pacientes!\n")
					} senao {
						escreva("Informe o nome da pessoa: ")
						leia(nome)
						
						limpa()

						inteiro tipo_atendimento
						escreva("Informe o tipo de Atendimento:\n")
						escreva("[1] Normal\n")
						escreva("[2] Urgente\n")
						leia(tipo_atendimento)

						limpa()
						
						se (tipo_atendimento == 1) {
							fila[fim_fila] = nome
							fim_fila++
						} senao se (tipo_atendimento == 2) {
							para (inteiro i = fim_fila; i > inicio_fila; i--) {
								 fila[i] = fila[i-1]
							}
							fila[inicio_fila] = nome
							fim_fila++
						} senao {
							escreva("Tipo de atendimento inválido!\n")
						}
					}
					pare
				caso 2:
					se (fim_fila == 0) {
						escreva("Fila vazia, não é possível atender nenhum paciente!!\n")
					} senao {
						escreva("Paciente " , fila[inicio_fila] , " foi removido da fila para atendimento\n")
						fim_fila--
						para (inteiro i = 1; i <= fim_fila; i++) {
							fila[i-1] = fila[i] 
						}
						fila[fim_fila] = ""
					}
					pare
				caso 3:
					para (inteiro i = 0; i < fim_fila ; i++) {
						escreva("Posição: " , i+1 , " - Clinte: " , fila[i] , "\n")
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
 * @POSICAO-CURSOR = 732; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {fila, 3, 9, 4}-{nome, 3, 18, 4}-{inicio_fila, 4, 10, 11}-{fim_fila, 4, 27, 8};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */