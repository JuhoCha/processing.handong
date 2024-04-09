void setup(){
  size(400, 200);
}

float x = 0.0;

void draw(){
  background(0);
  rect(x, 60, 80, 80);
  x = x + 1;
  if(x > width) { x = 0.0; }
}
