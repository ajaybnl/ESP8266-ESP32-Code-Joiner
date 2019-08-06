Basic Info:

Arduino , Esp8266 , Esp32 Templates / Snippets are merged to make a full Sketch.

The purpose of this program:

1) For Easily choosing Microcontroller functionality when starting New Project.

2) Predefined SSIDS, PASSWORDS, Mqtt server info, Pre building snippets of functions to easily add to project without hassel.

3) Adding more functionality to a project without complicate code writing.

How it works:

Copy tags.cpp to something like "MCUNAME_your-snippet-name.cpp"

Add your own code, Save.

Open joiner.exe and Double Click on each file you want to merge. Click Save INO.

Setup and Loop Functions will be added automatically before Saving the Sketch.INO File.

Note: Do not remove the tags after. It will help you to merge more code later.

If you are merging a "snippetxxx.cpp file" to already merged "Sketch.INO" then you have to remove the "void setup{}" and "void loop{}" tags. 

They will be automatically added before saving.



Suggestion: For ESP8266 & ESP32, You should Merge Wifi Routines First.

The Merger File is choosed .cpp for easy editing on Notepad++ Color Coding.

Feel free to Use and make snippets and share them to me via email.








7 Tags File format:

//Add Imports Here

<#$#i#$#>

//Add Object Variables Here

<#$#v#$#>

//Add Local Variables Here

<#$#s#$#>

//Add Setup Code (Upper part) Like Serial Setup, Wifi Connection Etc...

<#$#sb#$#>

//Add Setup Code (Bottom part) Like Sensor Setups & Memory Init

<#$#l#$#>

//Add Loop Code (Upper part) Like OTA code, Blynk command

<#$#lb#$#>

//Add Loop Code (Bottom part) All Other Code

<#$#f#$#>

//Add Functions Routines Here
