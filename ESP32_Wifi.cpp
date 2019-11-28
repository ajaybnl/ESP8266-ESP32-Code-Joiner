#include <WiFi.h>
//i-
//WIFI
char* ssid = "FILL_SSID_HERE";
char* password = "FILL_PASSWORD_HERE";
unsigned long wifitimer = 0;
//v-
//WIFI
#define wifidebug true
//s-
//Serial Begin
Serial.begin(115200);

//Connect to Wifi
connectwifi();


//sb-
//WIFI
 wifitimer = millis();
//l-
//lb-


//WIFI
//60 SEC TIMER
  if (((millis() - wifitimer) / 1000) > 60) {
    if (WiFi.status() != WL_CONNECTED) {
	connectwifi();
    }
    wifitimer = millis();
  }

  
//f-
//WIFI
void connectwifi(){
	if (wifidebug) Serial.println("Connecting to Wifi...");
	if(connect_wifi(10)==false){
    if (wifidebug) Serial.println("Cannot Connect.");
	}else{
	if (wifidebug) Serial.println("Connected");
	if (wifidebug) Serial.print("IP address: ");
	if (wifidebug) Serial.println(WiFi.localIP());
	delay(1000);   	
	}    
}

bool connect_wifi(int maxattempts) {
  bool connected = false;

  //TRY
  int trys=0;
	while(connected==false){
		if(trys>0){
		if (wifidebug) Serial.print("Try: ");
		if (wifidebug) Serial.print(trys);
		}		
	connected=connect__wifi(ssid,password);		
	trys++;
		
	if(trys>maxattempts)break;
	}
  
  return (connected);
}

bool connect__wifi(char* ssid,char* password){
	
	unsigned long timeout = millis();
	WiFi.mode(WIFI_STA);
	WiFi.begin(ssid, password);
	while (WiFi.waitForConnectResult() != WL_CONNECTED) {
    if (((millis() - timeout) / 1000) >= 10) {
      break;
    }
  }
if (WiFi.status() == WL_CONNECTED) return(true); else return(false);

}