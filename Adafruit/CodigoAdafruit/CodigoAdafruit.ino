//Viral Science
// www.youtube.com/c/viralscience
//Google Assistant Home Automation
// https://www.youtube.com/watch?v=1goTMGq26wE&list=PLHRCABkBQA5xHaTFqsht7mEY8FhSTv9Vz&index=7&t=375s

#include <ESP8266WiFi.h>
#include "Adafruit_MQTT.h"
#include "Adafruit_MQTT_Client.h"
#include <Servo.h>

Servo servo;
int Relay1 = D4;
#define Relay2 03
#define Relay3 04
#define Relay4 05

#define WLAN_SSID       "INFINITUM4EA684"             // Your SSID
#define WLAN_PASS       "67A4CEF4D6"        // Your password

/************************* Adafruit.io Setup *********************************/

#define AIO_SERVER      "io.adafruit.com" //Adafruit Server
#define AIO_SERVERPORT  1883
#define AIO_USERNAME    "LevinDebin"            // Username
#define AIO_KEY         "6b78cc7928c04bcfa3b7170be6e599bf"   // Auth Key

//WIFI CLIENT
WiFiClient client;

Adafruit_MQTT_Client mqtt(&client, AIO_SERVER, AIO_SERVERPORT, AIO_USERNAME, AIO_KEY);

Adafruit_MQTT_Subscribe Light1 = Adafruit_MQTT_Subscribe(&mqtt, AIO_USERNAME "/feeds/Relay1"); // Feeds name should be same everywhere
Adafruit_MQTT_Subscribe Light2 = Adafruit_MQTT_Subscribe(&mqtt, AIO_USERNAME "/feeds/Relay2");
Adafruit_MQTT_Subscribe Light3 = Adafruit_MQTT_Subscribe(&mqtt, AIO_USERNAME "/feeds/Relay3");
Adafruit_MQTT_Subscribe Light4 = Adafruit_MQTT_Subscribe(&mqtt, AIO_USERNAME "/feeds/Relay4");

void MQTT_connect();
int Ledpin = 16;
void setup() {
  Serial.begin(9600);
  servo.attach(02);
  pinMode(Relay1, OUTPUT);
  pinMode(Relay2, OUTPUT);
  pinMode(Relay3, OUTPUT);
  pinMode(Relay4, OUTPUT);
  pinMode(Ledpin, OUTPUT);
  digitalWrite(Ledpin, LOW);
  // Connect to WiFi access point.
  Serial.println(); Serial.println();
  Serial.print("Connecting to ");
  Serial.println(WLAN_SSID);

  WiFi.begin(WLAN_SSID, WLAN_PASS);
  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }
  Serial.println();

  Serial.println("WiFi connected");
  Serial.println("IP address: ");
  Serial.println(WiFi.localIP());

  mqtt.subscribe(&Light1);
  mqtt.subscribe(&Light3);
  mqtt.subscribe(&Light2);
  mqtt.subscribe(&Light4);
}

void loop() {

  MQTT_connect();

  Adafruit_MQTT_Subscribe *subscription;
  while ((subscription = mqtt.readSubscription(20000))) {

    if (subscription == &Light1) {
      Serial.println(F("Got: "));
      Serial.print((char *)Light1.lastread);
      int Light1_State = atoi((char *)Light1.lastread);
      /*if (Light1_State)
      {
        Serial.println(" Prendiendo habitacion");
        servo.write(90);
      } else
      {
        Serial.println("Apagando habitacion");
        servo.write(0);
      }*/
      Serial.print("Cambiando Estado a ");
      Serial.println(Light1_State);
      Serial.print("Por el pin ");
      Serial.println(Relay1);
      //digitalWrite(Ledpin, Light1_State);
      digitalWrite(Relay1, Light1_State);
    }
    if (subscription == &Light2) {
      Serial.print(F("Got: "));
      Serial.println((char *)Light2.lastread);
      int Light2_State = atoi((char *)Light2.lastread);
      digitalWrite(Relay2, Light2_State);
    }
    if (subscription == &Light3) {
      Serial.print(F("Got: "));
      Serial.println((char *)Light3.lastread);
      int Light3_State = atoi((char *)Light3.lastread);
      digitalWrite(Relay3, Light3_State);
    }
    if (subscription == &Light4) {
      Serial.print(F("Got: "));
      Serial.println((char *)Light4.lastread);
      int Light4_State = atoi((char *)Light4.lastread);
      digitalWrite(Relay4, Light4_State);
    }
  }


}

void MQTT_connect() {
  int8_t ret;

  if (mqtt.connected()) {
    return;
  }

  Serial.print("Connecting to MQTT... ");

  uint8_t retries = 3;

  while ((ret = mqtt.connect()) != 0) {
    Serial.println(mqtt.connectErrorString(ret));
    Serial.println("Retrying MQTT connection in 5 seconds...");
    mqtt.disconnect();
    delay(5000);
    retries--;
    if (retries == 0) {
      while (1);
    }
  }
  Serial.println("MQTT Connected!");

}




/*

  SSID:  INFINITUM4EA684
  Protocolo:  Wi-Fi 4 (802.11n)
  Tipo de seguridad:  WPA2-Personal
  Banda de red: 2.4 GHz
  Canal de red: 6
  Dirección IPv6: 2806:108e:10:4d68:d564:2b2a:11ab:bea1
  fdd1:698:21cc:0:d564:2b2a:11ab:bea1
  Dirección IPv6 local de vínculo:  fe80::d564:2b2a:11ab:bea1%15
  Servidores DNS IPv6:  fdd1:698:21cc:0:200:ff:fe00:0
  Dirección IPv4: 192.168.1.68
  Servidores DNS IPv4:  192.168.1.254
  Lista de búsqueda de sufijos DNS: lan
  Fabricante: Intel Corporation
  Descripción:  Intel(R) Centrino(R) Wireless-N 1030
  Versión del controlador:  15.11.0.9
  Dirección física (MAC): BC-77-37-97-9D-A7


*/
