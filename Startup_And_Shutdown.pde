void shutdown (boolean save_options, boolean save_game){
  b_println("\nShutting Down...");
  noLoop();
  background(0);
  if(save_options){
    save_optionState();
  }
  if(save_game){
    save_gameState(currentGameFilename);
  }
  output.flush();
  output.close();

  exit();
}

void restart(){
  //System.restart();
}
