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
String[] onlineVersion;
String[] localVersion;
boolean upToDate = true;

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
  
  onlineVersion = loadStrings("https://raw.githubusercontent.com/BreadBox64/YetLessProgress_Game/main/version.txt");
  localVersion = loadStrings("version.txt");
  upToDate = onlineVersion[0].equals(localVersion[0]);
  
  if(upToDate){
    b_print(" v" + localVersion[0] + " Is Up To Date\n  Loading Settings...");
  } else {
    b_print(" v" + localVersion[0] + " Is Not Up To Date\n  Loading Settings...");
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
  
  surface.setLocation(0,0);
  surface.setResizable(options_display_resizable);
  surface.setSize(options_display_width, options_display_height);
  surface.setIcon(icon);
  smooth(options_display_antialiasing);
  if(options_display_antialiasing <= 0){
    noSmooth();
  }
  frameRate(options_display_framerate);
  
  b_print(" Done\n  Loading Fonts...");
  
  nunitoExtraLight = createFont("Nunito-ExtraLight.ttf", 48);
  nunitoLight = createFont("Nunito-Light.ttf", 48);
  nunitoSansExtraLight = createFont("NunitoSans-ExtraLight.ttf", 48);
  nunitoSansLight = createFont("NunitoSans-ExtraLight.ttf", 48);
  
  b_print(" Done\n");
  b_println("Finished Init");
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
  b_println("Mouse Pressed at: " + mouseX + ", " + mouseY);
}

void mouseDragged() {
  
}



void draw() {
  background(200);
  //if((!focused && !(screen == "MainMenu" || screen == "Settings") && options_display_unfocusPause)){
  //  ui_switchScreen("Pause");
  //}
  mainMenu.display();
}