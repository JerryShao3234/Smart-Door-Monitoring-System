// https://github.com/esp8266/Arduino/ - used this repo to get esp8266 drivers
// https://techtutorialsx.com/2016/07/21/esp8266-post-requests/ 
// https://randomnerdtutorials.com/decoding-and-encoding-json-with-arduino-or-esp8266/

#include <ESP8266HTTPClient.h>
#include <ESP8266WiFi.h>
#include <WiFiClient.h>
#include <ArduinoJson.h>

DynamicJsonDocument buf(200);

String de1_soc_id = "123";

void setup() {
  Serial.begin(115200);
  WiFi.begin("Simran’s iPhone", "simranwifi");
  
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
  
  pinMode(LED_BUILTIN, OUTPUT);  // Initialize the LED_BUILTIN pin as an output
}

// the loop function runs over and over again forever
void loop() {
  if (WiFi.status() == WL_CONNECTED) {
    WiFiClient client;
    HTTPClient http;
      
    if(Serial.available() > 0) {
      char input = char(Serial.read());
      String message = "";
      switch (input) {
        case 'a':
          message = "Family or friend";
          break;
        case 'b':
          message = "Package Delivery";
          break;
        case 'c':
          message = "Advertisement";
          break;
        case 'd':
          message = "Record";
          break;
        default:
          // statements
          break;
      }
//  
      http.begin(client, "http://155.248.237.255:3000/visit");
////      http.begin(client, "http://192.168.1.71:8000/test");
////      http.begin(client, "http://172.20.10.2:8000/test");
//
      http.addHeader("Content-Type", "application/json");

      String visit = "{\"de1socID\": \"" + de1_soc_id + "\", \"visitor\": \"nothing\", \"intent\": \"" + message + "\", \"img\": \"nothing\"}";
      int httpCode= http.POST(visit);
    
      String payload = http.getString();  
      Serial.println(httpCode);
      Serial.println(payload);
      http.end();

//      delay(10000);
//      String test_message = "<My name is Simran and I am here to test the display. This is test displays.>";
//
//      for(int i = 0; i < test_message.length(); i++) {
//        char c = test_message.charAt(i);
//        Serial.print(c);
//        delay(500);
//      }
//      Serial.print(test_message);
      Polling Attempt
      payload = "";
      
      http.begin(client, "http://155.248.237.255:3000/pollmessages");

      int count_stop = 0;
      
      while(count_stop < 10) {
        http.addHeader("Content-Type", "application/json");
        httpCode = http.POST("{\"de1socID\": \"" + de1_soc_id + "\"}");
        payload = http.getString();

        if(payload == "STOP") {
          count_stop++;
        }
        else {
          payload = payload.substring(1, payload.length() - 1);
          deserializeJson(buf, payload);
          
          String user_message = String(buf["messageInfo"]);
          Serial.println("User message: " + user_message);
          count_stop = 0;
        }
        
        Serial.println(httpCode);
        Serial.println(payload);
        delay(3000);
        
      }
      Serial.println("DONE");
      http.end();
    }
  }
}