PrintWriter output;
String[] currentOutput;
Table options;
String[] options_string;
PImage icon;
JSONArray gameState;
String currentGameFilename = "new_game";
String previousScreen = "MainMenu";
String screen = "MainMenu";

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



void setup() {
  icon = loadImage("icon.png");
  options = loadTable("options.csv");
  options_string = options.getStringColumn(1);
  currentOutput = loadStrings("debug.txt");
  output = createWriter("debug.txt");
  
  if(!boolean(options_string[12])){
    for(int i = 0; i < currentOutput.length; i++){
      output.println(currentOutput[i]);
    }
  }
  
  output.print("\n--------\nStarting Init...\n  Loading Settings...");
  print("--------\nStarting Init...\n  Loading Settings...");
  
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
  
  surface.setResizable(options_display_resizable);
  surface.setSize(options_display_width, options_display_height);
  smooth(options_display_antialiasing);
  if(options_display_antialiasing <= 0){
    noSmooth();
  }
  frameRate(options_display_framerate);
  
  
  b_print(" Done");
  b_println("");
  b_println("Finished Init");
}



void keyPressed() {
  if(keyCode == 27){
    key = 0;
    shutdown(false, false);
  }
  if(key == 'm' || key == 'M'){
    b_print("Switching to Map Screen...");
    ui_switchScreen("Map");
  }
}

void mousePressed() {
  b_println("Mouse Pressed at: " + mouseX + ", " + mouseY);
}

void mouseDragged() {
  
}



void draw() {
  background(200);
  if((!focused && !(screen == "MainMenu" || screen == "Settings") && options_display_unfocusPause)){
    ui_switchScreen("Pause");
  }
}
