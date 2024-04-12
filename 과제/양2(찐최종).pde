void setup() {
  background(14, 103, 9);
  size(1000, 800);
  unit = height/120; //꽃과 잔디에 쓸 유닛
}

int unit;

void draw() {
  background(14, 103, 9); //배경 색
  grass(0, 0, height/120, #0BAF04 ); //풀 그리는 코드
  ground(0, 0, height/120, #DC5FFF, #FF7982 ); //꽃 그리는 코드
}

void grass(int px, int py, int unit, color cr) {//풀 그리기 코드 clr은 사용자 지정
  int line = 0;
  int order = 0;

  for (py=0; py<height; py+=5*unit) {
    for (px=0; px<width; px+=5*unit) {
      if (line %2 == 0) {               //열이 홀수일때
        if (order%3 != 2) {        // 1열 빈칸
          fill(cr);
          stroke(0);
          triangle(px+unit, py, px+unit*2, py-3*unit, px+4*unit, py); //잔디1
          triangle(px+2*unit, py, px+unit*3, py-4*unit, px+4*unit, py);//잔디2
          triangle(px+2*unit, py-3*unit, px+unit*3, py, px+5*unit, py); //잔디3
        }
      } else {                     
        if (order%3 != 0) {       // 3열 빈
          fill(cr);
          triangle(px+unit, py, px+unit*2, py-3*unit, px+4*unit, py); //잔디1
          triangle(px+2*unit, py, px+unit*3, py-4*unit, px+4*unit, py);//잔디2
          triangle(px+2*unit, py-3*unit, px+unit*3, py, px+5*unit, py); //잔디3
        }
      }
      order++;
    }
    order = 0;
    line++;
  }
}
void ground(int px, int py, int unit, color fcr1, color fcr2) {
  int line = 0;
  int order = 0;
  for (py=0; py<height; py+=unit*5) {
    for (px=0; px<width; px+=unit*5) {
      if (line %2 == 0) {
        if (order%3 == 1) {
          fill(fcr1);
          noStroke();
          ellipse(px+2*unit, py-4*unit, 2.5*unit, 2.5*unit); //꽃 큰거
          fill(fcr2);
          ellipse(px+2*unit, py-4*unit, unit, unit); //꽃 작은거
        }
      } else {
        if (order%3 == 2) {
          fill(fcr1);
          noStroke();
          ellipse(px+2*unit, py-4*unit, 2.5*unit, 2.5*unit); //꽃 큰거
          fill(fcr2);
          ellipse(px+2*unit, py-4*unit, unit, unit); //꽃 작은거
        }
      }
      order++;
    }
    order = 0;
    line++;
  }
}
