// G) Faça um programa para calcular e informar o IMC de uma pessoa, 
// sendo informado pelo usuário a altura (m) e o peso (kg).
// FÓRMULA: imc = peso / altura²
// SITUAÇÕES:
// Abaixo do peso: imc abaixo de 18
// Peso normal: imc entre 18 e 25
// Sobrepeso: imc entre 25 e 30
// Obesidade I: imc entre 30 e 35
// Obesidade II: imc entre 35 e 40
// Obesidade mórbida: imc acima de 40

programa {
	inclua biblioteca Matematica
	
	funcao inicio() {
		real altura, peso
		escreva("Informe qual é a sua altura (m): ")
		leia(altura)
		escreva("Informe qual é o seu peso (kg): ")
		leia(peso)

		real imc = peso / Matematica.potencia(altura, 2)

		se (imc < 18) {
			escreva("Abaixo do peso")
		} senao se (imc >= 18 e imc < 25) {
			escreva("Peso normal")
		} senao se (imc >= 25 e imc < 30) {
			escreva("Sobrepeso")
		} senao se (imc >= 30 e imc < 35) {
			escreva("Obesidade I")
		} senao se (imc >= 35 e imc < 40) {
			escreva("Obesidade II")
		} senao {
			escreva("Obesidade mórbida")
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 641; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */