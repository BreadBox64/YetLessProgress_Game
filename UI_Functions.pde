void ui_switchScreen(String newScreen) {
  previousScreen = screen;
  screen = newScreen;
  redraw();
  b_println(" Done");
}

PFont returnFontFromString(String fontString) {
  PFont output;
  switch(fontString) {
    case "pixelation" :
      output = pixelation;
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
    case "nunitoSansBold" :
      output = nunitoSansBold;
    break;
    default :
      output = createFont(fontString, 48);
    break;
  }
  return output;
}

void drawCursor(float x, float y, String type) {
  pushStyle();
  switch(type){
    case "Typing" :
      
    break;
    case "Button" :
      
    break;
    default :
      fill(0, 0, 0, 100);
      if(mousePressed) fill(0, 0, 0, 50);
      noStroke();
      ellipse(x, y, 10, 10);
    break;
  }
  popStyle();
}

void drawLoadingIcon(color bgColor, int x, int y) {
  for(int i = 0; i <= 330; i += 30){
    color spotColor = color(111, 172, 255, map(i, 0, 336, 255, 0));
    fill(spotColor);
    noStroke();
    arc(x, y, 80, 80, radians(i), radians(i + 20));
    fill(bgColor);
    ellipse(x, y, 60, 60);
  }
}
