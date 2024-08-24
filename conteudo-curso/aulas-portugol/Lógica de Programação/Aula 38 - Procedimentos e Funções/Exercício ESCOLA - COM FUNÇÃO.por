programa {
	inclua biblioteca Matematica

	
		/*VARIAVÉIS PUBLICAS*/

	real diario[5][6]
	inteiro linha_registro = 0
	

	funcao logico buscar_aluno(real par_matricula){

		para (inteiro linha = 0; linha < 5; linha++) {
			se (par_matricula == diario[linha][0]) {
				linha_registro = linha
				retorne verdadeiro
			}
		} retorne falso	
	}

	
			funcao inicio() {
				
				real matricula, freq, nota1, nota2, nota3, media
				inteiro opcao
				inteiro qtd_registros = 0
				logico encontrou = falso
				


				
				faca {
					escreva("######### MENU #########\n")
					escreva("[1] Cadastrar Dados no Diário\n")
					escreva("[2] Gerar Média Final\n")
					escreva("[3] Visualizar Diário\n")
					escreva("[4] Verificar Situação do Aluno\n")
					escreva("[5] Encerrar o Programa\n")
					leia(opcao)
		
					limpa()


		
					escolha (opcao) {
						caso 1:
							se (qtd_registros < 5) {
								escreva("Informe a matrícula do aluno: ")
								leia(matricula)
								escreva("Informe a frequência do aluno: ")
								leia(freq)
								escreva("Informe a 1ª nota do aluno: ")
								leia(nota1)
								escreva("Informe a 2ª nota do aluno: ")
								leia(nota2)
								escreva("Informe a 3ª nota do aluno: ")
								leia(nota3)
			
								inteiro linha = qtd_registros
								diario[linha][0] = matricula
								diario[linha][1] = freq
								diario[linha][2] = nota1
								diario[linha][3] = nota2
								diario[linha][4] = nota3
		
								qtd_registros++
		
								limpa()
							} senao {
								escreva("Não é possível cadastrar mais dados no diário!\n")
							}
							
							pare


							
						caso 2:
							// Pegando o número da matrícula do aluno 
							escreva("Informe a matrícula do aluno que deseja gerar a média: ")
							leia(matricula)
		
							limpa()
		
							// Pesquisando a matrícula do aluno na matriz
		
							
				
		
							// Se encontrou a matrícula, pega as notas e calcula a média e armazena na última coluna
							// Senão, comunica o usuário que a mtrícula não existe
							se (buscar_aluno(matricula)) {
								media = (diario[linha_registro][2] + diario[linha_registro][3] + diario[linha_registro][4]) / 3
								diario[linha_registro][5] = Matematica.arredondar(media, 2)
								escreva("Média gerada com sucesso!\n")
							} senao {
								escreva("Matrícula não encontrada!\n")
							}
							
							pare
							

							
						caso 3:
							// Imprimir a matriz na tela
							escreva("Mat\tFreq\tN1\tN2\tN3\tMédia\n")
							escreva("----------------------------------------------\n")
							para (inteiro linha = 0; linha < 5; linha++) {
								para (inteiro coluna = 0; coluna < 6; coluna++) {
									escreva(diario[linha][coluna] , "\t")
								}
								escreva("\n----------------------------------------------\n")
							}
							escreva("\n")
							
							pare


							
						caso 4:
							// Pegando o número da matrícula do aluno 
							escreva("Informe a matrícula do aluno que deseja verificar a situação: ")
							leia(matricula)
		
							limpa()
		
							// Pesquisando a matrícula do aluno na matriz
							
		
							se (buscar_aluno(matricula)) {
								freq = diario[linha_registro][1]
								media = diario[linha_registro][5]
								se (media >= 7 e freq >= 75) {
									escreva("O aluno está aprovado!\n")
								} senao se ((media >= 5 e media < 7) e freq >= 75) {
									escreva("O aluno está em exame!\n")
								} senao {
									escreva("O aluno está reprovado!\n")
								}
							} senao {
								escreva("Matrícula não encontrada!\n")
							}
							
							pare

							
						caso 5:
							escreva("Encerrando o programa...") 
							pare
						caso contrario:
							escreva("Opção inválida! Tente novamente.\n")
					}
				} enquanto (opcao != 5)
			}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1610; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */