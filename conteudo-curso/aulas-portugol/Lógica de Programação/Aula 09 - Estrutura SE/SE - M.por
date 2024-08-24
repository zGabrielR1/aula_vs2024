// M) Faça um programa para analisar partidas de futebol, fornecendo o nome das duas equipes 
// e o placar do jogo. O programa deverá exibir na tela quem ganhou o jogo (ou se foi empate) 
// e a situação (Jogo normal ou Goleada).
// Para a situação, considere:
// JOGO NORMAL: Diferença de até no máximo 3 gols entre as equipes;
// GOLEDA: Diferença superior à 3 gols entre as equipes.

programa {
	funcao inicio() {
		cadeia nome_eqp_a, nome_eqp_b
		inteiro gols_eqp_a, gols_eqp_b
		escreva("Informe o nome da primeira equipe: ")
		leia(nome_eqp_a)
		escreva("Informe o nome da segunda equipe: ")
		leia(nome_eqp_b)
		escreva("Informe quantos gols " , nome_eqp_a , " fez: ")
		leia(gols_eqp_a)
		escreva("Informe quantos gols " , nome_eqp_b , " fez: ")
		leia(gols_eqp_b)

		inteiro diferenca
		se (gols_eqp_a > gols_eqp_b) {
			diferenca = gols_eqp_a - gols_eqp_b
			se (diferenca > 3) {
				escreva(nome_eqp_a , " venceu de goleada")
			} senao {
				escreva(nome_eqp_a , " venceu e o placar foi normal")
			}
		} senao se (gols_eqp_b > gols_eqp_a) {
			diferenca = gols_eqp_b - gols_eqp_a
			se (diferenca > 3) {
				escreva(nome_eqp_b , " venceu de goleada")
			} senao {
				escreva(nome_eqp_b , " venceu e o placar foi normal")
			}
		} senao {
			escreva(nome_eqp_a , " empatou com " , nome_eqp_b)
		}
	}
}

/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1008; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */