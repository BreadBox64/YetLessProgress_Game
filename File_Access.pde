boolean checkConnectivityStatus(boolean enablePrint){
  if(enablePrint) b_print("Checking Connectivity...");
  try {
    String[] testString = loadStrings("https://raw.githubusercontent.com/BreadBox64/YetLessProgress_Game/main/data/memes.txt");
    boolean testBoolean = testString[0].equals(testString[1]);
  } catch(NullPointerException e){
    if(enablePrint) b_println("Test Failed");
    return false;
  }
  if(enablePrint) b_println("Test Succeeded");
  return true;
}
void load_gameState(String filename) {
  b_print("Loading Gamestate...");
  gameState = loadJSONArray("saveGames/" + filename + ".json");
  b_println(" Done");
}

void save_gameState(String filename) {
  b_print("Saving Gamestate...");
  
  saveJSONArray(gameState, "saveGames/" + filename + ".json");
  b_println(" Done");
}

void save_optionState() {
  b_print("Saving Options...");
  for(int i = 0; i < options_string.length; i++){
    options.setString(i, 1, options_string[i]);
  }
  options.setString(2, 1, str(width));
  options.setString(2, 1, str(height));
  saveTable(options, "options.csv");
  b_println(" Done");
}
