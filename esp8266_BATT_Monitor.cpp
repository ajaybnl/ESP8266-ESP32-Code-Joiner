<#$#i#$#>
//BATT
#define enablebatterycheck true

unsigned long battchecktimer=0;
<#$#v#$#>
//BATT
<#$#s#$#>
<#$#sb#$#>
<#$#l#$#> 
<#$#lb#$#>
//BATT

if(enablebatterycheck){
	
//Every 10 Seconds check battery voltage
 if (((millis() - battchecktimer) / 1000) >= 10) {

 /* Attach 10K Resistor to VCC(LDO INPUT) and 2k Resistor to GND and Join Other 2 Pins to ADC.*/
 
      //Read Battery Data
      //------------------------------------
      unsigned long total = 0;
      
	  //Fine Reading Analog Input
	  for (int i = 0; i < 100; i++) {
        total = total + analogRead(A0);
      }
      float vol = total / 100;
      total = 0;
	  
	  //Devide for Voltage Conversion (according to resistor)
      vol = (vol * 0.0056640625);
	  
	  //Get Usable Voltage in Percentage
      int percent = (vol - 3.5) * 142; // 100% from 3.5v-4.2v
	  
      //------------------------------------
      //Finally Alert user if battery low.
	  if(percent<20){
		Serial.println("ALERT! LOW BATTERY");
	  }else{
		Serial.print("Voltage: ");
		  Serial.println(vol);
		  
		  Serial.print("Percent: ");
		  Serial.println(percent);
	  }
    
     
      battchecktimer = millis();
    }
	
}
<#$#f#$#>
