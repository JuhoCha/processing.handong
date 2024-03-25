size(800, 600);

int x = width;
float y = height*3/5;
float carX = width/4;
float carY = height*3/5;

background(99, 56, 5);
fill(52);
rect(0, y, x, 100);//도로

for(int z = 0; z <width; z+=100){
  fill(255, 151, 30);
  rect(50+z, y*5/6, 100, 10);
}

noStroke();
fill(#34CFF7); //자동차
rect(carX, carY, 100, 40); 
rect(carX+40, carY-20, 60, 20);
