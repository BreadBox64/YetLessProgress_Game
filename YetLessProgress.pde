Table options;
String[] options_string;
PImage icon;

boolean options_fullscreen = true;
boolean options_resizableWindow = false;
boolean options_antialiasing = true;
boolean options_pauseOnUnfocus = true;
int options_screenWidth = displayWidth;
int options_screenHeight = displayHeight - 10;
int options_framerate = 30;

String currentGameFilename = "new_game";

void setup(){
  icon = loadImage("icon.png");
  options = loadTable("options.csv");
  options_string = options.getStringColumn(1);
  
  options_fullscreen = boolean(options_string[0]);
  options_resizableWindow = boolean(options_string[1]);
  options_antialiasing = boolean(options_string[2]);
  options_pauseOnUnfocus = boolean(options_string[3]);
  options_screenWidth = int(options_string[4]);
  options_screenHeight = int(options_string[5]);
  options_framerate = int(options_string[6]);
  
  println(str(options_fullscreen));
  //print(options_string[0]);
  printArray(options_string);
  
  //surface.setLocation(0, -16);
  surface.setSize(options_screenWidth, options_screenHeight);
  if(options_fullscreen == true){
    //surface.setFullscreen();
  }
  surface.setTitle("YetLessProgress");
  surface.setIcon(icon);
  surface.setResizable(options_resizableWindow);
  frameRate(options_framerate);
  
}

void draw(){
  background(200);
}
