int unit; //잔디 유닛
int sunit; //양 유닛

float r; //물체감지 위한 변수

float sx1; //양x
float sy1; //양y
float sx2; //양x
float sy2; //양y

float directionX_2; //방향 x
float directionY_2; //방향 y
float directionX_1; //방향 x
float directionY_1; //방향 y

void setup() {
  background(14, 103, 9);
  size(1000, 800);
  unit = height/120; //꽃과 잔디에 쓸 유닛
  sunit = height/80; //양에 쓸 유닛
    
  sx1 = width*3/4; //양1 x좌표
  sy1 = height*2/3; //양1 y좌표
  sx2 = width*1/3;  //양2 x좌표
  sy2 = height*2/3; //양2 y좌표
    
  directionX_2 = 1; //방향 x
  directionY_2 = 1; //방향 y
  directionX_1 = 1; //방향 x
  directionY_1 = 1; //방향 y
  
}

void draw() {
  background(14, 103, 9); //배경 색
  grass(0, 0, height/120, #0BAF04 ); //풀 그리는 코드
  ground(0, 0, height/120, #DC5FFF, #FF7982 ); //꽃 그리는 코드
  sheepone(sx2, sy2, height/80, -1); //오른쪽 양 코드
  sheeptwo(sx1, sy1, height/80, +1); //왼쪽 양 코드
  
  sx1 = sx1 +8*directionX_1;
  sx2 = sx2 -11*directionX_2;
  sy1 = sy1 +0.8 * directionY_1;
  sy2 = sy2 +1.1*directionY_2;
  
  r = 70; //물체감지 위한 변수 70으로 설정
  float d = dist(sx1, sy1, sx2, sy2); //양의 좌표
  if(d < r + r){ //두 양이 부딪히면 (물체감지 하면)
  directionX_1 = -directionX_1; //방향 반대로
  directionX_2 = -directionX_2; //방향 반대로
  }
}

void grass(int px, int py, int unit, color cr) {//풀 그리기 코드 clr은 사용자 지정
  int line = 0; //y좌표줄
  int order = 0; //x좌표줄

  for (py=0; py<height; py+=5*unit) {
    for (px=0; px<width; px+=5*unit) {
      if (line %2 == 0) { //열이 홀수일때
        if (order%3 != 2) { // 1열 빈칸
          fill(cr);
          stroke(0);
          triangle(px+unit, py, px+unit*2, py-3*unit, px+4*unit, py); //잔디1
          triangle(px+2*unit, py, px+unit*3, py-4*unit, px+4*unit, py);//잔디2
          triangle(px+2*unit, py-3*unit, px+unit*3, py, px+5*unit, py); //잔디3
        }
      } else {                     
        if (order%3 != 0) {// 3열 빈칸 order가 첫번째일때
          fill(cr);
          triangle(px+unit, py, px+unit*2, py-3*unit, px+4*unit, py); //잔디1
          triangle(px+2*unit, py, px+unit*3, py-4*unit, px+4*unit, py);//잔디2
          triangle(px+2*unit, py-3*unit, px+unit*3, py, px+5*unit, py); //잔디3
        }
      }
      order++; //1씩 올려줌
    }
    order = 0; //올려준거 초기화
    line++; //홀짝 라인 반복
  }
}
void ground(int px, int py, int unit, color fcr1, color fcr2) { //꽃의 함수 꽃그리기
  int line = 0; //가로
  int order = 0; //세로
  for (py=0; py<height; py+=unit*5) { //반복해주기 y
    for (px=0; px<width; px+=unit*5) { //x반복
      if (line %2 == 0) {//짝수 줄일때
        if (order%3 == 1) {//x가 두번째일때
          fill(fcr1); //큰꽃 색상 1번
          noStroke();
          ellipse(px+2*unit, py-4*unit, 2.5*unit, 2.5*unit); //꽃 큰거
          fill(fcr2); //작은 꽃 색상 2번
          ellipse(px+2*unit, py-4*unit, unit, unit); //꽃 작은거
        }
      } else {
        if (order%3 == 2) { //x가 세번째일때
          fill(fcr1); //큰꽃 색상 1번
          noStroke();
          ellipse(px+2*unit, py-4*unit, 2.5*unit, 2.5*unit); //꽃 큰거
          fill(fcr2); //작은꽃 색상 2번
          ellipse(px+2*unit, py-4*unit, unit, unit); //꽃 작은거
        }
      }
      order++; //1씩 ㄱㅖ속 반복해줘야함
    }
    order = 0; //근데 초기화 해야 123 123 123 되니까
    line++; //라인 홀짝 반복하려고
  }
}

void sheepone(float x2, float y2, float unit2, int d) {//오른쪽 양 함수
  if ((x2+unit2*7>width) || (x2-unit2*7<0)){ //양쪽 벽에 닿는다면  
    directionX_2 = -directionX_2;}//방향 전환
    if(directionX_2 == -1){//오른쪽 양의 방향이 바뀌면
    //양 2
      //다리
      fill(#64644E); //다리의 색
      strokeJoin(BEVEL); //다리 둥글게 만들기 위한 코드
      noStroke();
      rect(x2-4*unit2, y2+4*unit2, unit2*1, unit2*4, 10); //앞다리 1
      rect(x2-2*unit2, y2+4*unit2, unit2*1, unit2*4, 10); //앞다리 2
      rect(x2+1*unit2, y2+4*unit2, unit2*1, unit2*4, 10); //뒷다리 1
      rect(x2+2.5*unit2, y2+4*unit2, unit2*1, unit2*4, 10); //뒷다리 2

      fill(#F0EEB8);
      noStroke();//몸통
      ellipse(x2, y2, 8*sunit, 8*sunit); //중심큰원
      ellipse(x2+5*unit2, y2-1*unit2, 4.2*unit2, 4.2*unit2); //큰원 오른쪽
      ellipse(x2+4.5*unit2, y2-3*unit2, 4.2*unit2, 4.2*unit2); //오른쪽 45도 상단
      ellipse(x2+4.5*unit2, y2+2*unit2, 4.2*unit2, 4.2*unit2); //오른쪽 45도 하단
      ellipse(x2+2*unit2, y2+3*unit2, 4.2*unit2, 4.2*unit2); //오른쪽 5시 하단
      ellipse(x2-1*unit2, y2+3*unit2, 5.2*unit2, 5.2*unit2); //오른쪽 6시 하단
      ellipse(x2-4*unit2, y2+2*unit2, 5.2*unit2, 7*unit2); //왼쪽 7시 하단
      ellipse(x2-6*unit2, y2, 3.5*unit2, 6*unit2); //왼쪽 9시 
      ellipse(x2-5*unit2, y2-2*unit2, 6*unit2, 6*unit2); //왼쪽 9시 옆에 하나 더  
      ellipse(x2-6*unit2, y2-3.5*unit2, 3.2*unit2, 4*unit2); //왼쪽 11시 상단
      ellipse(x2-4.5*unit2, y2-5*unit2, 3.5*unit2, 3.5*unit2); //왼쪽 11시 옆 상단
      ellipse(x2-2*unit2, y2-3.5*unit2, 3.2*unit2, 3.8*unit2); //왼쪽 11시 옆옆 상단
      ellipse(x2+1.5*unit2, y2-4*unit2, 5.1*unit2, 4.2*unit2); //12시

      //얼굴
      fill(#FFFFF2); //머리 색
      ellipse(x2+4*unit2, y2-1*unit2, 4.2*unit2, 5.2*unit2);//머리통
      fill(#050505);//눈
      ellipse(x2+3*unit2, y2-1.2*unit2, 0.5*unit2, 0.7*unit2); //눈 1
      ellipse(x2+5.2*unit2, y2-1.2*unit2, 0.5*unit2, 0.7*unit2); //눈 2
      noFill(); //귀 파트
      stroke(#64644E); //귀색
      strokeWeight(7); //귀 두껍게
      arc(x2+1*unit2, y2-3*unit2, unit2*3, unit2*3, 0, HALF_PI); //귀1
      arc(x2+7*unit2, y2-3*unit2, unit2*3, unit2*3, HALF_PI , PI); //귀2
      //입, 코, 인중
      strokeWeight(1);
      stroke(#0D0D0C); //줄 색상
      arc(x2+4*unit2, y2-0.2*unit2, unit2*1, unit2*1, HALF_PI, PI-HALF_PI/3);//코
      line(x2+4.3*unit2, y2+0.5*unit2, x2+4*unit2, y2+1*unit2); //인중
      arc(x2+4*unit2, y2+0.7*unit2, unit2*1, unit2*1, 0+HALF_PI/3, PI-HALF_PI/3); //입
}
  
  else if (d == -1) {//머리가 왼쪽일때
  fill(#64644E); //다리의 색
      strokeJoin(BEVEL); //다리 둥글게 만들기 위한 코드
      noStroke();
      rect(x2-4*unit2, y2+4*unit2, unit2*1, unit2*4, 10); //앞다리 1
      rect(x2-2*unit2, y2+4*unit2, unit2*1, unit2*4, 10); //앞다리 2
      rect(x2+1*unit2, y2+4*unit2, unit2*1, unit2*4, 10); //뒷다리 1
      rect(x2+2.5*unit2, y2+4*unit2, unit2*1, unit2*4, 10); //뒷다리 2

      fill(#F0EEB8);
      noStroke();//몸통
      ellipse(x2, y2, 8*sunit, 8*sunit); //중심큰원
      ellipse(x2+5*unit2, y2-1*unit2, 4.2*unit2, 4.2*unit2); //큰원 오른쪽
      ellipse(x2+4.5*unit2, y2-3*unit2, 4.2*unit2, 4.2*unit2); //오른쪽 45도 상단
      ellipse(x2+4.5*unit2, y2+2*unit2, 4.2*unit2, 4.2*unit2); //오른쪽 45도 하단
      ellipse(x2+2*unit2, y2+3*unit2, 4.2*unit2, 4.2*unit2); //오른쪽 5시 하단
      ellipse(x2-1*unit2, y2+3*unit2, 5.2*unit2, 5.2*unit2); //오른쪽 6시 하단
      ellipse(x2-4*unit2, y2+2*unit2, 5.2*unit2, 7*unit2); //왼쪽 7시 하단
      ellipse(x2-4*unit2, y2+3*unit2, 5.2*unit2, 5*unit2); //왼쪽 7시 하단
      ellipse(x2-6*unit2, y2, 3.5*unit2, 6*unit2); //왼쪽 9시 
      ellipse(x2-5*unit2, y2-2*unit2, 6*unit2, 6*unit2); //왼쪽 9시 옆에 하나 더  
      ellipse(x2-6*unit2, y2-3.5*unit2, 3.2*unit2, 4*unit2); //왼쪽 11시 상단
      ellipse(x2-4.5*unit2, y2-5*unit2, 3.5*unit2, 3.5*unit2); //왼쪽 11시 옆 상단
      ellipse(x2-2*unit2, y2-3.5*unit2, 3.2*unit2, 3.8*unit2); //왼쪽 11시 옆옆 상단
      ellipse(x2+1.5*unit2, y2-4*unit2, 5.1*unit2, 4.2*unit2); //12시

      //얼굴
      fill(#FFFFF2); //머리 색
      ellipse(x2-4*unit2, y2-1*unit2, 4.2*unit2, 5.2*unit2);//머리통
      fill(#050505);//눈
      ellipse(x2-3*unit2, y2-1.2*unit2, 0.5*unit2, 0.7*unit2); //눈 1
      ellipse(x2-5.2*unit2, y2-1.2*unit2, 0.5*unit2, 0.7*unit2); //눈 2
      noFill(); //귀 파트
      stroke(#64644E); //귀색
      strokeWeight(7); //귀 두껍게
      arc(x2-1*unit2, y2-3*unit2, unit2*3, unit2*3, HALF_PI, PI); //귀1
      arc(x2-7*unit2, y2-3*unit2, unit2*3, unit2*3, 0, HALF_PI); //귀2
      //입, 코, 인중
      strokeWeight(1);
      stroke(#0D0D0C);
      arc(x2-4*unit2, y2-0.8*unit2, unit2*1, unit2*1, HALF_PI, PI-HALF_PI/3);//코
      line(x2-4.3*unit2, y2-0.5*unit2, x2-4*unit2, y2+1*unit2); //인중
      arc(x2-4*unit2, y2+0.7*unit2, unit2*1, unit2*1, 0+HALF_PI/3, PI-HALF_PI/3); //입
  }
  if ((y2+unit2*8>height) || (y2-unit2*8<0)) { //방향 바꿔주기 함수
    directionY_2=-directionY_2; //방향
  }
}

void sheeptwo(float x, float y, float unit, int d) {//왼쪽 양 함수
  if ((x+unit*8.5>width) || (x-unit*8.5<0)){ //양쪽 벽에 닿는다면  
    directionX_1 = -directionX_1;}//방향 전환
    if(directionX_1 == -1){//왼쪽양의 방향이 바뀌면
    fill(#64644E); //다리의 색
      strokeJoin(BEVEL); //다리 둥글게 만들기 위한 코드
      noStroke();
      rect(x-4*unit, y+4*unit, unit*1, unit*4, 10); //앞다리 1
      rect(x-2*unit, y+4*unit, unit*1, unit*4, 10); //앞다리 2
      rect(x+1*unit, y+4*unit, unit*1, unit*4, 10); //뒷다리 1
      rect(x+2.5*unit, y+4*unit, unit*1, unit*4, 10); //뒷다리 2

      fill(#F0EEB8);
      noStroke();//몸통
      ellipse(x, y, 8*unit, 8*unit); //중심큰원
      ellipse(x+5*unit, y-1*unit, 4.2*unit, 4.2*unit); //큰원 오른쪽
      ellipse(x+4.5*unit, y-3*unit, 4.2*unit, 4.2*unit); //오른쪽 45도 상단
      ellipse(x+4.5*unit, y+2*unit, 4.2*unit, 4.2*unit); //오른쪽 45도 하단
      ellipse(x+2*unit, y+3*unit, 4.2*unit, 4.2*unit); //오른쪽 5시 하단
      ellipse(x-1*unit, y+3*unit, 5.2*unit, 5.2*unit); //오른쪽 6시 하단
      ellipse(2-4*unit, y+2*unit, 5.2*unit, 7*unit); //왼쪽 7시 하단
      ellipse(x-4*unit, y+3*unit, 5.2*unit, 4*unit); //왼쪽 7시 하단
      ellipse(x-6*unit, y, 3.5*unit, 6*unit); //왼쪽 9시 
      ellipse(2-5*unit, y-2*unit, 6*unit, 6*unit); //왼쪽 9시 옆에 하나 더  
      ellipse(x-6*unit, y-3.5*unit, 3.2*unit, 4*unit); //왼쪽 11시 상단
      ellipse(x-4.5*unit, y-5*unit, 3.5*unit, 3.5*unit); //왼쪽 11시 옆 상단
      ellipse(x-2*unit, y-3.5*unit, 3.2*unit, 3.8*unit); //왼쪽 11시 옆옆 상단
      ellipse(x+1.5*unit, y-4*unit, 5.1*unit, 4.2*unit); //12시

      //얼굴
      fill(#FFFFF2); //머리 색
      ellipse(x-4*unit, y-1*unit, 4.2*unit, 5.2*unit);//머리통
      fill(#050505);//눈
      ellipse(x-3*unit, y-1.2*unit, 0.5*unit, 0.7*unit); //눈 1
      ellipse(x-5.2*unit, y-1.2*unit, 0.5*unit, 0.7*unit); //눈 2
      noFill(); //귀 파트
      stroke(#64644E); //귀색
      strokeWeight(7); //귀 두껍게
      arc(x-1*unit, y-3*unit, unit*3, unit*3, HALF_PI, PI); //귀1
      arc(x-7*unit, y-3*unit, unit*3, unit*3, 0, HALF_PI); //귀2
      //입, 코, 인중
      strokeWeight(1);
      stroke(#0D0D0C);
      arc(x-4*unit, y-0.8*unit, unit*1, unit*1, HALF_PI, PI-HALF_PI/3);//코
      line(x-4.3*unit, y-0.5*unit, x-4*unit, y+1*unit); //인중
      arc(x-4*unit, y+0.7*unit, unit*1, unit*1, 0+HALF_PI/3, PI-HALF_PI/3); //입
}
  
  else if (d == +1) {//머리가 왼쪽일때
  fill(#64644E); //다리의 색
      strokeJoin(BEVEL); //다리 둥글게 만들기 위한 코드
      noStroke();
      rect(x-4*unit, y+4*unit, unit*1, unit*4, 10); //앞다리 1
      rect(x-2*unit, y+4*unit, unit*1, unit*4, 10); //앞다리 2
      rect(x+1*unit, y+4*unit, unit*1, unit*4, 10); //뒷다리 1
      rect(x+2.5*unit, y+4*unit, unit*1, unit*4, 10); //뒷다리 2

      fill(#F0EEB8);
      noStroke();//몸통
      ellipse(x, y, 8*unit, 8*unit); //중심큰원
      ellipse(x+5*unit, y-1*unit, 4.2*unit, 4.2*unit); //큰원 오른쪽
      ellipse(x+4.5*unit, y-3*unit, 4.2*unit, 4.2*unit); //오른쪽 45도 상단
      ellipse(x+4.5*unit, y+2*unit, 4.2*unit, 4.2*unit); //오른쪽 45도 하단
      ellipse(x+2*unit, y+3*unit, 4.2*unit, 4.2*unit); //오른쪽 5시 하단
      ellipse(x-1*unit, y+3*unit, 5.2*unit, 5.2*unit); //오른쪽 6시 하단
      ellipse(x-4*unit, y+2*unit, 5.2*unit, 7*unit); //왼쪽 7시 하단
      ellipse(x-4*unit, y+3*unit, 5.2*unit, 4*unit); //왼쪽 7시 하단
      ellipse(x-6*unit, y, 3.5*unit, 6*unit); //왼쪽 9시 
      ellipse(x-5*unit, y-2*unit, 6*unit, 6*unit); //왼쪽 9시 옆에 하나 더  
      ellipse(x-6*unit, y-3.5*unit, 3.2*unit, 4*unit); //왼쪽 11시 상단
      ellipse(x-4.5*unit, y-5*unit, 3.5*unit, 3.5*unit); //왼쪽 11시 옆 상단
      ellipse(x-2*unit, y-3.5*unit, 3.2*unit, 3.8*unit); //왼쪽 11시 옆옆 상단
      ellipse(x+1.5*unit, y-4*unit, 5.1*unit, 4.2*unit); //12시

      //얼굴
      fill(#FFFFF2); //머리 색
      ellipse(x+4*unit, y-1*unit, 4.2*unit, 5.2*unit);//머리통
       fill(#050505);//눈
       ellipse(x+3*unit, y-1.2*unit, 0.5*unit, 0.7*unit); //눈 1
      ellipse(x+5.2*unit, y-1.2*unit, 0.5*unit, 0.7*unit); //눈 2
      noFill(); //귀 파트
      stroke(#64644E); //귀색
      strokeWeight(7); //귀 두껍게
      arc(x+1*unit, y-3*unit, unit*3, unit*3, 0, HALF_PI); //귀1
      arc(x+7*unit, y-3*unit, unit*3, unit*3, HALF_PI, PI); //귀2
      //입, 코, 인중
      strokeWeight(1);
      stroke(#0D0D0C);
      arc(x+4*unit, y-0.8*unit, unit*1, unit*1, HALF_PI, PI-HALF_PI/3);//코
      line(x+4.3*unit, y-0.5*unit, x+4*unit, y+1*unit); //인중
      arc(x+4*unit, y+0.7*unit, unit*1, unit*1, 0+HALF_PI/3, PI-HALF_PI/3); //입
  }
  if ((y+unit*8>height) || (y-unit*7.5<0)) { //방향 바꿔주기 함수
    directionY_1=-directionY_1; //방향
  }
}

