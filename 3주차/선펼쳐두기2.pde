size(480, 120);
strokeWeight(2);
for(int i=20; i<=400; i+=20){
  strokeWeight(2);
  line(i,0,i+i/2,80);
}//int로 굳이 정의하고 가야하나? 그냥 for문에 i변수값 지정해도 되는것 같은데
