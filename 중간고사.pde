float unit = 8;
void setup(){
  size(600, 280);
  background(0);
}

void draw(){
  background(0);
  line_1(255);
  heart(0, 0, #FF6FFF);
  star(0, 0, #EEFF6F);
  pacman();
}

 void line_1(color cl){
   for(int x = 0; x < width; x+=40){
    stroke(cl);
    strokeWeight(1);
    line(x, 0, x, height);
  }
  for(int y = 0; y < height; y+=40){
    stroke(cl);
    strokeWeight(1);
    line(0, y, width, y);
  }
 }
 
 //heart
void heart(int x, int y, color cl){
  int line = 0;
  int order = 0;
 for(y = 0; y<height; y += 5*unit){
   for(x = 0; x<width; x += 5*unit){
   if (line % 2 == 0){ //짝수일때 짝수에
     if (order % 2 == 0){
    fill(cl);
    noStroke();
    arc(x+2.5*unit, y+2*unit, 5*unit, 5*unit, 0, PI);
    arc(x+1.25*unit, y+2*unit, 2.5*unit, 2.5*unit, PI, TWO_PI);
    arc(x+3.55*unit, y+2*unit, 2.5*unit, 2.5*unit, PI, TWO_PI);
     }else{
      
     }
   if (line % 2 ==1){
     if (order % 2 == 1){
      fill(cl);
      noStroke();
      arc(x+2.5*unit, y+2*unit, 5*unit, 5*unit, 0, PI);
      arc(x+1.25*unit, y+2*unit, 2.5*unit, 2.5*unit, PI, TWO_PI);
      arc(x+3.55*unit, y+2*unit, 2.5*unit, 2.5*unit, PI, TWO_PI);
     }else{
     
     }
   }
      order++;
   }
   order = 0;
   line++;
   }
 }
}

void star(int x, int y, color cl){
 //for(y = 0; y<height; y += 5*unit){
  // for(x = 0; x<width; x += 5*unit){
    fill(cl);
    noStroke();
    triangle(x*unit, y+1.8*unit, x+5*unit, y+1.8*unit, x+2.5*unit, y+5*unit);
    triangle(x*unit, y+3.8*unit, x+5*unit, y+3.8*unit, x+2.5*unit, y*unit);
  // }
// }
}
 
void pacman(){

}
