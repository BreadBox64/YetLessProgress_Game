import processing.sound.*;

PFont nunitoExtraLight;
PFont nunitoLight;
PFont nunitoSansExtraLight;
PFont nunitoSansLight;
PrintWriter output;
String[] currentOutput;
Table options;
String[] options_string;
PImage icon;
JSONArray gameState;
String currentGameFilename = "new_game";
String previousScreen = "MainMenu";
String screen = "MainMenu";
String[] onlineVersion = {"-Network Error-"};
String[] localVersion;
boolean upToDate = true;
String cursorMode = "Normal";
int[] display = {width, height};

PImage mainMenuBackground;

boolean options_display_fullscreen;
boolean options_display_resizable;
int options_display_width;
int options_display_height;
int options_display_antialiasing;
int options_display_framerate;
boolean options_display_unfocusPause;
int options_difficulty_rng;
int options_difficulty_start;
boolean options_difficulty_catchup;
boolean options_difficulty_darkZones;
boolean options_debug_produceFiles;
boolean options_debug_multipleFiles;

ui_mainMenu mainMenu = new ui_mainMenu();



void setup() {
  textLeading(13);
  frameRate(30);
  background(255);
  drawLoadingIcon(color(255), width/2, height/2);
  icon = loadImage("icon.png");
  options = loadTable("options.csv");
  options_string = options.getStringColumn(1);
  currentOutput = loadStrings("debug.txt");
  if(boolean(options_string[12])){
    output = createWriter("debug_" + str(year()+10000) + "-" + month() + "-" + day() + "-" + str(hour()) + minute() + ".txt");
  } else {
    output = createWriter("debug.txt");
  }
  
  if(!boolean(options_string[12])){
    for(int i = 0; i < currentOutput.length; i++){
      output.println(currentOutput[i]);
    }
  }
  
  output.print("\n--------\nStarting Init...\n  Checking Version...");
  print("--------\nStarting Init...\n  Checking Version...");
  
  localVersion = loadStrings("version.txt");
  if(checkConnectivityStatus(false)){
    try {
      onlineVersion = loadStrings("https://raw.githubusercontent.com/BreadBox64/YetLessProgress_Game/main/version.txt"); 
    } catch(NullPointerException e) {
      onlineVersion[0] = "- Network Error -";
    }
    upToDate = onlineVersion[0].equals(localVersion[0]);
    
    if(upToDate){
      b_print(" v" + localVersion[0] + " Is Up To Date\n  Loading Settings...");
    } else {
      b_print(" v" + localVersion[0] + " Is Not Up To Date\n  Loading Settings...");
    }
  } else {
    delay(100);
    b_print("No Network Connection, Unable To Check Version.\n  Loading Settings...");
  }
  
  //b_println(localVersion[0] + " | " + onlineVersion[0]);
  
  options_display_fullscreen = boolean(options_string[0]);
  options_display_resizable = boolean(options_string[1]);
  options_display_width = int(options_string[2]);
  options_display_height = int(options_string[3]);
  options_display_antialiasing = int(options_string[4]);
  options_display_framerate = int(options_string[5]);
  options_display_unfocusPause = boolean(options_string[6]);
  options_difficulty_rng = int(options_string[7]);
  options_difficulty_start = int(options_string[8]);
  options_difficulty_catchup = boolean(options_string[9]);
  options_difficulty_darkZones = boolean(options_string[10]);
  options_debug_produceFiles = boolean(options_string[11]);
  options_debug_multipleFiles = boolean(options_string[12]);

  b_print(" Done\n  Applying Settings...");
  
  background(255);
  surface.setLocation(0,0);
  surface.setResizable(options_display_resizable);
  surface.setSize(options_display_width, options_display_height);
  //smooth(options_display_antialiasing);
  //if(options_display_antialiasing == 0){
  //  noSmooth();
  //}
  surface.setIcon(icon);
  frameRate(options_display_framerate);
  
  b_print(" Done\n  Loading Data...");
  
  nunitoExtraLight = createFont("Nunito-ExtraLight.ttf", 48);
  nunitoLight = createFont("Nunito-Light.ttf", 48);
  nunitoSansExtraLight = createFont("NunitoSans-ExtraLight.ttf", 48);
  nunitoSansLight = createFont("NunitoSans-ExtraLight.ttf", 48);
  
  mainMenuBackground = loadImage("mainMenuBackground.jpg");
  
  b_print(" Done\n  Wrapping Up...");
  
  noCursor();
  
  b_println(" Done");
  b_println("Finished Init!");
}



void keyPressed() {
  if(keyCode == 27){
    key = 0;
  }
  if(key == 'm' || key == 'M'){
    b_print("Switching to Map Screen...");
    ui_switchScreen("Map");
  }
  if(key == 'r' || key == 'R'){
    b_print("Switching to Region Screen...");
    ui_switchScreen("Region");
  }
  if(key == 'd' || key == 'D'){
    b_print("Switching to Diplomacy Screen...");
    ui_switchScreen("Diplomacy");
  }
  if(key == 'p' || key == 'P'){
    b_print("Switching to Policy Screen...");
    ui_switchScreen("Policy");
  }
  if(key == 'u' || key == 'U'){
    b_print("Switching to Military Screen...");
    ui_switchScreen("Military");
  }
  if(key == 'o' || key == 'O'){
    b_print("Switching to Overview Screen...");
    ui_switchScreen("Overview");
  }
}

void mousePressed() {
  //b_println("Mouse Pressed at: " + mouseX + ", " + mouseY);
  switch(screen) {
    case "MainMenu" : {
      mainMenu.display();
    }
  }
}

void mouseDragged() {
  switch(screen) {
    case "MainMenu" : {
      mainMenu.mouseAction();
    }
  }
}

void mouseMoved() {
  switch(screen) {
    case "MainMenu" : {
      mainMenu.mouseAction();
    }
  }
}


void draw() {
  if(width != display[0] || height != display[1]) {
    switch(screen) {
      case "MainMenu" : {
        mainMenu.updateContent();
        mainMenuBackground.resize(width, height);
      }
    }
    b_println("Screen Resized to: [" + width + ", " + height + "]");
    display[0] = width;
    display[1] = height;
  }
  background(200);
  //if((!focused && !(screen == "MainMenu" || screen == "Settings") && options_display_unfocusPause)){
  //  ui_switchScreen("Pause");
  //}
  switch(screen) {
    case "MainMenu" : {
      mainMenu.display();
    }
  }
  drawCursor(mouseX, mouseY, cursorMode);
  //println(frameRate);
}
