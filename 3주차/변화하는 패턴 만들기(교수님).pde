size(300, 200);
background(150, 100, 200);
noStroke();
for(int i=30; i<width; i+=30){ //i가 30이고, i는 300만큼까지 i는 30만큼씩 계속 증가함
  fill(#2B19FA);
  rect(i, 30, 10, i/2);
}
