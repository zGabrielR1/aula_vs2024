// J) A jornada de trabalho semanal de um funcionário é de 40 horas. 
// O funcionário que trabalhar mais de 40 horas receberá hora extra, 
// cujo cálculo é o valor da hora regular com um acréscimo de 50%. 
// Escreva um programa que leia o número de horas trabalhadas em um mês, 
// o salário por hora e escreva o salário total do funcionário, 
// que deverá ser acrescido das horas extras, caso tenham sido trabalhadas 
// (considere que o mês possua 4 semanas exatas).

programa {
	funcao inicio() {
		real total_horas, valor_hora_normal
		escreva("Informe o total de horas trabalhadas no mês pelo funcionário: ")
		leia(total_horas)
		escreva("Informe o valor da hora do funcionário: ")
		leia(valor_hora_normal)

		real salario_normal = valor_hora_normal * 160

		se (total_horas > 160) {
			real horas_extras = total_horas - 160
			real valor_hora_extra = valor_hora_normal * 1.5
			real salario_final = salario_normal + (valor_hora_extra * horas_extras)
			escreva("O salário do funcionário será R$ " , salario_final)
		} senao {
			escreva("O salário do funcionário será R$ " , salario_normal)
		}		
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 718; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */