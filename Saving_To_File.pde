void load_gameState(String filename) {
  gameState = loadJSONArray("saveGames/" + filename + ".json");
}

void save_gameState(String filename) {
  saveJSONArray(gameState, "saveGames/" + filename + ".json");
}

void save_optionState() {
  
  
  saveTable(options, "options.csv");
}
