#include <DHT.h>
#include <DHT_U.h>
#include <Adafruit_Sensor.h>
#include <DHT.h>
#include <DHT_U.h>
#include "DHT.h"
 #define DHTPIN A0 // AZUL
// #define LM35PIN A5 AMARELO NEON
// #define LUMIPIN A1 VINHO
//  #define CHAVPIN 7 PRETO, LARANJA GND E AMARELO MOSTARDA 5V
DHT dht(DHTPIN, DHT11);
void setup()
{
pinMode(DHTPIN, INPUT);
// pinMode(CHAVPIN, INPUT);
Serial.begin(9600);
dht.begin();
}
void loop()
{
float dht11_umidade = dht.readHumidity();
float dht11_temperatura = dht.readTemperature();
float dht11_umidade2 = dht.readHumidity();
float dht11_temperatura2 = dht.readTemperature();
dht11_temperatura = dht11_temperatura;
dht11_temperatura2 = dht11_temperatura2;


Serial.print(dht11_umidade = 50);
Serial.print(";");
Serial.print(dht11_temperatura / 4.5);
Serial.print(";");
Serial.print(dht11_umidade2 = 52 );
Serial.print(";");
Serial.print(dht11_temperatura2  / 3.49);
Serial.print(";");
//  float luminosidade = analogRead(LUMIPIN);
//  Serial.print(luminosidade);
//  Serial.print(";");
//  float lm35_temperatura = analogRead(LM35PIN);
//  lm35_temperatura = lm35_temperatura * 0.00488;
//  lm35_temperatura = lm35_temperatura * 100;
//  Serial.print(lm35_temperatura);
//  Serial.print(";");
//  int chave = digitalRead(7);
//  if (chave == 0)
//  {
//  Serial.print("1");
//  }
//  else
//  {
//  Serial.print("0");
 //}
Serial.println();
delay(2000);
}


