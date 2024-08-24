programa {
	funcao inicio() {
		// ----------------------
		
		// SE SIMPLES
		se (condição) {
			// Fluxo sim
		}

		// ----------------------

		// SE COMPOSTO
		se (condição)  { 
			// FLUXO DO SIM
		} senao {
			// FLUXO DO NÃO
		}
		
		// ----------------------

		// SE ENCADEADO
		se (condição1) {
			// Fluxo 1
		} senao se (condição2) {
			// Fluxo 2
		} senao {
			// Fluxo 3
		}

		// ----------------------
		
		// SE DENTRO DE SE (ANINHADO)
		se (condição1) {
			// Fluxo 1
		} senao se (condição2) {
			// Fluxo 2
			se (condiçãoX) {
				// Fluxo sim
			} senao {	
				// Fluxo não
			}
		} senao se (condição3) {
			// Fluxo 3
		} senao {
			// Fluxo 4
		}

		// ----------------------
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 345; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */