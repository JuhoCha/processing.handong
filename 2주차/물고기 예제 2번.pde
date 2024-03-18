size(1300, 800);
float px = 200; 
float py = 500; 
int unit = 10; 
if(px<width/w) {//왼쪽}else{//오른쪽}
fill(0, 0, 0, 0);
ellipse(px, py, 6*unit, 6*unit);//몸통
arc(px+3*unit, py, 6*unit, 6*unit, PI/2+HALF_PI/3, PI+HALF_PI*2/3);//아가미
triangle(px, py-1*unit, px-1*unit, py-0.5*unit, px-1*unit, py-1.5*unit);//작은 지느러미
triangle(px-3*unit, py, px-5*unit, py+1*unit, px-5*unit, py-1*unit);//꼬리
strokeWeight(5);
point(px+2*unit, py-1*unit);//눈알

//상대값을 이용해서 크기를 키우거나 줄여도 모든 변수가 똑같은 비율로 움직이게
