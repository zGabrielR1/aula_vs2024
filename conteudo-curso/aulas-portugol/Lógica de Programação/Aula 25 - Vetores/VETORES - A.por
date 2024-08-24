// A) Faça um programa que armazena os seguintes nomes (Teilor, Gustavo, Gabriel, Naiara, Rui, Leocir)
// em um vetor e depois recebe um nome escrito pelo usuário, e procure esse nome no vetor. 
// Se o nome procurado for encontrado, deve exibir uma mensagem "NOME ENCONTRADO", 
// caso contrário "NÃO ENCONTRADO".

programa {
	funcao inicio() {
		cadeia nomes[6] = { "Teilor", "Gustavo", "Gabriel", "Naiara", "Rui", "Leocir" }
		logico encontrou = falso

		cadeia nome
		escreva("Informe um nome para a busca: ")
		leia(nome)
		
		para (inteiro i = 0; i < 6; i++) {
			//se (nome == nomes[i]) {
			//	escreva("NOME ENCONTRADO \n")
			//} senao {
			//	escreva("NÃO ENCONTRADO \n")
			//}

			se (nome == nomes[i]) {
				encontrou = verdadeiro
			}
		}

		se (encontrou) {
			escreva("NOME ENCONTRADO")
		} senao {
			escreva("NÃO ENCONTRADO")
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 469; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */