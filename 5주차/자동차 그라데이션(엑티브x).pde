size(1200, 1000);

int x = width;
float y = height*3/5;
float carX = width/4;
float carY = height*3/5;

for(int yy=0; yy<height; yy++){
  float r = 224 + (10 - 224)/float(height)*yy;
  float g = 106 + (198 - 106)/float(height)*yy;
  float b = 16 + (99 - 16)/float(height)*yy;
  stroke(r,g,b);
  line(0, yy, width, yy );
}
fill(52);
rect(0, y, x, 100);//도로

for(int z = 0; z <width; z+=200){//중앙선
  fill(255, 151, 30);
  rect(50+z, y+50, 100, 10);
}

for(float plantX = 50;  plantX<width; plantX+=100){//위쪽 풀
  fill(20, 173, 3);
  triangle(plantX, carY, plantX+15, carY-30, plantX+30, carY);
}

noStroke();
fill(#34CFF7); //자동차
rect(carX, carY-30, 100, 40); //몸통
rect(carX+40, carY-50, 60, 20);//바텀
fill(#000000);
ellipse(carX+30, carY+10, 30, 30);
ellipse(carX+80, carY+10, 30, 30);

for(float plantX = 50;  plantX<width; plantX+=100){//아래쪽 풀
  fill(20, 173, 3);
  triangle(plantX, carY+100, plantX+15, carY+70, plantX+30, carY+100);
}
