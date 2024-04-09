void setup(){
  size(400, 300);
  background(0, 150, 220);
}

 int xx = 0;
 int yy = 0;
void draw(){
  background(0, 150, 220);
  
  for(int x = 0; x < width; x+=30){
    line(x, 0, x, height);
  }
  for(int y = 0; y < height; y+=30){
    line(0, y, width, y);
  }
 
    fill(0);
    ellipse(xx, 90, 50, 50);
    xx = xx + 2;
    
    fill(255);
    ellipse(150, yy, 50, 50);
    yy = yy + 1;
   
}
