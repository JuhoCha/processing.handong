size(500, 800);
float px = 400;
float py = 200;
int unit = width/50;

int dirX = -1;
if(px < width/2){
}else{
  dirX = +1;
}
triangle(px-dirX*3*unit, py, px-dirX*5*unit, py+1*unit, px-dirX*5*unit, py-1*unit);

int number = 111233;
if(number%3 == 0) {
  fill(255, 0, 0);
}else if(number%3 ==1){
  fill(0, 255, 0);
}else{
  fill(0, 0, 255);
}

ellipse(px, py, 6*unit, 6*unit);
triangle(px, py-1*unit, px-1*unit, py-0.5*unit, px-1*unit, py-1.5*unit);
arc(px+3*unit, py, 6*unit, 6*unit, radians(180-60), radians(180+60));
strokeWeight(5);
point(px+2*unit, py-1*unit);

