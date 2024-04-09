void setup(){
  size(400, 200);
}

float i = 0.0;

void draw(){
  background(0);
  rect(i, 60, 80, 80);  
  i++;
  if(i > width) i = -80;
}
