void setup(){
  size(500, 300);
  background(50, 0, 50);
}
float x = 0;
float y = 0;
void draw(){
 background(50, 0, 50);
  stroke(150, 0, 150, 100);
  strokeWeight(7);
  
  //biggest
  fill(200, 0, 70);
  ellipse(x, y, 50, 50);
  
  //second
  fill(200, 0, 70, 150);
  ellipse(x-40, y-40, 35, 35);
  
  //third
  fill(200, 0, 70, 70);
  ellipse(x-75, y-75, 20, 20);
  x += 1.5;
  y += 1.5;
  if((x-75)-10>width){
    x = -25;
  }
  if((y-75)-10>height){
    y = -25;
  }
}
