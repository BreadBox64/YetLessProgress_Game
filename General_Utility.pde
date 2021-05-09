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

float dist_fromCircle(float pointX, float pointY, float circleX, float circleY, float circleR) {
  float cx = pointX - circleX;
  float cy = pointY - circleY;
  return sqrt(sq(cx) + sq(cy)) - circleR;
}

float dist_fromRect(float pointX, float pointY, float rectX, float rectY, float rectW, float rectH) {
    float cx = max(min(pointX, rectX+rectW ), rectX);
    float cy = max(min(pointY, rectY+rectH), rectY);
    return sqrt( (pointX-cx)*(pointX-cx) + (pointY-cy)*(pointY-cy) );
}

boolean intersect_circle(float pointX, float pointY, float circleX, float circleY, float circleR) {
  return dist_fromCircle(pointX, pointY, circleX, circleY, circleR) <= 0;
}

boolean intersect_rect(float pointX, float pointY, float rectX, float rectY, float rectW, float rectH) {
  return (pointX >= rectX - rectW/2 && pointX <= rectX + rectW/2 && pointY >= rectY - rectH/2 && pointY <= rectY + rectH/2);
}

int modifyColor(char mode, color value, int change) {
  float[] argbValues = {alpha(value), red(value), green(value), blue(value)};
  color returnColor;
  switch(mode) {
    case 'A' :
      returnColor = color(argbValues[1], argbValues[2], argbValues[3], change);
    break;
    case 'R' :
      returnColor = color(change, argbValues[2], argbValues[3], argbValues[0]);
    break;
    case 'G' :
      returnColor = color(argbValues[1], change, argbValues[3], argbValues[0]);
    break;
    case 'B' :
      returnColor = color(argbValues[1], argbValues[2], change, argbValues[0]);
    break;
    default :
      println("Invalid mode, is this intentional?");
      returnColor = color(argbValues[1], argbValues[2], argbValues[3], argbValues[0]);
    break;
  }
  
  return returnColor;
}

int getWeekOfYear(LocalDate time) {
  LocalDate begin = LocalDate.of(time.getYear(), 1, 1);
  float offset = begin.getDayOfWeek().getValue() - 1;
  return ceil((time.getDayOfYear() + offset)/7);
}

float relX(float input) {
  return map(input, 0, 1366, 0, width);
}

float relY(float input) {
  return map(input, 0, 745, 0, height);
}

PVector relC(PVector input) {
  PVector output = new PVector(map(input.x, 0, 745, 0, height), map(input.y, 0, 1366, 0, width));
  return output;
}
