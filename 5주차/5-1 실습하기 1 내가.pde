void setup(){
  size(400, 200);
}

float x = 0.0;

void draw(){
  background(220, 220, 0);
  fill(0);
  rect(0, 0, width, height);
  
  fill(225);
  rect(x, 80, 80, 80);
  
  x = x + 1;
  
  if(x > width) { x = 0.0; }
}
