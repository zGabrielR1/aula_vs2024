// Faça um programa que informa o tempo de viagem necessário entre
// duas cidades, sendo informado a distância (km) e a velocidade média (km/h).

programa
{
	funcao inicio()
	{
		// Variáveis
		real distancia, vel_media, tempo

		// Entrada
		escreva("Informe a distância entre as duas cidades (km): ")
		leia(distancia)
		escreva("Informe a velocidade média durante a viagem (km/h): ")
		leia(vel_media)
		
		// Processamento
		tempo = distancia / vel_media
		
		// Saída
		escreva("O tempo de viagem é de " + tempo + " Horas")
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 3; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */