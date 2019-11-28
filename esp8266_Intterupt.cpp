//i-
//INTTERUPT
void ICACHE_RAM_ATTR interrupt ();
//v-
//INTTERUPT
 #define intteruptdebug true

 #define INTPIN 4 //Change PIN
int countint=0;
//s-
//INTTERUPT
pinMode(INTPIN, INPUT);

//sb-
//INTTERUPT
attachInterrupt(digitalPinToInterrupt(INTPIN), interrupt, RISING); //Change to FALLING/LOW/HIGH/RISING

if(intteruptdebug)Serial.begin(115200);

//l-


//lb-
if(intteruptdebug){
Serial.print("Interrupt Count/S : ");
Serial.println(countint);
delay(2000);
}
//f-
//INTTERUPT
void interrupt() {
	
//Do stuff here
  
countint++;
  
}

