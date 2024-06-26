float [] x = new float [3000];
float [] speed = new float [3000];
boolean [] visible = new boolean[3000]; // 배열변수 사용 4단계: (1) 선언 (2) 메모리 할당 (3) 초기화 (4) 사용

float rpx, rpy;
float rpcx, rpcy; // 빨간 팩맨 원운동의 기준점 - 1바퀴 돌고나면 다른 위치로 바뀜 
float rpa=0; // 빨간 팩맨이 원운동할 때 그 위치를 나타내는 각도값 
float rps; // 빨간 팩맨의 원운동 크기 - 1바퀴 돌고나면 다른 크기로 랜덤하게 바뀜. 더 많은 하얀팩맨을 잡아먹을 확률을 높이기 위해 

void setup() {
  size(1480, 840);
  noStroke();
  for(int i=0; i<x.length; i++) {
    x[i] = random(-2000, 200);
    speed[i] = random(0.5, 1.5);
    visible[i] = true;
  }
  // 빨간 팩맨의 초기값 
  rpx = width-10;
  rpy = height/2;
  rpcx = random(0, width);
  rpcy = random(0, height);
  rps = random(height/4, height/2);
}

// 글로벌 변수 - 프레임이 바뀌어도 항상 같은 공간에 존재해서 데이터를 업데이트 할 수 있는 변수 
int count_eaten = 0;
int count_survived = 0;
float clickX, clickY;

void draw() {//드로우는 계속 모니터링 하고 업데이트 하는 일을 한다. 따라서mouseX, mouseY  이거하면 마우스만 따라다님 우리가 할건 클릭할 때 따라오는 거니까
  background(0);
  fill(255, 200);
  for(int i=0; i<x.length; i++) {
    x[i] += speed[i]; // 하얀 팩맨 움직이는 코드
    // 무사통과 확인
    if (x[i] > width && visible[i]) {
      count_survived++;
      visible[i] = false;
    }
    // 그려주기 전에, 빨간팩맨과 부딪혔는지 확인, 부딪혔으면 안 그림
    float yi = float(height)/x.length*i; // 지역변수 - 당장 임시로 저장했다가 } 끝나면 없어짐 
    float d_w_r = dist(x[i], yi, rpx, rpy);
    // 논리구조 - 데이터 / 액션 구분, 액션과 액션 사이는 데이터로 연계
    // 어떤 액션 후에 상태가 변하는 경우 -> 상태를 변수에 저장 -> 변수값에 따라 후속 액션 
    if (d_w_r < 6+10) { // 둘 사이의 거리가 둘의 반지름의 합보다 작으면 충돌
      if(visible[i])  count_eaten++;
      visible[i] = false;
    } 
    if (visible[i]) {
      fill(255);
      arc(x[i], yi, 12, 12, radians(30), radians(330)); // 하얀팩맨 그리는 코드와 이름을 붙여주는 코드 강의노트 11-1 text 코드 사용
      fill(0, 0, 255);
      textSize(10);
      text(i, x[i], yi); // 쓸 내용, 슬 위치, x/y >> 팩맨 번호를 각 팩맨의 몸통 위에 써 주세요.
    }
  }
  
  // 빨간 팩맨
  // 모션 - 원운동 공식: 기준점+cos(각도)*크기 
  rpa += 0.1; // 각도 위치는 매프레임 0.1라디안의 속도로 업데이트 됨, 즉 0부터 시작해서 0.1, 0.2, 0.3, .... 이렇게 증가하고 있음 radians단위로
  // 한바퀴 회전하면 회전 중심을 다른 위치로 옮기기 
  if(rpa >= TWO_PI) { // if(rpa == TWO_PI) 0.0 > 1.0 > 2.0 ... > 360.000000000000000000000000000000000000000000000000 == 360.00000000000000000000000000000000000001
    rpcx = random(0, width);
    rpcy = random(0, height);
    rps = random(height/4, height/2); // 회전크기도 변경 
    // 조건식에 한 번 걸리고 나면 조건에 해당하는 변수를 업데이트 - 
    rpa = 0;
  }
  // 하얀 팩맨과의 접점을 늘리기 위해 빨간 팩맨은 반드시 화면안에 있도록
  rpx = rpcx + cos(rpa)*rps; // 현재 위치 계산
  rpx = constrain(rpx, 0+10, width-10); // 위치값의 범위 제한 재계산
  rpy = rpcy + sin(rpa)*rps;
  rpy = constrain(rpy, 0+10, height-10);
  // 그리기 
  fill(255, 0, 0);
  arc(rpx, rpy, 20, 20, radians(180+30), radians(360+180-30));  

  
  if(keyPressed){//누르고 있는 동안 계속 무엇을 하고 싶을때, 손을 떼면 그만 두고 싶을 때
    if(key==CODED && keyCode==LEFT) rpx = rpx -1;
  }
  if(leftClick) rpx = rpx -1;
  //if(mousePressed){
  // //여기서 저장하면, 클릭 한 채로 누를 때 계속 바뀜  clickX = mouseX; clickY = mouseY; 그래서 밖에서 지정해줘야 draw 떄문에 반복 안됨
  //}

  println(count_eaten, count_survived); //점수
  textSize(48);
  textAlign(RIGHT, CENTER);
  text(count_eaten+" / "+ count_survived, clickX, clickY);//화면 중앙에 정보를 출력하시오->마우스 클릭 위치로 움직이게 하시오
} 

//마우스 클릭하면 그 위치에 점수를 쓰시오. 딱 한번 눌렀을 때 그 위치에 고정, 누른 채로 움직여도 바뀌지 않게 하고 싶을 떄
void mousePressed(){
  clickX=mouseX; 
  clickY=mouseY;
}


boolean leftClick = false;
void keyPressed(){//한번 누르고 손을 떼도 계속 유지되게 하고 싶을 때 >> 그 순간에 포착
  if(key==CODED && keyCode==LEFT) leftClick = true;
}

//5-2 속도 파트에서 12페이지 사용  tweening  (시작점 + 총 거리 *이동하는 퍼센트) 그 퍼센트는 0~1사이의 값
