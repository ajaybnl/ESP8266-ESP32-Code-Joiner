#include <TimeLib.h>
#include <NtpClientLib.h>

<#$#i#$#>
//NTP
NTPSyncEvent_t ntpEvent; 

<#$#v#$#>
//NTP
#define NTP_SYNC_INTERVAL 600 // 10 Mins

#define ntpdebug true


int8_t timeZone = 5;
int8_t minutesTimeZone = 30;
bool dosync = false; // True if a time even has been triggered

<#$#s#$#>



<#$#sb#$#>
//NTP
  NTP.onNTPSyncEvent ([](NTPSyncEvent_t event) {
    ntpEvent = event;
    dosync = true;
  });

  NTP.begin ("pool.ntp.org", timeZone, false, minutesTimeZone);
  NTP.setInterval (5); //Do not change
<#$#l#$#>
//NTP
  if (dosync) {
    
	if(ntp_sync_response (ntpEvent)) NTP.setInterval (NTP_SYNC_INTERVAL); // If we got time then change sync interval
    dosync = false;
  }

<#$#lb#$#>


<#$#f#$#>
//NTP
bool ntp_sync_response (NTPSyncEvent_t ntpEvent) {
  if (ntpEvent) {
    if(ntpdebug) Serial.println("Time Sync error: ");
    if (ntpEvent == noResponse)
      if(ntpdebug) Serial.println("NTP server not reachable");
    else if (ntpEvent == invalidAddress)
      if(ntpdebug) Serial.println("Invalid NTP server address");
  } else {
    if(ntpdebug) Serial.println("Got NTP time");
  }
  //Return Success or Error
  return((ntpEvent==0)?true:false);
}