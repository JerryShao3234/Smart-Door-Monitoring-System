// Sources and Resources used:
// https://github.com/esp8266/Arduino/ -- used this repo to get esp8266 drivers
// https://arduino-esp8266.readthedocs.io/en/latest/esp8266wifi/readme.html -- used this to connect to Wi-Fi 
// https://techtutorialsx.com/2016/07/21/esp8266-post-requests/ -- used this to see how to make post requests
// https://randomnerdtutorials.com/decoding-and-encoding-json-with-arduino-or-esp8266/ -- used this to decode and encode JSON

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
  
      http.begin(client, "http://155.248.237.255:3000/visit");

      http.addHeader("Content-Type", "application/json");

      String visit = "{\"de1socID\": \"" + de1_soc_id + "\", \"visitor\": \"nothing\", \"intent\": \"" + message + "\", \"img\": \"nothing\"}";
      int httpCode= http.POST(visit);
    
      String payload = http.getString();  
      Serial.println(httpCode);
      Serial.println(payload);
      http.end();

      if(input == 'd') {
        delay(45000);
      }
      
//      Polling Attempt
      payload = "";
      
      http.begin(client, "http://155.248.237.255:3000/pollmessages");

      int count_stop = 0;
      boolean got_message = false;
      
      while(count_stop < 20) {
        http.addHeader("Content-Type", "application/json");
        httpCode = http.POST("{\"de1socID\": \"" + de1_soc_id + "\"}");
        payload = http.getString();

        if(payload == "STOP") {
          count_stop++;
        }
        else {
          payload = payload.substring(1, payload.length() - 1);
          deserializeJson(buf, payload);
          
          String user_message = "<<<<" + String(buf["messageInfo"]) + ">>>>";

          for(int i = 0; i < user_message.length(); i++) {
            char c = user_message.charAt(i);
            Serial.print(c);
            delay(50);
          }

          count_stop = 20;
          got_message = true;
          
        }
        
        delay(3000);
        
      }

      if(got_message == false) {
        String no_message = "<<<<No response received>>>>";
        
        for(int i = 0; i < no_message.length(); i++) {
          char c = no_message.charAt(i);
          Serial.print(c);
          delay(50);
        }   
      }
      
      http.end();
    }
  }
}
