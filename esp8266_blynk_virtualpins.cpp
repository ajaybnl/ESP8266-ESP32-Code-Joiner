//BLYNK
#include <BlynkSimpleEsp8266.h>
<#$#i#$#>
//BLYNK
char auth[] = "97809955ff0146259096f7b2e2bc8c02";


<#$#v#$#>
//BLYNK
int vpin0 = 0;
int vpin2 = 0;
int vpin3 = 0;
int vpin1 = 0;
unsigned long timerblynk = 0;

<#$#s#$#>



<#$#sb#$#>
 //BLYNK
  Blynk.begin(auth, "", "");



<#$#l#$#>
  Blynk.run();

<#$#lb#$#>
//BLYNK
/*
Write Blynk:

Blynk.virtualWrite(VirtualPIN[0-10], value);

*/

<#$#f#$#>
//BLYNK
BLYNK_CONNECTED() {
  Blynk.syncAll();
}

BLYNK_WRITE(V0)
{
  int pinValue = param.asInt(); 
  vpin0 = pinValue;
  // process received value
}

BLYNK_WRITE(V1)
{
  int pinValue = param.asInt(); 
  vpin1 = pinValue;
  // process received value
}

BLYNK_WRITE(V2)
{
  int pinValue = param.asInt(); 
  vpin2 = pinValue;
  // process received value
}

BLYNK_WRITE(V3)
{
  int pinValue = param.asInt(); 
  vpin3 = pinValue;
  // process received value
}
