size(480, 120);
strokeWeight(2);
int startX=20;
int startY =80;
for(int i=20; i<400; i+=20)
for(int o=80; o<120; o+=80){
  {
  startX = i;
  startY = o;
  line(startX, startY+40, startX+startX/2-3/5, startY);
  line(startX, 0, startX+startX/2, 80);
  }
}//코드 차이 여쭤보기
