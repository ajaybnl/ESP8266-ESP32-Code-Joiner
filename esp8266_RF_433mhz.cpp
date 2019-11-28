#include <RCSwitch.h>

//i-
//RF
RCSwitch mySwitch = RCSwitch();
//v-
//RF

  
#define rfdebug true
//s-
//sb-
//RF

 mySwitch.enableReceive(digitalPinToInterrupt(4)); //GPIO 4 on ESP8266 (not for esp32)
//l-
//RF
 
 //Read RF Code
 int datar[2];
  if(rfdatain(datar)){
    int rfapp=datar[0];
    int rfdata=datar[1];

	if(rfdebug){
 Serial.print("RF App = ");
 Serial.println(rfapp);
 Serial.println("");
 Serial.print("RF Data = ");
 Serial.println(rfdata);
 Serial.println("");
 }
 
    }
	
 
 
 
 /* 
 
	Rf is categorise in app and data segment
	RF IN 33 will give rfapp=0 and rfdata = 33
	..
	RF IN 101 will give rfapp=1 and rfdata = 1
	RF IN 109 ..   ..   rfapp=1 and rfdata = 9
	..
	RF IN 1001 will give rfapp=10 and rfdata = 1
	RF IN 1050 ... ... ..rfapp=10 and rfdata = 50
	
	This system is built for multiple rf applications can use single RF to esp8266 mqtt bridge.

(Example):
Outdoor Temp Sensor:

RF Sent: 131 , ESP8266 Read: App=1 , Data= 31 Degree Celcius	
RF Sent: 244 , ESP8266 Read: App=2 , Data= 44 % Humidity


Your Indoor Temp Sensor :

RF Sent: 325 , ESP8266 Read: App=3 , Data= 25 Degree Celcius	
RF Sent: 445 , ESP8266 Read: App=4 , Data= 45 % Humidity

NOTE: 

Min , Max Data Values:0, 99

Min,  Max APP Number :0, 167772

 */
 
//lb-
//f-
//RF
bool rfdatain(int values[]) {
bool datain=false;
  if (mySwitch.available()) {
    
    unsigned long val = mySwitch.getReceivedValue();
 

    //Find RF APP Number[0-99] & Data[0-99)
    int app = -1;
    if (val > 0) {
      for (int i = 0; i < 10000; i = i + 100) {
        app++;
       if (match(val, i, i + 99)) {
          values[0] = app;
          values[1] = val - (app*100);
      datain=true;
          break;
        }
      }   
    }
    mySwitch.resetAvailable();
  }
  return(datain);
}

bool match(int val, int minimum, int maximum)
{
  return ((minimum <= val) && (val <= maximum));
}