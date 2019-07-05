#include <WiFiClient.h>
<#$#i#$#>
//UBIDOTS
WiFiClient client;

<#$#v#$#>
//UBIDOTS
String var_temperature = "WRITE TOKEN HERE";
String token = "WRITE TOKEN HERE";
<#$#s#$#>
<#$#sb#$#>
<#$#l#$#>
<#$#lb#$#>
//UBIDOTS
/***************************
* UBIDOTS Upload Data
*
*if (ubidotsupload(var_temperature, Value)) {
*      //Done
*    } else {      
*      //Fail
*    }
****************************/
<#$#f#$#>
//UBIDOTS
bool ubidotsupload(String idvariable, float value) {
  bool done = false;
  
  if (WiFi.status() == WL_CONNECTED){
  
  int num = 0;
  String var = "{\"value\": " + String(value) + "}";
  num = var.length();
  if (client.connect("things.ubidots.com", 80)) {
    delay(200);
    client.println("POST /api/v1.6/variables/" + idvariable + "/values HTTP/1.1");
    client.println("Content-Type: application/json");
    client.println("Content-Length: " + String(num));
    client.println("X-Auth-Token: " + token);
    client.println("Host: things.ubidots.com\n");
    client.print(var);
    delay(200);
    done = true;
  } else {
    done = false;
  }

  if (!client.connected()) {
    client.stop();
  }
  delay(100);
  
  }
  return (done);
}