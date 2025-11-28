const int LM35 = A0;  // Define o pino que lera a saída do LM35
float temperatura;    // Variável que armazenará a temperatura medida
int led_verde = 13;
int led_vermelho = 12;
int led_amarelo = 9;

//Função que será executada uma vez quando ligar ou resetar o Arduino
void setup() {
  Serial.begin(9600);  // inicializa a comunicação serial

  pinMode(led_verde, OUTPUT);
  pinMode(led_vermelho, OUTPUT);
  pinMode(led_amarelo, OUTPUT);


}

//Função que será executada continuamente
void loop() {
  temperatura = (float(analogRead(LM35)) * 5 / (1023)) / 0.01;
  Serial.print("Temperatura: ");
  Serial.println(temperatura);


if(temperatura <= 25){

  digitalWrite(led_verde, HIGH);
  digitalWrite(led_vermelho, LOW);
  digitalWrite(led_amarelo, LOW);


}else if(temperatura <= 28){
digitalWrite(led_amarelo, HIGH);
  digitalWrite(led_vermelho, LOW);
  digitalWrite(led_verde, LOW);


}else{
  digitalWrite(led_vermelho, HIGH);
  digitalWrite(led_verde, LOW);
  digitalWrite(led_amarelo, LOW);

}





  delay(1000);
}