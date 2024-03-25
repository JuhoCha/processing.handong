size(900, 1000);

int x = width;
float y = height*3/5;
float carX = width/4;
float carY = height*3/5;

background(99, 56, 5);
fill(52);
rect(0, y, x, 100);//도로

for(int z = 0; z <width; z+=100){//중앙선
  fill(255, 151, 30);
  rect(50+z, y+50, 100, 10);
}

noStroke();
fill(#34CFF7); //자동차
rect(carX, carY-30, 100, 40); //몸통
rect(carX+40, carY-50, 60, 20);//바텀
fill(#000000);
ellipse(carX+30, carY+10, 30, 30);
ellipse(carX+80, carY+10, 30, 30);
