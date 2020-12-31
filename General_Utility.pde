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

float dist_fromCircle(int pointX, int pointY, int circleX, int circleY, int circleR) {
  float cx = pointX - circleX;
  float cy = pointY - circleY;
  return sqrt(sq(cx) + sq(cy)) - circleR;
}

float dist_fromRect(int pointX, int pointY, int rectX, int rectY, int rectW, int rectH) {
    float cx = max(min(pointX, rectX+rectW ), rectX);
    float cy = max(min(pointY, rectY+rectH), rectY);
    return sqrt( (pointX-cx)*(pointX-cx) + (pointY-cy)*(pointY-cy) );
}

boolean intersect_circle(int pointX, int pointY, int circleX, int circleY, int circleR) {
  return dist_fromCircle(pointX, pointY, circleX, circleY, circleR) <= 0;
}

boolean intersect_rect(int pointX, int pointY, int rectX, int rectY, int rectW, int rectH) {
  return dist_fromRect(pointX, pointY, rectX, rectY, rectW, rectH) <= 0;
}
