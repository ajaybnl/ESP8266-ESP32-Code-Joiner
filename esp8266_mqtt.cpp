//MQTT
#include "Adafruit_MQTT.h"
#include "Adafruit_MQTT_Client.h"

<#$#i#$#>
//MQTT
#define AIO_SERVER      "192.168.100.100"
#define AIO_SERVERPORT  1883    // use 8883 for SSL
#define AIO_USERNAME    ""
#define AIO_KEY         ""

//Unique ID for each device
#define CLIENTID "myclient9"

#define FLOW "esp8266"

#define BUTTON1 FLOW "/button1"

#define SENSOR1 FLOW "/sensor1"
#define SENSOR2 FLOW "/sensor2"
#define SENSOR3 FLOW "/sensor3"


//Do not change
#define BUTTON1INIT BUTTON1 "/init"
// My own Retain Script (NODE-RED) Send last value on Reconnect
//More info : https://pastebin.com/WFW7ArSQ


#define mqttdebug true
<#$#v#$#>
//MQTT
WiFiClient client2;
Adafruit_MQTT_Client mqtt(&client2, AIO_SERVER, AIO_SERVERPORT,CLIENTID, AIO_USERNAME, AIO_KEY);

//INPUT ONLY BUTTON1
Adafruit_MQTT_Subscribe button1 = Adafruit_MQTT_Subscribe(&mqtt,BUTTON1);

Adafruit_MQTT_Publish sensor1 = Adafruit_MQTT_Publish(&mqtt,SENSOR1 );
Adafruit_MQTT_Publish sensor2 = Adafruit_MQTT_Publish(&mqtt,SENSOR2 );
Adafruit_MQTT_Publish sensor3 = Adafruit_MQTT_Publish(&mqtt,SENSOR3 );


//Disable if you don't have init on boot feature
Adafruit_MQTT_Publish button1init = Adafruit_MQTT_Publish(&mqtt,BUTTON1INIT );




<#$#s#$#>

<#$#sb#$#>
//MQTT

//Subscribe BEFORE connecting
mqtt.subscribe(&button1);
 
<#$#l#$#>

<#$#lb#$#>

if(mqttconnect()){
//Connected	
}

//MQTT Subscription
Adafruit_MQTT_Subscribe *subscription;
  while ((subscription = mqtt.readSubscription(5000))) {
    if (subscription == &button1) {
     int val=button1.lastread;
	 
    }
  }
  
  
 //MQTT
 int val=analogRead(A0);
    if (mqttconnect()) {
      if (! temp1.publish(val)) {
        if (mqttdebug) Serial.println("MQTT Failed");
      } else {
        if (mqttdebug) Serial.println("MQTT OK!");
      }
    }


<#$#f#$#>
//MQTT
bool mqttconnect() {
  int8_t ret;

  // Stop if already connected.
  if (mqtt.connected()) {
    return (true);
  }

  if (mqttdebug) Serial.print("Connecting to MQTT... ");

  uint8_t retries = 3;
  while ((ret = mqtt.connect()) != 0) { 
    if (mqttdebug) Serial.println(mqtt.connectErrorString(ret));
    if (mqttdebug) Serial.println("Retrying MQTT connection in 5 seconds...");
    mqtt.disconnect();
    delay(2000); 
    retries--;
    if (retries == 0) {
      return (false);
    }
  }
  
	button1init.publish(1);  
	
  
  if (mqttdebug) Serial.println("MQTT Connected!");
}
