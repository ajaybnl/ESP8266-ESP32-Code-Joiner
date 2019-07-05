Welcome, Let me discuss the purpose of this program:

Arduino & Esp8266 / Esp32 Templates Merged to make a full Sketch.INO.
For Easily choosing MCU functionality without editing a single line.
The Merger File is choosed .cpp for easy editing on Notepad++ Color Coding.
Copy the Tags to a New text file and name it "xxxxxxxxxxxx.cpp". 
Open joiner.exe and Double Click on each file you want to merge. Click Save INO.

Setup and Loop Functions will be added automatically before Saving the Sketch.INO File.
Note: Do not remove the tags after. It will help you to merge more code later.

If you are merging a "Merger .cpp file" to already merged "Sketch.INO" then you have to remove the void setup{} and void loop{} tags. 
They will be automatically added before saving.

Suggestion: For ESP8266 & ESP32, You should Merge Wifi Routines First.


Created by Ajay Kumar Email: ajaybnl@gmail.com

Feel free to Use and make snippets (Merger Sketches .cpp) and share them to me via email.


7 Tags File Starts Here:

##################################################################
Add Imports Here

<#$#i#$#>
Add Object Variables Here

<#$#v#$#>
Add Local Variables Here

<#$#s#$#>
Add Setup Code (Upper part) Like Serial Setup, Wifi Connection Etc...

<#$#sb#$#>
Add Setup Code (Bottom part) Like Sensor Setups & Memory Init

<#$#l#$#>
Add Loop Code (Upper part) Like OTA code, Blynk command

<#$#lb#$#>
Add Loop Code (Bottom part) All Other Code

<#$#f#$#>
Add Functions Routines Here


