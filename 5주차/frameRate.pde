void setup(){
  size(200, 200);
  noStroke();
  frameRate(120);
  frameRate(60);
  frameRate(30);
  frameRate(2);
}

float y = 0.0;
void draw(){
  background(200);
  fill(0, 100, 100);
  ellipse(100, y, 50, 50);
  y = y + 0.5;
}
