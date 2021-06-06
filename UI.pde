////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                       Main Menu                                                                            //
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

void ui_MainMenuMousePress() {
  if(intersect_rect(mouseX, mouseY, 22, display[1] - 40, 80, 80)) shutdown(true, true);
  switch(ui_MainMenuButton) {
    case 1 :
      ui_MainMenuNewGame = true;
    break;
    case 2 :
      ui_MainMenuLoadGame = true;
    break;
    case 3 :
      b_print("Switching to Settings Screen...");
      ui_switchScreen("Settings");
    break;
  }
}

void ui_MainMenuMouseMove() {
  if(intersect_rect(mouseX, mouseY, 586, display[1] * 0.6, 180, 60) && ui_MainMenuButton != 1) {
    ui_MainMenuButton = 1;
    redraw();
  }
  if(!intersect_rect(mouseX, mouseY, 586, display[1] * 0.6, 180, 60) && ui_MainMenuButton == 1) {
    ui_MainMenuButton = 0;
    redraw();
  }
  if(intersect_rect(mouseX, mouseY, 782, display[1] * 0.6, 180, 60) && ui_MainMenuButton != 2) {
    ui_MainMenuButton = 2;
    redraw();
  }
  if(!intersect_rect(mouseX, mouseY, 782, display[1] * 0.6, 180, 60) && ui_MainMenuButton == 2) {
    ui_MainMenuButton = 0;
    redraw();
  }
  if(intersect_rect(mouseX, mouseY, display[0] * 0.5, display[1] * 0.7, 180, 60) && ui_MainMenuButton != 3) {
    ui_MainMenuButton = 3;
    redraw();
  }
  if(!intersect_rect(mouseX, mouseY, display[0] * 0.5, display[1] * 0.7, 180, 60) && ui_MainMenuButton == 3) {
    ui_MainMenuButton = 0;
    redraw();
  }
}

void ui_MainMenuScreenRender() {
  pushStyle();
  background(255);
  textAlign(CENTER, CENTER);
  rectMode(CENTER);
  imageMode(CENTER);
  image(ui_MainMenuBackground, display[0] * 0.5, display[1] * 0.5, display[0], display[1]);
  fill(0xEEFFFFFF);
  rect(display[0] * 0.5, display[1] * 0.5, display[0], display[1]);
  textFont(nunitoSansBold, 64);
  fill(0);
  text("Yet Less Progress", display[0] * 0.5, display[1] * 0.3);
  text("×", 22, display[1] - 40);
  textFont(nunitoLight, 24);
  text("a historical turn based strategy game", display[0] * 0.5, display[1] * 0.375);
  if(ui_MainMenuButton == 1) fill(230); else fill(220);
  rect(586, display[1] * 0.6, 180, 60);
  if(ui_MainMenuButton == 2) fill(230); else fill(220);
  rect(782, display[1] * 0.6, 180, 60);
  if(ui_MainMenuButton == 3) fill(230); else fill(220);
  rect(display[0] * 0.5, display[1] * 0.7, 180, 60);
  fill(0);
  text("New Game", 586, display[1] * 0.6 - 4);
  text("Load Game", 782, display[1] * 0.6 - 4);
  text("Settings", display[0] * 0.5, display[1] * 0.7 - 4);
  popStyle();
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                        Settings                                                                            //
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

void ui_SettungsMousePress() {
  if(intersect_rect(mouseX, mouseY, 22, display[1] - 40, 80, 80)) shutdown(true, true);
  switch(ui_MainMenuButton) {
    case 1 :
      ui_MainMenuNewGame = true;
    break;
    case 2 :
      ui_MainMenuLoadGame = true;
    break;
    case 3 :
      b_print("Switching to Settings Screen...");
      ui_switchScreen("Settings");
    break;
  }
}

void ui_SettingsMouseMove() {
  if(intersect_rect(mouseX, mouseY, 586, display[1] * 0.6, 180, 60) && ui_MainMenuButton != 1) {
    ui_MainMenuButton = 1;
    redraw();
  }
  if(!intersect_rect(mouseX, mouseY, 586, display[1] * 0.6, 180, 60) && ui_MainMenuButton == 1) {
    ui_MainMenuButton = 0;
    redraw();
  }
  if(intersect_rect(mouseX, mouseY, 782, display[1] * 0.6, 180, 60) && ui_MainMenuButton != 2) {
    ui_MainMenuButton = 2;
    redraw();
  }
  if(!intersect_rect(mouseX, mouseY, 782, display[1] * 0.6, 180, 60) && ui_MainMenuButton == 2) {
    ui_MainMenuButton = 0;
    redraw();
  }
  if(intersect_rect(mouseX, mouseY, display[0] * 0.5, display[1] * 0.7, 180, 60) && ui_MainMenuButton != 3) {
    ui_MainMenuButton = 3;
    redraw();
  }
  if(!intersect_rect(mouseX, mouseY, display[0] * 0.5, display[1] * 0.7, 180, 60) && ui_MainMenuButton == 3) {
    ui_MainMenuButton = 0;
    redraw();
  }
}

void ui_SettingsScreenRender() {
  pushStyle();
  background(255);
  textAlign(CENTER, CENTER);
  rectMode(CENTER);
  imageMode(CENTER);
  image(ui_MainMenuBackground, display[0] * 0.5, display[1] * 0.5, display[0], display[1]);
  fill(0xEEFFFFFF);
  rect(display[0] * 0.5, display[1] * 0.5, display[0], display[1]);
  textFont(nunitoSansBold, 64);
  fill(0);
  text("Yet Less Progress", display[0] * 0.5, display[1] * 0.3);
  text("×", 22, display[1] - 40);
  textFont(nunitoLight, 24);
  text("a historical turn based strategy game", display[0] * 0.5, display[1] * 0.375);
  if(ui_MainMenuButton == 1) fill(230); else fill(220);
  rect(586, display[1] * 0.6, 180, 60);
  if(ui_MainMenuButton == 2) fill(230); else fill(220);
  rect(782, display[1] * 0.6, 180, 60);
  if(ui_MainMenuButton == 3) fill(230); else fill(220);
  rect(display[0] * 0.5, display[1] * 0.7, 180, 60);
  fill(0);
  text("New Game", 586, display[1] * 0.6 - 4);
  text("Load Game", 782, display[1] * 0.6 - 4);
  text("Settings", display[0] * 0.5, display[1] * 0.7 - 4);
  popStyle();
}
