/**
- b_print functions print to a debug file and the console in 1 command
- returnLogisticValue is useful for smooth animations 
- 
*/
void b_print(String passThrough) {
  if(options_debug_produceFiles){output.print(passThrough);}
  print(passThrough);
}
void b_println(String passThrough) {
  if(options_debug_produceFiles){output.println(passThrough);}
  println(passThrough);
}

float returnLogisticValue (float n){
  constrain(n, 0.0, 1.0);
  n *= 12; //Input & Output range from from 0.0 to 1.0
  int l = 1;
  int k = 1;
  int m = 6;
  float output = l / (1 + exp(-k * (n - m)));
  return output;
}
