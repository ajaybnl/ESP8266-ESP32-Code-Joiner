//DALLAS
#include <OneWire.h>
#include <DallasTemperature.h>
<#$#i#$#>
//DALLAS
#define ONE_WIRE_PIN 2
OneWire oneWire(ONE_WIRE_PIN);
DallasTemperature dallas(&oneWire);
<#$#v#$#>
<#$#s#$#>
<#$#sb#$#>
//DALLAS
dallas.begin();
<#$#l#$#>
<#$#lb#$#>
 //DALLAS
 dallas.requestTemperatures();
 float value = dallas.getTempCByIndex(0);
 Serial.println(value);
 delay(2000);
<#$#f#$#>