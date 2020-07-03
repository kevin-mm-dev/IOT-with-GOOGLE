
#define BLYNK_PRINT Serial
#include <ESP8266WiFi.h>
#include <BlynkSimpleEsp8266.h>
#include <Servo.h>
int MOTOR=2;
Servo servo;

char auth[] = "sEcANG8Lg5IX_SHsKxVpx6Q6HFPfOO4L";
char ssid[] = "INFINITUM4EA684";
char pass[] = "67A4CEF4D6";
void setup()
{
  Serial.begin(9600);
  Blynk.begin(auth, ssid, pass);
  servo.attach(03); // NodeMCU D8 pin
 // pinMode(pin,OUTPUT);
    pinMode(MOTOR, OUTPUT);
 }
  
void loop()
{
  
  Blynk.run();
  
}
BLYNK_WRITE(V1)
{
  
   servo.write(param.asInt());
   Serial.println("Cambiando Estado");
}

BLYNK_WRITE(V2)
{
  servo.write(0);
  analogWrite(MOTOR, 0);
  Serial.println("Cambiando Estado a 0°");
}
BLYNK_WRITE(V3)
{
  servo.write(90);
  analogWrite(MOTOR, HIGH);
  Serial.println("Cambiando Estado a 90°");
}
