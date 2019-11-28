//httpclient
#include <ESP8266HTTPClient.h>
//i-
//httpclient
#define mypispace_api "API_HERE"
//v-
//s-
//sb-
//l-
//lb-
//httpclient
//Send adc value as "VariableName" to mypi.space
senddata(mypispace_api,"VariableName",analogRead(0));
//f-



//Send Data to Cloud
void senddata(char* api, char* name, float value) {
  HTTPClient http;

  int BUF_SIZE = 100;
  char message[BUF_SIZE];

  snprintf(message, BUF_SIZE, "http://mypi.space/chart.php/?api=%s&name=%s&value=%f", api, name, value);
  //Serial.println(message);
  http.begin(message); //HTTP
  int httpCode = http.GET();
  if (httpCode > 0) {
    if (httpCode == HTTP_CODE_OK) {
      // String payload = http.getString();
    }
  }
  http.end();
}
