size(420, 220);
background(0);
for(int x = 0; x<width; x+=40){
  fill(150);
  ellipse(x, 0, 40, 40);
}
for(int y = 0; y<height; y+=40){
  fill(150);
  ellipse(0, y, 40, 40);
}
