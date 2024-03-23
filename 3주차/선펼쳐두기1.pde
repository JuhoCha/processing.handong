size(480, 120);
strokeWeight(2);
int startX=20;
for(int i=20; i<400; i+=20){
  startX = i;
  line(startX, 0, startX+startX/2, 80);
}
