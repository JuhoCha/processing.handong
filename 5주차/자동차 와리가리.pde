void setup() {
  size(1200, 1000);
  carX1=width/2;
  carX2=1000;
// 액티브 모드 변경시 주의점 (3) width, height 변수를 이용하는 글로벌 변수는 반드시 setup 안에서 size 정해진 후 값을 설정
// 선언은 바깥에서, 대입만 여기서 
}


// 액티브 모드 변경시 주의점 (2) 변수의 위치 설정 global vs local
// 글로벌 변수는 어떤 함수에도 소속이 되지 않은 바깥 영역에 정의, 모든 함수/프레임 사이에서도 공유 및 접근 가능.
// 단점은 의도치 않게 변경 마구잡이
// 로컬 변수는 특정 함수 안에 정의, 그 함수 안에서만 사용가능, 함수 실행이 완료되면 같이 사라짐
// 외부 간섭 차단 안전
// 글로벌 영역에서는 setup 전이므로, 기본 size 100 X 100 으로 설정되어 있음

float carX1, carY = 560;
float carX2;
int unit = 10;
int x1_d = +1;
  void draw(){//액티브 모드 변경시 주의점(4) 배경은 매번 그릴 때마다 새로 그려줘야 움직이는 물체의 자취가 남지 않음
  background(99, 56, 5);
  road();
  carX1 = carX1 + x1_d * 5; // 매 프레임마다 이전 프레임 위치에서 오른쪽을 2픽셀 이동한 지점을 새로운 자동차의 위치로 업데이트 > 오른쪽으로 움직이는 효과  (다음위치 = 현재위치 + 방향X속도)
  // 액티브 모드 변경시 주의점 (1) 그리기 효과 reset 
  if(carX1 > width){
    x1_d = -1;
  } else if(carX1 < 0){
   x1_d = +1;
  car(carX, 560, +1);
  
  carX2 = carX2 - 2;
  car(carX2, 560, -1);
  treeB();
}

void road(){
for(int z = 0; z <width; z+=200){//중앙선
  fill(255, 151, 30);
  rect(50+z, y+50, 100, 10);
  }
}

void treeA() {
  for(float plantX = 50;  plantX<width; plantX+=100){//위쪽 풀
    fill(20, 173, 3);
    triangle(plantX, carY, plantX+15, carY-30, plantX+30, carY);
  }
}

void car(float X, float Y, int u, color c) {
  noStroke();
  fill(c); //자동차 색상
  rect(carX, carY-30, 100, 40); //몸통
  rect(carX+40, carY-50, 60, 20);//바텀
  fill(#000000);
  ellipse(carX+30, carY+10, 30, 30);
  ellipse(carX+80, carY+10, 30, 30);
}

void treeB(){
  for(float plantX = 50;  plantX<width; plantX+=100){//아래쪽 풀
    
    fill(20, 173, 3);
    triangle(plantX, carY+100, plantX+15, carY+70, plantX+30, carY+100);
  }
}
