import java.net.MalformedURLException;
import java.net.URLConnection;
import java.net.URL;
import java.time.LocalDate;
import processing.sound.*;

PFont nunitoExtraLight;
PFont nunitoLight;
PFont nunitoSansLight;
PFont nunitoSansExtraLight;
PFont nunitoSansBold;
PFont pixelation;
PrintWriter output;
String[] currentOutput;
Table options;
String[] options_string;
PImage icon;
JSONArray gameState;
String currentGameFilename = "new_game";
String previousScreen = "MainMenu";
String screen = "MainMenu";
String onlineVersion = "-Network Error-";
String localVersion;
boolean upToDate = false;
String cursorMode = "Normal";
int[] display = {1366, 768};
static byte persistData;
byte newPersistData;
boolean showLegalInfo = true;
boolean online = false;

PImage ui_MainMenuBackground;
int ui_MainMenuButton = 0;
boolean ui_MainMenuNewGame = false;
boolean ui_MainMenuLoadGame = false;

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
  //size(1366, 746);
  fullScreen();
  textLeading(13);
  frameRate(60);
  background(255);
  drawLoadingIcon(color(255), width/2, height/2);
  textAlign(CENTER, CENTER);
  
  delay(100);
  
  //persistData = loadBytes("data.dat")[0];
  //if(persistData % 2 == 0) {
  //  showLegalInfo = true;
  //  printArray(loadStrings("LICENSE"));
  //  persistData = byte(persistData + 1);
  //  saveBytes("data.dat", new byte[]{newPersistData});
  //  //shutdown(false, false);
  //}
  
  icon = loadImage("icon.png");
  options = loadTable("options.csv");
  options_string = options.getStringColumn(1);
  currentOutput = loadStrings("debug.txt");
  if(boolean(options_string[12])){
    output = createWriter("logs/debug_" + str(year()+10000) + "-" + nf(getWeekOfYear(LocalDate.now()), 2) + "-" + LocalDate.now().getDayOfWeek().getValue() + "-" + nf(hour(), 2) + ":" + nf(minute(), 2) + ".txt");
  } else {
    output = createWriter("debug.txt");
  }
  
  if(!boolean(options_string[12])){
    for(int i = 0; i < currentOutput.length; i++){
      output.println(currentOutput[i]);
    }
  }
  
  b_print("-- " + str(year()+10000) + "-" + nf(getWeekOfYear(LocalDate.now()), 2) + "-" + LocalDate.now().getDayOfWeek().getValue() + "-" + nf(hour(), 2) + ":" + nf(minute(), 2) + " --\nStarting Init...\n  ");
  online = checkConnectivityStatus(true);
  b_print("  Checking Version...");
  switch(checkVersion()) {
    case 0 :
      b_print(" No Network Connection, Unable To Check Version.");
    break;
    
    case 1 :
      b_print(" Invalid Local Version, Unable To Check Version.");
    break;
    
    case 2 :
      b_print(" Invalid Online Version, Unable To Check Version.");
    break;
    
    case 3 :
      b_print(" v" + localVersion + " Is Up To Date");
    break;
    
    case 4 :
      b_print(" v" + localVersion + " Is Not Up To Date");
    break;
  }
  b_print("\n  Loading Settings...");
  
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
  //surface.setLocation(0,0);
  //surface.setResizable(options_display_resizable);
  //smooth(options_display_antialiasing);
  //if(options_display_antialiasing == 0){
  //  noSmooth();
  //}
  surface.setIcon(icon);
  surface.setTitle("Yet Less Progress");
  frameRate(options_display_framerate);
  
  b_print(" Done\n  Loading Data...");
  nunitoExtraLight = createFont("Nunito-Light.ttf", 64);
  nunitoLight = createFont("Nunito-Light.ttf", 64);
  nunitoSansLight = createFont("NunitoSans-Bold.ttf", 64);
  nunitoSansExtraLight = createFont("NunitoSans-Bold.ttf", 64);
  nunitoSansBold = createFont("NunitoSans-Bold.ttf", 64);
  pixelation = createFont("pixelation.ttf", 64);
  
  ui_MainMenuBackground = loadImage("mainMenuBackground.jpg");
  
  b_print(" Done\n  Wrapping Up...");
  
  //noCursor();
  ui_MainMenuScreenRender();
  
  b_println(" Done");
  b_println("Finished Init!");
  noLoop();
}

void keyPressed() {
  if(keyCode == 27){
    switch(screen) {
      case "Pause" :
        b_print("Switching to " + previousScreen + " Screen...");
        ui_switchScreen(previousScreen);
      break;
      case "Settings" :
        b_print("Switching to MainMenu Screen...");
        ui_switchScreen("MainMenu");
      break;
      default :
        b_print("Switching to Pause Screen...");
        ui_switchScreen("Pause");
      break;
    }
    key = ' ';
    keyCode = 0;
  }
  if(screen == "MainMenu" || screen == "Pause" || screen == "Settings") { } else {
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
}

void mousePressed() {
  b_println("Mouse Pressed at: " + mouseX + ", " + mouseY);
  //println(pixelWidth + "-" + pixelHeight);
  switch(screen) {
    case "MainMenu" : {
      ui_MainMenuMousePress();
    }
  }
}

void mouseMoved() {
  switch(screen) {
    case "MainMenu" : {
      ui_MainMenuMouseMove();
    }
  }
}


void draw() {
  background(200);
  switch(screen) {
    case "MainMenu" : {
      ui_MainMenuScreenRender();
    }
  }
  //drawCursor(mouseX, mouseY, cursorMo  de);
}

void stop() {
  shutdown(true, true);
}
