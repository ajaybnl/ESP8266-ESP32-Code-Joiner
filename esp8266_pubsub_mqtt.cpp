//MQTT
#include <PubSubClient.h>

//i-
//MQTT
const char* MQTTSERVER = "192.168.100.101";
const int   MQTTPORT	   =        1883;

WiFiClient espClient;

PubSubClient mqtt(espClient);
//v-
//MQTT

//ClientID will be auto generated on start

//MCU
#define FLOW "sensors/esp8266"

#define BUTTON1 FLOW "/button1"

#define SENSOR1 FLOW "/sensor1"
#define SENSOR2 FLOW "/sensor2"
#define SENSOR3 FLOW "/sensor3"

//enable serial debug
#define mqttdebug true

long mqtttimer = 0;

//will receive button value from subscription
int button1val=0;


//s-

//sb-
//MQTT
mqtt.setServer(MQTTSERVER, MQTTPORT);
mqtt.setCallback(mqttcallback);
if(mqttdebug) Serial.println("Started");
randomSeed(micros());
 
//l-

//lb-
 if (!mqtt.connected()) {
    mqttconnect();
  }
  
  mqtt.loop();

  
  if(((millis()-mqtttimer)/1000)>3){

  int val=0;
  
  //Read Analog Input
  val=analogRead(0);
  
  //Send Value to Mqtt
	char msg[10];    
    snprintf(msg, 10, "%2d", val);  
	 mqtt.publish(SENSOR1, msg);    
	mqtttimer=millis();
  }

 //buttonval1 is button state
 


//f-
//MQTT


void mqttcallback(char* topic, byte* payload, unsigned int length) {
if(mqttdebug){
Serial.println(topic);
if(strcmp(topic,BUTTON1)==0){
 button1val=atoi((char*)payload);
 Serial.print("Button1: ");
 Serial.println(button1val);
 }
}
}

void mqttconnect() {
  int tries=0;
  while (!mqtt.connected()) {
    String mqttId = "ESP8266mqtt-";
    mqttId += String(random(0xffff), HEX);
        if (mqtt.connect(mqttId.c_str())) {
			
			// My own Retain Script (NODE-RED) Send last value on Reconnect
			//More info : https://pastebin.com/WFW7ArSQ

			mqtt.publish(BUTTON1 "/init","1");
			
			
			mqtt.subscribe(BUTTON1);
			
		}else{tries++; if(tries>10)return;}
    delay(2000);
    }
  }
  
char* convchar(int value){
	char msg[10];    
    snprintf(msg, 10, "%ld", value);	
	return(msg);
}

char* convchar(float value){
	char msg[10];    
    snprintf(msg, 10, "%ld", value);	
	return(msg);
}
