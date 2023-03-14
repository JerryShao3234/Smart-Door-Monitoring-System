/*
  ESP8266 Blink by Simon Peter
  Blink the blue LED on the ESP-01 module
  This example code is in the public domain

  The blue LED on the ESP-01 module is connected to GPIO1
  (which is also the TXD pin; so we cannot use Serial.print() at the same time)

  Note that this sketch uses LED_BUILTIN to find the pin with the internal LED
*/

// https://github.com/esp8266/Arduino/ - used this repo to get esp8266 drivers
// https://techtutorialsx.com/2016/07/21/esp8266-post-requests/ 

#include <ESP8266HTTPClient.h>
#include <ESP8266WiFi.h>
#include <WiFiClient.h>

int send_request = 1;

void setup() {
  Serial.begin(115200);
//  Serial1.begin(115200, SERIAL_8N1);
  
  WiFi.begin("Simran’s iPhone", "simranwifi");
//  WiFi.begin("ubcvisitor");
  //Wait for the WiFI connection completion
  Serial.println();
  Serial.print("Connecting");
  while (WiFi.status() != WL_CONNECTED)
  {
    delay(500);
    Serial.print(".");
  }
  Serial.println();

  Serial.print("Connected, IP address: ");
  Serial.println(WiFi.localIP());

//  Serial1.println("UART");
  
  pinMode(LED_BUILTIN, OUTPUT);  // Initialize the LED_BUILTIN pin as an output
}

//void setup() {
// 
//  Serial.begin(115200);
// 
//  int numberOfNetworks = WiFi.scanNetworks();
// 
//  for(int i =0; i<numberOfNetworks; i++){
// 
//      Serial.print("Network name: ");
//      Serial.println(WiFi.SSID(i));
//      Serial.print("Signal strength: ");
//      Serial.println(WiFi.RSSI(i));
//      Serial.println("-----------------------");
// 
//  }
// 
//}


// the loop function runs over and over again forever
void loop() {
  char input = char(Serial.read());
  
  if (WiFi.status() == WL_CONNECTED && input == 'a') {
    WiFiClient client;
    HTTPClient http;
//    delay(500);
    Serial.println();
    Serial.println("Sending GET request");
    http.begin(client, "http://155.248.237.255:3000/hardware");

    String postmessage = "{\"key\":\"value\"}";
    
//    http.begin(client, "http://localhost:8000/");
//    http.begin(client, "http://192.168.1.71:8000/");
    http.addHeader("Content-Type", "application/json");
  
//    int httpCode = http.GET();
    int httpCode = http.POST(postmessage);
    String payload = http.getString();

    delay(5000);
    Serial.println(httpCode);
    delay(500);
    Serial.println(payload);
  
    http.end();
    send_request = 0;
//    WiFi.disconnect();
//    Serial.print("Disconnected, IP address: ");
//    Serial.println(WiFi.localIP());
//    Serial.print("b");
  }
//  else {
////    Serial.println("Error in WiFi connection");
//  }
//     if(Serial1.available() > 0){
//        char c = Serial1.read();
//        Serial.println(c, HEX);
//     }
//  if(Serial.available()>0)    //Checks is there any data in buffer 
//  {
//    char input = char(Serial.read());
//    Serial.print(input);  //Read serial data byte and send back to serial monitor
//    
//  }
}
