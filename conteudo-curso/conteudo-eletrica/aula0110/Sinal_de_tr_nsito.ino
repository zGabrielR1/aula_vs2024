/*
  Programa: SOS Luminoso
  Turma: Téc. Desenvolvimento Sistemas 2ª Fase
  Aluno(a): Gabriel Renostro  
  Data: 01/10/2024
*/


void setup() {
  pinMode(12, OUTPUT); // Pino para a luz verde
  pinMode(11, OUTPUT); // Pino para a luz amarela
  pinMode(10, OUTPUT); // Pino para a luz vermelha
}

void loop() {
  // Ciclo do semáforo

  // Luz verde acesa
  digitalWrite(12, HIGH); // Liga a luz verde
  delay(5000);            // Mantém a luz verde acesa por 5 segundos
  digitalWrite(12, LOW);  // Desliga a luz verde

  // Luz amarela acesa
  digitalWrite(11, HIGH); // Liga a luz amarela
  delay(2000);            // Mantém a luz amarela acesa por 2 segundos
  digitalWrite(11, LOW);  // Desliga a luz amarela

  // Luz vermelha acesa
  digitalWrite(10, HIGH); // Liga a luz vermelha
  delay(5000);            // Mantém a luz vermelha acesa por 5 segundos
  digitalWrite(10, LOW);  // Desliga a luz vermelha
}


  // Intervalo entre repetições do "SOS"

}
