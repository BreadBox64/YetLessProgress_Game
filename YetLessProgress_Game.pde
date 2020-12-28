PrintWriter output;
Table options;
String[] options_string;
PImage icon;
JSONArray gameState;

boolean options_fullscreen = false;
boolean options_resizableWindow = true;
int options_antialiasing = 3;
boolean options_pauseOnUnfocus = true;
int options_screenWidth = 1366;
int options_screenHeight = 738;
int options_framerate = 30;

String currentGameFilename = "new_game";

void setup(){
  output = createWriter("positions.txt"); 
  /*
  currentOutput = loadStrings("positions.txt");
  for(int i = 0; i < currentOutput.length; i++){
    output.println(currentOutput[i]);
  }
  */
  icon = loadImage("icon.png");
  options = loadTable("options.csv");
  options_string = options.getStringColumn(1);
  
  //options_fullscreen = boolean(options_string[0]);
  
  println(str(options_fullscreen));
  printArray(options_string);
  
  surface.setLocation(0, 0);
  surface.setSize(options_screenWidth, options_screenHeight);
  if(options_fullscreen == true){
    //surface.setFullscreen();
  }
  surface.setTitle("YetLessProgress");
  surface.setIcon(icon);
  surface.setResizable(options_resizableWindow);
  frameRate(options_framerate);
  
  if(options_antialiasing == 0){
    noSmooth();
  } else {
    smooth(options_antialiasing);
  }
  

  
}

void draw(){
  background(200);
  load_gameState("test");
  //println(gameState.getString(0));
}
