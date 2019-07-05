//UDP
#include <WiFiUdp.h>
<#$#i#$#>
//UDP
//SET YOUR PC IP ADDRESS (YOU GOT FROM MODEM)
IPAddress udpip(192, 168, 100, 2); 
//SET PORT TO CONNECT
unsigned int udpport = 8080; 
unsigned int udplocalport = 3424; //no use
WiFiUDP Udp;
<#$#v#$#>
<#$#s#$#>
<#$#sb#$#>
 //UDP
    char buf[100];
    String a = ipToString(WiFi.localIP());
    a.toCharArray(buf, 100);
    udpprint(buf);
<#$#l#$#>
<#$#lb#$#>
//UDP
/*
UDP Print or Charting (see ajay_bnl youtube channel)
bool udpchart(value);
bool udpchart(value,value);

bool udpprint("Something...");
*/

<#$#f#$#>
//UDP
String ipToString(IPAddress ip) {
  String s = "";
  for (int i = 0; i < 4; i++)
    s += i  ? "." + String(ip[i]) : String(ip[i]);
  return s;
}

bool udpchart(int val) {
  char buf[8];
  if (WiFi.status() == WL_CONNECTED) {
    Udp.begin(udplocalport);
    delay(10); //Tweak this
    if (Udp.beginPacket(udpip, udpport)) {
      snprintf(buf, 8, "%d\n", val);
      Udp.write(buf);
      Udp.endPacket();
      return (true);
    } else {
      Udp.stop();
      return (false);
    }
  } else {
    return (false);
  }
}

bool udpchart(long val) {
  char buf[8];
  if (WiFi.status() == WL_CONNECTED) {
    Udp.begin(udplocalport);
    delay(10); //Tweak this
    if (Udp.beginPacket(udpip, udpport)) {
      snprintf(buf, 8, "%d\n", val);
      Udp.write(buf);
      Udp.endPacket();
      return (true);
    } else {
      Udp.stop();
      return (false);
    }
  } else {
    return (false);
  }
}

bool udpchart(float val) {
  char buf[8];
  if (WiFi.status() == WL_CONNECTED) {
    Udp.begin(udplocalport);
    delay(10); //Tweak this
    if (Udp.beginPacket(udpip, udpport)) {
      snprintf(buf, 8, "%d\n", val);
      Udp.write(buf);
      Udp.endPacket();
      return (true);
    } else {
      Udp.stop();
      return (false);
    }
  } else {
    return (false);
  }
}

bool udpchart(int val,int val2) {
  char buf[8];
  if (WiFi.status() == WL_CONNECTED) {
    Udp.begin(udplocalport);
    delay(10); //Tweak this
    if (Udp.beginPacket(udpip, udpport)) {
      snprintf(buf, 8, "%d,%d\n", val,val2);
      Udp.write(buf);
      Udp.endPacket();
      return (true);
    } else {
      Udp.stop();
      return (false);
    }
  } else {
    return (false);
  }
}


bool udpprint(char text[100]) {
  if (WiFi.status() == WL_CONNECTED) {
    Udp.begin(udplocalport);
    delay(10); //Tweak this
    if (Udp.beginPacket(udpip, udpport)) {
      Udp.write(text);
      Udp.write("\n");
      Udp.endPacket();
      return (true);
    } else {
      Udp.stop();
      return (false);
    }
  } else {
    return (false);
  }
}
