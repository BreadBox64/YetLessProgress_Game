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

String[] get_savedGameStates() {
  String[] directoryContentsArray = listFileNames(sketchPath() + "/data/saveGames");
  String[] directoryContents = new String[0];
  for(int i = 0; i < directoryContentsArray.length; i++){
    if(directoryContentsArray[i].indexOf(".json") != -1) {
      directoryContents = append(directoryContents, directoryContentsArray[i].substring(0, (directoryContentsArray[i].length() - 5)));
    }
  }
  return directoryContents;
}

String[] listFileNames(String dir) {
  File file = new File(dir);
  if (file.isDirectory()) {
    String names[] = file.list();
    return names;
  } else {
    // If it's not a directory
    return null;
  }
}

void load_gameState(String filename) {
  b_print("Loading Gamestate...");
  gameState = loadJSONArray("data/saveGames/" + filename + ".json");
  b_println(" Done");
}

void save_gameState(String filename) {
  b_print("Saving Gamestate...");
  
  saveJSONArray(gameState, "data/saveGames/" + filename + ".json");
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
