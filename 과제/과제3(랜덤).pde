void setup() {
  size(1000, 800);
  background(14, 103, 9); //땅 바탕 색
  unit = height/120;
}

int unit; //잔디에 쓸 unit을 지정함

float sunit = height/80; //양의 float
float sx = width/2; //양의 x좌표
float sy = height*3/4; //양의 y좌표

int xx = width; //꽃 부분에서 사용할 x
int yy = height; //꽃 부분에서 사용할 y

void draw() {
  background(14, 103, 9); //땅 바탕 색
  randomSeed(1);
  grass();
  flower();
}

void grass() {
  for (int i = 0; i < 100; i++) {
    float px = random(width); // 잔디의 x 좌표
    float py = random(height); // 잔디의 y 좌표
    fill(#00FF1F);
    triangle(px+unit, py, px+unit*2, py-3*unit, px+4*unit, py); //잔디1
    triangle(px+2*unit, py, px+unit*3, py-4*unit, px+4*unit, py); //잔디2
    triangle(px+2*unit, py-3*unit, px+unit*3, py, px+5*unit, py); //잔디3
  }
}

void flower() {
  for (int i = 0; i < 100; i++) {
    float px = random(width); // 잔디의 x 좌표
    float py = random(height); // 잔디의 y 좌표
    fill(random(256), random(256), random(256), random(256));  //꽃의 색
    ellipse(px+2*unit, py-4*unit, 2.5*unit, 2.5*unit); //꽃 큰거
    fill(random(256), random(256), random(256), random(256));
    ellipse(px+2*unit, py-4*unit, 0.5*unit, 0.5*unit); //꽃 작은거
    fill(#00FF1F);
    triangle(px+unit, py, px+unit*2, py-3*unit, px+4*unit, py); //잔디1
    triangle(px+2*unit, py, px+unit*3, py-4*unit, px+4*unit, py); //잔디2
    triangle(px+2*unit, py-3*unit, px+unit*3, py, px+5*unit, py); //잔디3
  }
}
