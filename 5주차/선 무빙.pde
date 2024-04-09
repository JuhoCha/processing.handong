void setup(){
  size(300, 300);
  background(220, 220, 0);
}

float y = 0.0;

void draw(){
  background(220, 220, 0);
  stroke(0, 50, 100);
  line(0, y, width, y);
  
  y = y + 1;
}
