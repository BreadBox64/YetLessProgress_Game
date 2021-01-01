void load_gameState(String filename) {
  gameState = loadJSONArray("saveGames/" + filename + ".json");
}

void save_gameState(String filename) {
  saveJSONArray(gameState, "saveGames/" + filename + ".json");
}

void save_optionState() {
  for(int i = 0; i < options_string.length; i++){
    options.setString(i, 1, options_string[i]);
  }
  options.setString(2, 1, str(width));
  options.setString(2, 1, str(height));
  saveTable(options, "options.csv");
}
