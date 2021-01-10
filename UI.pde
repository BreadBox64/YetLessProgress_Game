void ui_switchScreen(String newScreen) {
  previousScreen = screen;
  screen = newScreen;
  println(" Done");
}



PFont returnFontFromString(String fontString) {
  PFont output;
  switch(fontString) {
    case "" :
      output = nunitoExtraLight;
    break;
    case "nunitoExtraLight" :
      output = nunitoExtraLight;
    break;
    case "nunitoLight" :
      output = nunitoLight;
    break;
    case "nunitoSansExtraLight" :
      output = nunitoSansExtraLight;
    break;
    case "nunitoSansLight" :
      output = nunitoSansLight;
    break;
    default :
      output = createFont(fontString, 48);
    break;
  }
  return output;
}



void drawCursor(float x, float y, String type) {
  switch(type){
    case "Typing" :
      
    break;
    case "Button" :
      
    break;
    default :
      fill(0, 0, 0, 100);
      if(mousePressed) fill(0, 0, 0, 75);
      noStroke();
      ellipse(x, y, 10, 10);
    break;
  }
}

void drawLoadingIcon(color bgColor, int x, int y) {
  for(int i = 0; i < 360; i += 30){
    color spotColor = color(111, 172, 255, map(i, 0, 360, 255, 0));
    fill(spotColor);
    noStroke();
    arc(x, y, 80, 80, radians(i), radians(i + 20));
    fill(bgColor);
    ellipse(x, y, 60, 60);
  }
}



class ui_circleButton {
  ui_circleButton() {
    
  }
}

class ui_rectButton {
  float dimension_x, dimension_y, dimension_w, dimension_h, dimension_cx, dimension_cy, strokeWeight;
  color fillColor, highlight_fillColor, click_fillColor, strokeColor, highlight_strokeColor, click_strokeColor, textColor;
  boolean mouseHover, mouseClick;
  String buttonLabel = "";
  String buttonFont = "";
  float buttonFontSize, buttonFontShift;
  String buttonName = "Unnamed";
  
  ui_rectButton(String name, float x, float y, float w, float h, color[] colors, float weight, String label, String font, float fontSize, float fontShift) {
    buttonName = name;
    dimension_x = x;
    dimension_y = y;
    dimension_w = w;
    dimension_h = h;
    dimension_cx = dimension_x + int(dimension_w * 0.5);
    dimension_cy = dimension_y + int(dimension_h * 0.2);
    fillColor = colors[0];
    highlight_fillColor = colors[1];
    click_fillColor = colors[2];
    strokeColor =  colors[3];
    highlight_strokeColor = colors[4];
    click_strokeColor = colors[5];
    textColor = colors[6];
    strokeWeight = weight;
    buttonLabel = label;
    buttonFont = font;
    buttonFontSize = fontSize;  
    buttonFontShift = fontShift;
  }
  
  void display() {
    strokeWeight(strokeWeight);
    stroke(strokeColor);
    fill(fillColor);
    if(mouseHover){
      stroke(highlight_strokeColor);
      fill(highlight_fillColor);
      if(mouseClick){
        stroke(click_strokeColor);
        fill(click_fillColor);
      }
    }
    rect(dimension_x, dimension_y, dimension_w, dimension_h);
    fill(textColor);
    textAlign(CENTER, CENTER);
    textFont(returnFontFromString(buttonFont), 100);
    textSize(buttonFontSize);
    text(buttonLabel, dimension_cx, dimension_cy + buttonFontShift);
  }
  
  boolean[] checkMouseState() {
    boolean[] value = {false, false};
    if(intersect_rect(mouseX, mouseY, dimension_x, dimension_y, dimension_w, dimension_h)){
      value[0] = true;
      if(mousePressed){
        value[1] = true;
        b_println("Button '" + buttonName + "' pressed at [" + mouseX + ", " + mouseY + "]-Absolute [" + (mouseX - dimension_x) + ", " + (mouseY - dimension_y) + "]-Local");
      }
    }
    mouseHover = value[0];
    mouseClick = value[1];
    return value;
  }
  
  String returnName() {
    return buttonName;
  }
}

class ui_textBox {
  ui_textBox() {
  
  }
}



class fadeUpDown {
  color backgroundColor = color(0, 0, 0);
  int step = 0;
  float timeMult = 1/30;
  float animValue = 0; 
  
  fadeUpDown(color bg, float time) {
    backgroundColor = bg;
    timeMult = 1 / (time * 15); // Time is in seconds for ease of use, this coverts to a per frame increment amount
  }
  
  void display() {
    if(animValue >= 1 && step == 0) {
      step = 1;
    }
  
  }
  
  boolean checkStatus() {
    if(step == 2) {
      return true;
    }
    return false;
  }
}

class ui_scrollList {
  int x, y, w, h;
  JSONArray elements;
  /*
  Each member of elements looks like this:
  
  {
    "name": "insert_name_here",
    
  }
  
  */
  ui_scrollList(int xCoord, int yCoord, int wCoord, int hCoord, JSONArray imported_elements) {
    x = xCoord;
    y = yCoord;
    w = wCoord;
    h = hCoord;
  }
  void display() {
    
  }
  void onMouseDragged() {
    
  }
  
}

//class ui_popup {
//  ui_popup() {
    
//  }
//  void display() {int 
//    stroke(100);
//    strokeWeight(8);
//    fill(255);
//    rect(width * 0.25, height * 0.25, width * 0.5, height * 0.5);
    
//  }
  
//}

class ui_mainMenu {
  color[] defaultButtonColorsWhiteText = {color(150), color(175), color(160), color(175), color(200), color(180), color(255)};
  color[] defaultButtonColorsBlackText = {color(150), color(175), color(160), color(175), color(200), color(180), color(0)};
  ui_rectButton[] buttons = new ui_rectButton[3];
  ui_mainMenu() {
    buttons[0] = new ui_rectButton("exitButton", (width - 50), 10, 40, 40, defaultButtonColorsWhiteText, 4, "×", "nunitoExtraLight", 50, 0);
    buttons[1] = new ui_rectButton("loadGameButton", width * 0.35, height * 0.6, options_display_width * 0.1, 50, defaultButtonColorsBlackText, 4, "Load Game", "nunitoExtraLight", 25, 10);
    buttons[2] = new ui_rectButton("newGameButton", width * 0.55, height * 0.6, options_display_width * 0.1, 50, defaultButtonColorsBlackText, 4, "New Game", "nunitoExtraLight", 25, 10);
  }
  
  void display() {
    background(255);
    for(ui_rectButton i : buttons){
      boolean[] state = i.checkMouseState();
      String name = i.returnName();
      switch(name) {
        case "exitButton" :
          if(state[1]){
            shutdown(true, false); // Should be 'shutdown(true, true)' but saveGames aren't working yet.
          }
        break;
        case "loadGameButton" :
          if(state[1]){
            
          }
        break;
        case "newGameButton" :
          if(state[1]){
            
          }
        break;
      }
      i.display();
    }
    fill(0);
    textFont(nunitoLight, 64);
    textAlign(CENTER, CENTER);
    text("Yet Less Progress", width * 0.5, height * 0.4);
    textSize(20);
    textAlign(LEFT, TOP);
    text(" Version: " + localVersion[0] + "\n Latest Version: " + onlineVersion[0], 0, 10);
    
  }
  
  void updateContent() {
    buttons[0] = new ui_rectButton("exitButton", (width - 50), 10, 40, 40, defaultButtonColorsWhiteText, 4, "×", "nunitoExtraLight", 50, 0);
    buttons[1] = new ui_rectButton("loadGameButton", int(width * 0.35), int(height * 0.6), 160, 50, defaultButtonColorsBlackText, 4, "Load Game", "nunitoExtraLight", 25, 10);
    buttons[2] = new ui_rectButton("newGameButton", int(width * 0.55), int(height * 0.6), 160, 50, defaultButtonColorsBlackText, 4, "New Game", "nunitoExtraLight", 25, 10);
  }
}
