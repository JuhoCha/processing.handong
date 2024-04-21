float rux = height/40;
float ruy = height/20;
int px = 0; int py = 0;

void setup(){
  size(1200, 600);
  background(#717171);
}

void draw(){
  background(#717171);
  rain(height/40, height/20, 255);
  hero();
}

void rain(float rx, float ry, color cl){
 for(float y = 0; y < height;  y += height/20){
   for(float x = 0; x < width; x += height/40){
     stroke(cl);
      line(rx*x, y*ry, x, y);}}
}
  
void hero(){
  
}
