// O) Faça um programa que armazena os seguinte valores (1, 2, 3, 4, 5, 6, 7, 8, 9, 10) em um vetor 
// e depois misture os valores e imprima o vetor coms os valores misturados. 
// (Para a lógica deste programa utilize a função Sorteia da biblioteca Util)

programa {
	inclua biblioteca Util
	funcao inicio() {
		inteiro valores[10] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10}, auxiliar, j
		para (inteiro i = 0; i < 10; i++) {
			j = Util.sorteia(0, 9)
			auxiliar = valores[i]
			valores[i] = valores[j]
			valores[j] = auxiliar
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 410; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {valores, 8, 10, 7};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */