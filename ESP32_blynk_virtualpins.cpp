//BLYNK
#include <BlynkSimpleEsp32.h>
//i-
//BLYNK
char auth[] = "AUTH CODE HERE";


//v-
//BLYNK
int vpin0 = 0;
int vpin1 = 0;
int vpin2 = 0;
int vpin3 = 0;
int vpin4 = 0;
int vpin5 = 0;
int vpin6 = 0;
int vpin7 = 0;
int vpin8 = 0;
int vpin9 = 0;
int vpin10 = 0;


unsigned long timerblynk = 0;

//s-



//sb-
 //BLYNK
  blynkconn();



//l-
  Blynk.run();

//lb-
//BLYNK
/*
Write Blynk:

Blynk.virtualWrite(v[0-10] (eg: v2), value);

*/

//Check Blynk Connectivity every 1 Minute
if(((millis()-timerblynk)/1000)>60){

blynkconn();

timerblynk=millis();
}

	

//f-
//BLYNK

void blynkconn() {
//If not connected: Connect
  if (!Blynk.connected()) {
    Blynk.begin(auth, "", "");
  }
}


BLYNK_CONNECTED() {
//Load Pins after lost connection
  Blynk.syncAll();
}


//Read Virtual Pin Values as vpinx variables
BLYNK_WRITE(V0)
{
  int pinValue = param.asInt(); 
  vpin0 = pinValue;
  
}

BLYNK_WRITE(V1)
{
  int pinValue = param.asInt(); 
  vpin1 = pinValue;
  
}

BLYNK_WRITE(V2)
{
  int pinValue = param.asInt(); 
  vpin2 = pinValue;
  
}

BLYNK_WRITE(V3)
{
  int pinValue = param.asInt(); 
  vpin3 = pinValue;
  
}

BLYNK_WRITE(V4)
{
  int pinValue = param.asInt(); 
  vpin4 = pinValue;
  
}

BLYNK_WRITE(V5)
{
  int pinValue = param.asInt(); 
  vpin5 = pinValue;
  
}
BLYNK_WRITE(V6)
{
  int pinValue = param.asInt(); 
  vpin6 = pinValue;
  
}
BLYNK_WRITE(V7)
{
  int pinValue = param.asInt(); 
  vpin7 = pinValue;
  
}
BLYNK_WRITE(V8)
{
  int pinValue = param.asInt(); 
  vpin8 = pinValue;
  
}
BLYNK_WRITE(V9)
{
  int pinValue = param.asInt(); 
  vpin9 = pinValue;
  
}
BLYNK_WRITE(V10)
{
  int pinValue = param.asInt(); 
  vpin10 = pinValue;
  
}