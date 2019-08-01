
<#$#i#$#>

<#$#v#$#>
//TIMEDEVENTS


bool timedevents = true; // Enable all Timers

unsigned long timer100ms = 0;
unsigned long timer1sec = 0;
unsigned long timer10sec = 0;
unsigned long timer1min = 0;
unsigned long timer10min = 0;
unsigned long timer30min = 0;
unsigned long timer1hour = 0;
<#$#s#$#>



<#$#sb#$#>
//TIMEDEVENTS
timer100ms = millis();
timer1sec = millis();
timer10sec = millis();
timer1min = millis();
timer10min = millis();
timer30min = millis();
timer1hour = millis();
<#$#l#$#>
if(timedevents){
//--------------------------------
/*............ 100MS Timer ...........*/
if(((millis()-timer100ms)/100)>=1){

//Write Code Here

timer100ms=millis();
}
/*............ Timer ...........*/


//--------------------------------
/*............ 1Sec Timer ...........*/
if(((millis()-timer1sec)/100)>=10){

//Write Code Here

timer1sec=millis();
}
/*............ Timer ...........*/


//--------------------------------
/*............ 10Sec Timer ...........*/
if(((millis()-timer10sec)/1000)>=10){

//Write Code Here

timer10sec=millis();
}
/*............ Timer ...........*/


//--------------------------------
/*............ 1Min Timer ...........*/
if(((millis()-timer1min)/1000)>=60){

//Write Code Here

timer1min=millis();
}
/*............ Timer ...........*/


//--------------------------------
/*............ 10Min Timer ...........*/
if(((millis()-timer10min)/1000)>=600){

//Write Code Here

timer10min=millis();
}
/*............ Timer ...........*/


//--------------------------------
/*............ 30Min Timer ...........*/
if(((millis()-timer30min)/1000)>=1){

//Write Code Here

timer30min=millis();
}
/*............ Timer ...........*/


//--------------------------------
/*............ 1Hour Timer ...........*/
if(((millis()-timer1hour)/1000)>=1){

//Write Code Here

timer1hour=millis();
}
/*............ Timer ...........*/
}

<#$#lb#$#>


<#$#f#$#>
