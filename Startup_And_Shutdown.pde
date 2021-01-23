void shutdown (boolean save_options, boolean save_game){
  noLoop();
  background(0);
  byte[] saveData = {newPersistData};
  saveBytes("data.dat", saveData);
  if(save_options){
   // save_optionState();
  }
  if(save_game){
    //save_gameState(currentGameFilename);
  }
  b_println("Shutting Down...");
  output.flush();
  output.close();
  
  exit();
}

void restart(){
  //System.restart();
}
