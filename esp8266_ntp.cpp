#include <TimeLib.h>
#include <NtpClientLib.h>

<#$#i#$#>
//NTP
NTPSyncEvent_t ntpEvent; 

<#$#v#$#>
//NTP
bool ntpdebug = false;
int8_t timeZone = 5;
int8_t minutesTimeZone = 30;
bool wifiFirstConnected = false;
bool syncEventTriggered = false; // True if a time even has been triggered
<#$#s#$#>



<#$#sb#$#>
//NTP
  NTP.onNTPSyncEvent ([](NTPSyncEvent_t event) {
    ntpEvent = event;
    syncEventTriggered = true;
  });

  NTP.begin ("pool.ntp.org", timeZone, false, minutesTimeZone);
  NTP.setInterval (3600); //SET TIME SYNC INTERVAL
<#$#l#$#>
//NTP
  if (syncEventTriggered) {
    processSyncEvent (ntpEvent);
    syncEventTriggered = false;
  }

<#$#lb#$#>


<#$#f#$#>
//NTP
void processSyncEvent (NTPSyncEvent_t ntpEvent) {
  if (ntpEvent) {
    if(ntpdebug) Serial.println("Time Sync error: ");
    if (ntpEvent == noResponse)
      if(ntpdebug) Serial.println("NTP server not reachable");
    else if (ntpEvent == invalidAddress)
      if(ntpdebug) Serial.println("Invalid NTP server address");
  } else {
    if(ntpdebug) Serial.println("Got NTP time");
  }
}