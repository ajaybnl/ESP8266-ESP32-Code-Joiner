//MQTT
#include "Adafruit_MQTT.h"
#include "Adafruit_MQTT_Client.h"

<#$#i#$#>
//MQTT
#define AIO_SERVER      "192.168.100.17"
#define AIO_SERVERPORT  1883    // use 8883 for SSL
#define AIO_USERNAME    ""
#define AIO_KEY         ""
#define PROJECT_NAME "esp8266/temp3"

<#$#v#$#>
//MQTT
WiFiClient client;
Adafruit_MQTT_Client mqtt(&client, AIO_SERVER, AIO_SERVERPORT, AIO_USERNAME, AIO_KEY);
Adafruit_MQTT_Publish temp1 = Adafruit_MQTT_Publish(&mqtt,PROJECT_NAME );

bool mqttdebug = false;
<#$#s#$#>

<#$#sb#$#>
//MQTT
mqttconnect(true);
<#$#l#$#>

<#$#lb#$#>

 //MQTT
 int val=analogRead(A0);
    if (mqttconnect(false)) {
      if (! temp1.publish(val)) {
        if (mqttdebug) Serial.println("MQTT Failed");
      } else {
        if (mqttdebug) Serial.println("MQTT OK!");
      }
    }


<#$#f#$#>
//MQTT
bool mqttconnect(bool se) {
  int8_t ret;

  // Stop if already connected.
  if (mqtt.connected()) {
    return (true);
  }

  if (mqttdebug) Serial.print("Connecting to MQTT... ");

  uint8_t retries = 3;
  while ((ret = mqtt.connect()) != 0) { // connect will return 0 for connected
    if (mqttdebug) Serial.println(mqtt.connectErrorString(ret));
    if (mqttdebug) Serial.println("Retrying MQTT connection in 5 seconds...");
    mqtt.disconnect();
    delay(5000);  // wait 5 seconds
    retries--;
    if (retries == 0) {
      // basically die and wait for WDT to reset me
      return (false);
    }
  }

  if (mqttdebug) Serial.println("MQTT Connected!");
}
