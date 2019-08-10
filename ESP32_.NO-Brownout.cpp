#include "soc/soc.h"
#include "soc/rtc_cntl_reg.h"
<#$#i#$#>
<#$#v#$#>
//NOBROWNOUT
#define nobrownout true
#define lowtxpower true
<#$#s#$#>
//NOBROWNOUT
 if(nobrownout) WRITE_PERI_REG(RTC_CNTL_BROWN_OUT_REG, 0); 
 if(lowtxpower) WiFi.setTxPower(WIFI_POWER_MINUS_1dBm);  
<#$#sb#$#>
<#$#l#$#>
<#$#lb#$#>
<#$#f#$#>