// X) Faça um programa que leia o peso de um indivíduo na Terra e converta para o peso equivalente 
// em outro planeta conforme a escolha do usuário. Considere as opções abaixo:
// PLANETA		GRAVIDADE
// Mercúrio: 		0,37
// Vênus: 		0,88
// Marte: 		0,38
// Júpiter: 		2,64
// Saturno: 		1,15
// Urano: 		1,17
// Formula para o cálculo do peso em outro planeta, 
// considerando a gravidade relativa de cada um deles é:
// Peso no planeta = Peso na terra * gravidade

programa {
	funcao inicio() {
		real peso_terra
		escreva("Informe o seu peso (kg) na terra? ")
		leia(peso_terra)

		inteiro opcao
		escreva("Informe o planeta que deseja saber o peso: ")
		escreva("[1] Mercúrio \n")
		escreva("[2] Vênus \n")
		escreva("[3] Marte  \n")
		escreva("[4] Júpiter  \n")
		escreva("[5] Saturno  \n")
		escreva("[6] Urano  \n")
		leia(opcao)

		real gravidade
		escolha (opcao) {
			caso 1:
				gravidade = 0.37
				pare
			caso 2:
				gravidade = 0.88
				pare
			caso 3:
				gravidade = 0.38
				pare
			caso 4:
				gravidade = 2.64
				pare
			caso 5:
				gravidade = 1.15
				pare
			caso 6:
				gravidade = 1.17
			caso contrario:
				gravidade = 0
		}

		real peso_planeta = peso_terra * gravidade

		escreva("O seu peso no paneta escolhido é " , peso_planeta , "kg")
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1112; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */