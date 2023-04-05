// https://github.com/esp8266/Arduino/ - used this repo to get esp8266 drivers
// https://techtutorialsx.com/2016/07/21/esp8266-post-requests/ 

#include <ESP8266HTTPClient.h>
#include <ESP8266WiFi.h>
#include <WiFiClient.h>

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
      WiFiClient client;
      HTTPClient http;
  
//        http.begin(client, "http://155.248.237.255:3000/hardware");
      
//      http.begin(client, "http://192.168.1.71:8000/test");
      http.begin(client, "http://172.20.10.2:8000/test");
      http.addHeader("Content-Type", "text/plain");

      
      int httpCode= http.POST(message);
      
      String payload = http.getString();  
      Serial.println(httpCode);
      Serial.println(payload);
    
      http.end();
    }
  }
}
