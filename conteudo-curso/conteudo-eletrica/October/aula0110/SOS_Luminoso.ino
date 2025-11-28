/*
  Programa: SOS Luminoso
  Turma: Téc. Desenvolvimento Sistemas 2ª Fase
  Aluno(a): Gabriel Renostro  
  Data: 01/10/2024
*/


void setup() {    // Configuração
  pinMode(12, OUTPUT);   // Modo de atuação pino 12, Saída
  pinMode(11, OUTPUT);
  pinMode(10, OUTPUT);
}

// função loop
void loop() {
  // Sequência para "S"
  for (int i = 0; i < 1; i++) {
    digitalWrite(12, HIGH);   // Liga
    delay(1000);               // Pisca por 500ms
    // Desliga
    delay(1000);
    digitalWrite(11, HIGH);   // Liga
    delay(800);               // Pisca por 500ms
    // Desliga
    delay(800); // Intervalo entre piscadas curtas
    digitalWrite(10, HIGH);   // Liga
    delay(800);               // Pisca por 500ms
  // Desliga
    delay(800);
  }



  // Intervalo entre repetições do "SOS"

}
