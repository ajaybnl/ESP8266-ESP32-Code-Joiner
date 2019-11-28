#include"FS.h"
//i-
//v-
//SPIFFS
bool spiffsdebug = false;
//s-
//sb-
//SPIFFS
initspiff();
//l-
//lb-
//SPIFFS Functions:
/*
String readdir(path) Returns Files in Dir
Bool isfile(filename)
String readfile(char* filename)
writefile (char* filename,String data)
appendfile (char* filename,String data)
removefile (char* filename,String data)
*/

//f-
//SPIFFS
void initspiff() {
  bool ok = SPIFFS.begin();
  if (ok) {
    if (spiffsdebug) Serial.println("Formatting FS for the first time!");
    if (!isfile("/0.0")) {
      SPIFFS.format();
      writefile("/0.0", "1");
      if (spiffsdebug) Serial.println("Done");
    } else {
      if (spiffsdebug) Serial.println("Filesystem Ready");
    }
  }
}


String readdir(char* path) {
  String d = "";
  Dir dir = SPIFFS.openDir(path);
  d = "Files in Memory : \n";
  while (dir.next()) {
    String fileName = dir.fileName();
    size_t fileSize = dir.fileSize();

    d += fileName;
    d += " Size: " + fileSize;
    d += "\n";
  }
  d += "\n";
  return d;
}

bool isfile(char* file) {
  return SPIFFS.exists(file);
}

void writefile(char* file, String data) {
  File f = SPIFFS.open(file, "w");
  if (!f) {
    if (spiffsdebug) Serial.println("file creation failed");
  }
  // now write two lines in key/value style with  end-of-line characters
  f.println(data);
  f.close();
}

void appendfile(char* file, String data) {
  File f = SPIFFS.open(file, "a");
  if (!f) {
    if (spiffsdebug) Serial.println("file creation failed");
  }
  // now write two lines in key/value style with  end-of-line characters
  f.println(data);
  f.close();
}


void removefile(char* file) {
  if (isfile(file)) {
    bool f = SPIFFS.remove(file);
    if (!f) {
      if (spiffsdebug) Serial.println("file deletion failed");
    }
    // now write two lines in key/value style with  end-of-line characters

  } else {
    if (spiffsdebug) Serial.println("file not found! Cannot Delete!");
  }
}

String readfile(char* file) {
  String data;

  File f = SPIFFS.open(file, "r");
  if (!f) {
    if (spiffsdebug) Serial.println("Error trying to open the file");
  }  else {
    int s = f.size();
    data = f.readString();
    f.close();
  }

  return data;
}
