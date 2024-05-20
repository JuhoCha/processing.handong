float pwx; // x locations of 10 pinwheels, each
float pwy;// y locations of 10 pinwheels, each

void setup() {
  size(800, 800);
  smooth();
  noStroke();
  // initialization
  pwx = width/2;//random(0, width);
  pwy = height/2;//random(0, height);
}

float angle=0;
void draw() {
  background(220);
  angle = angle +0.2;//새로운 날개 위치 = 이전 위치 + 속도 angle을 함수 안에서 쓰는게 좋은 습관이 아니기에 이렇게 씀. 

  drawPinWheel(pwx, pwy, 2, /*0.2,*/ angle);//날개 위치(350도 중 어디인지)는 angle 글로벌 변수에 저장 -> 이걸 함수에 전달한다면
} 

void drawPinWheel(float px, float py, float ps, /*float psp,*/ float pa) { //pa라는 로컬 변수로 받음. 따라서 void안쓰고 float으로 하는것. angle = draw.. 이렇게 안하고 void draw..해도 돌아가긴 하나 코드의 순환을 활용하려면 float으로 하는게 나음
  // 좌표변환 (1) pushMatrix, popMatrix로 코드 감싸주기 (2) 중심 translate 사용 옮기기 (3) 변환 크기 계산 (4) 변환함수 적용 
  // 가장 많이 실수하는 부분 -  translate 후에, 그림 그리는 코드를 (0, 0) 중심으로 다시 쓰기를 안하는 사람이 많음 

  // START of drawing
  fill(255);
  rect(px-4, py+16, 8, 100); // post
  
  pushMatrix();
  translate(px, py); // (0, 0) 을 지정하는 함수, 이전에 px (혹은 py)를 썼던 모든 부분이 0 
  /*pa = pa + psp;*/ // 새로운 날개 위치 = 이전 위치 + 속도 
  rotate(pa);// 새로운 날개 위치 (각도)만큼 회전
  
  // four wings
  fill(200, 0, 0);
  quad(0, 0, 0, 0+ -60, 0+30, 0+-20, 0+30, 0+0);
  fill(250, 250, 0);
  quad(0, 0, 0+60, 0, 0+20, 0+30, 0+0, 0+30);
  fill(0, 200, 0);
  quad(0, 0, 0+0, 0+60, 0+-30, 0+20, 0+-30, 0+0);
  fill(0, 0, 200);
  quad(0, 0, 0+-60, 0+0, 0+-20, 0+-30, 0+0, 0+-30);
  
  popMatrix();
  
  fill(255);
  ellipse(px, py, 10, 10); // pin
  // END of drawing
  
  //return pa; // return the current angle of wings 
}
