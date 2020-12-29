PrintWriter output;
String[] currentOutput;
Table options;
String[] options_string;
PImage icon;
JSONArray gameState;
String currentGameFilename = "new_game";
String screen = "Main_Menu";

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
  output = createWriter("debug.txt");
  currentOutput = loadStrings("debug.txt");
  
  if(!boolean(options_string[12])){
    for(int i = 0; i < currentOutput.length; i++){
      output.println(currentOutput[i]);
    }
  }
  
  output.print("Starting Init...\n Loading Settings...");
  print("Starting Init...\n  Loading Settings...");
  
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
  
  if(options_debug_produceFiles){
    output.print(" Done\n  Applying Settings...");
  }
  print(" Done\n  Applying Settings...");
  
 
}



void keyPressed() {
  if(keyCode == 27){
    key = 0;
    shutdown(false, false);
  }
}

void mousePressed() {
  
}

void mouseDragged() {
  
}



void draw() {
  background(200);
}
