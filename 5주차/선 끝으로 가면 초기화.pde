void setup(){
  size(300, 300);
}

float y = 0.0;

void draw(){
  background(220, 220, 0);
  fill(220, 220, 0, 30);
  rect(0, 0, width, height);
  
  stroke(0, 50, 100);
  line(0, y, width, y);
  
  y = y + 1;
  
  if(y > height) { y = 0.0; }
}
