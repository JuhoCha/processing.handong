//control T 누르면 자동서식 해주니까 괄호같은거 잘 보기
// 어떤 부분 찾을때 control F 눌러서 바로 찾기 아니면 드래그해서 showusage 하면 어디서 뭐 썼는지 보임
//코드 짤줄 아는것 부터 바로바로 쓰기

int unit = 10;
float heartX[] = new float[100];
float heartY[] = new float[100];
color heartColor[] = new color[100];
boolean Selected[] = new boolean[100];

void setup() {
  size(900, 600);

  //배열 하트 100개
  for (int i = 0; i<100; i++) {
    heartX[i]=random(0+3*unit, width-3*unit);
    heartY[i]=random(0+3*unit, height-3*unit);
    //랜덤 색상 가지고 있다
    heartColor[i] = color(random(255), random(255), random(255));
  }
}


int currentTime;
void draw() {

  currentTime = millis();

  if (timer && currentTime - timerStart > 1000) {//매 1초마다
    //하트들의 색상이 랜덤하게 바뀐다
    for (int i = 0; i<100; i++) {//조건문 안에 있어서 드로우 안에 있어도 조건 만족하면
      heartColor[i] = color(random(255), random(255), random(255));
    }
    timerStart = millis();//1초 끝나면 이때부터 타이머 다시 재라
  }

  background(#FDFFBC);
  for (int i = 0; i<100; i++) {
    heart(heartX[i], heartY[i], i);

    if (mousePressed && top == i) {
      heartX[i]=mouseX;
      heartY[i]=mouseY;
    }
  }
}

void heart(float x, float y, int heartNUM) {

  if (Selected[heartNUM]) {
    fill(heartColor[heartNUM]); //red, green, blue
    stroke(heartColor[heartNUM]);
  } else {
    fill(255, 0, 0); //red, green, blue
    stroke(255, 0, 0);
  }
  strokeWeight(1);

  arc(x - 1.5*unit, y, 3*unit, 3*unit, radians(180), radians(360));
  arc(x + 1.5*unit, y, 3*unit, 3*unit, PI, TWO_PI);
  triangle(x - 3*unit, y, x, y+3*unit, x+3*unit, y);

  fill(255);
  textSize(15);
  textAlign(CENTER);
  text(heartNUM, x, y+10);
}

int top = -1;
void mousePressed() {
  //이전에 눌린 하트가 안 따라오게 기본적으로 마우스 누르면 선택 초기화
  top = -1;

  //하트가 여러 개 겹치면 번호가 더 큰것만 선택되게 하라
  for (int i = 0; i<100; i++) {
    if (mouseX>heartX[i] - 3*unit && mouseX < heartX[i] +3*unit &&
      mouseY>heartY[i] - 3*unit && mouseY < heartY[i] +3*unit) {
      top = i;//이렇게 하면 6, 10 겹쳐있다고 하면 top은 10이 됨
      // Selected[i] = true;
    }
  }
  if (top > -1)Selected[top] = true;
  //Selected[top] = true; //이렇게 하면 벽을 눌렀을때 에러가 뜸 따라서 조건이 필요
}


//타이머 모드 만드는 함수
boolean timer; //스위치 만들어 주는거임 그래서 눌리면 이게 켜졌냐 꺼졌냐 알게
int timerStart;
void keyPressed() {
  if (key == 'r') { //r키 누르면 다시 바꿔라
    for (int i = 0; i<100; i++) {
      heartX[i]=random(0+3*unit, width-3*unit);
      heartY[i]=random(0+3*unit, height-3*unit);
      Selected[i]=false;//색상도 초기화 해줘야 하니까
      heartColor[i] = color(random(255), random(255), random(255));
    }
    timer = false;
  }
  if (key == 't') {
    timer = true;
    timerStart = millis();
    for (int i = 0; i<100; i++) {
      Selected[i] = true;
    }
  }
}

