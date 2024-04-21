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
  float unit = height/60;
  noFill();
    quad(px+12*unit, py+11*unit, px+17*unit, py+13*unit, px+17*unit, py+17*unit, px+12*unit, py+19*unit);//망토
    quad(px+13*unit, py+14*unit, px+17*unit, py+13*unit, px+17*unit, py+17*unit, px+13*unit, py+16*unit);//몸
    triangle(px+10*unit, py+14.5*unit, px+13*unit, py+14*unit, px+13*unit, py+15*unit); //윗다리
    triangle(px+10*unit, py+15.5*unit, px+13*unit, py+15*unit, px+13*unit, py+16*unit); //아랫다리
    ellipse(px+15.5*unit, py+13*unit, 3*unit, 1*unit);//왼쪽 팔
    ellipse(px+18.5*unit, py+17*unit, 3*unit, 1*unit);//오른쪽 팔
    ellipse(px+18*unit, py+15*unit, 2*unit, 2*unit);//머리통
    line(px+18*unit, py+14*unit, px+18*unit, py+16*unit);//머리선
}
