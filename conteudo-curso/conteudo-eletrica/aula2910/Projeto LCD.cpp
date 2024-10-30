const int LM35 = A0;  // Define o pino que lera a saída do LM35
float t;
float h;
int led_verde = 13;
int led_vermelho = 12;
int led_amarelo = 9;

/*
 *Projeto: Mostrador de temperatura e umidade Display LCD 16x2 e modulo I2C
 *Autores: 
 *Aplicação: ler e mostrar no DISPLAY a temperatura.
 *Liguagem de programação: C++
 */
#include <Wire.h>
#include <LiquidCrystal_I2C.h>

// Inicializa o display no endereco 0x27
LiquidCrystal_I2C lcd(0x27, 16, 2);

void setup()
{
  lcd.init();
  Serial.begin(9600);
  Serial.println("Projeto com Display");
  lcd.setBacklight(HIGH);
  pinMode(led_verde, OUTPUT);
  pinMode(led_vermelho, OUTPUT);
  pinMode(led_amarelo, OUTPUT);

}

void loop()
{
  ///// Implementar código do LM35
  Serial.println("////////////////////////////"); 
  t = (float(analogRead(LM35)) * 5 / (1023)) / 0.01;
  if(t <= 25){
    digitalWrite(led_verde, HIGH);
    digitalWrite(led_vermelho, LOW);
    digitalWrite(led_amarelo, LOW);
  } else if(t <= 28) {
    digitalWrite(led_amarelo, HIGH);
    digitalWrite(led_vermelho, LOW);
    digitalWrite(led_verde, LOW);
  } else {
    digitalWrite(led_vermelho, HIGH);
    digitalWrite(led_verde, LOW);
    digitalWrite(led_amarelo, LOW);
  }

  Serial.print("Temperatura: ");
  Serial.println(t);
  lcd.setBacklight(HIGH);
  lcd.setCursor(0, 0);
  lcd.print("      SESI      ");
  lcd.setCursor(0, 1);
  lcd.print("     SENAI      ");
  delay(3000);

  // Display additional messages after "SESI SENAI"
  lcd.clear();
  lcd.setCursor(0, 0);
  lcd.print("PROJETO");
  lcd.setCursor(0, 1);
  lcd.print("DESENVOLVIDO");
  delay(2000);

  lcd.clear();
  lcd.setCursor(0, 0);
  lcd.print("POR");
  delay(1000);

  lcd.clear();
  lcd.setCursor(0, 0);
  lcd.print("KAUANI E");
  lcd.setCursor(0, 1);
  lcd.print("GABRIEL");
  delay(2000);

  lcd.clear();
  lcd.setCursor(0, 0);
  lcd.print("Temp. Amb.:     ");
  lcd.setCursor(0, 1);
  lcd.print(t);
  lcd.setCursor(5, 1);
  lcd.write(B11011111);
  lcd.setCursor(6, 1);
  lcd.print("C");
  delay(4000);

  lcd.setCursor(0, 0);
  lcd.print("Leitura Umidade:");
  lcd.setCursor(0, 1);
  lcd.print(h);
  lcd.print(" %         ");
  delay(2000);
}
