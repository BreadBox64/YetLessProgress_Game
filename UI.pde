void ui_switchScreen(String newScreen) {
  previousScreen = screen;
  screen = newScreen;
  println(" Done");
}

class ui_circleButton {
  ui_circleButton() {
    
  }
}

class ui_rectButton {
  int dimension_x, dimension_y, dimension_w, dimension_h, dimension_cx, dimension_cy, strokeWeight;
  color fillColor, highlight_fillColor, click_fillColor, strokeColor, highlight_strokeColor, click_strokeColor, textColor;
  boolean mouseHover, mouseClick;
  String buttonLabel = "";
  PFont buttonFont = nunitoExtraLight;
  float buttonFontSize = 10;
  String buttonName = "Unnamed";
  
  ui_rectButton(String name, int x, int y, int w, int h, color[] colors, int weight, String label, PFont font, float fontSize) {
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
    if(font != null) buttonFont = font;
    buttonFontSize = fontSize;
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
    textFont(nunitoExtraLight, buttonFontSize);
    text(buttonLabel, dimension_cx, dimension_cy);
  }
  
  boolean[] checkMouseState() {
    boolean[] value = {false, false};
    if(intersect_rect(mouseX, mouseY, dimension_x, dimension_y, dimension_w, dimension_h)){
      value[0] = true;
      if(mousePressed){
        value[1] = true;
        b_println("Button '" + buttonName + "' pressed at " + mouseX + ", " + mouseY);
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

class ui_mainMenu {
  color[] exitButtonColors = {color(150), color(175), color(160), color(175), color(200), color(180), color(255)};
  ui_rectButton[] buttons = new ui_rectButton[1];
  ui_mainMenu() {
    buttons[0] = new ui_rectButton("exitButton" , 10, 10, 40, 40, exitButtonColors, 4, "×", nunitoExtraLight, 50);
    
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
      }
      i.display();
    }
  }
  
  void shiftScreen(String newScreen) {
    
  }
}
