float [] x = new float [3000];
float [] speed = new float [3000];
boolean [] visible = new boolean[3000];

//중심으로 원을 뺑글뺑글 돌리려면 중심점이 필요하다
float rpx, rpy; // circle position based on the center position + angle
float rpcx, rpcy;  // current position
float rpa=0; // angle 
float rps; // scale = radius of a circle in which redpacman moves

void setup() {
  size(480, 240);
  noStroke();
  for(int i=0; i<x.length; i++) {//0번부터 2999번까지 순서대로 하나씩 찾아보면서 
    x[i] = random(-2000, 200); //초기 위치
    speed[i] = random(0.5, 1.5);
    visible[i] = true; //Null Pointer Exception: 런타임 에러 
  }
  // initialization
  rpx = width/2;
  rpy = height/2;
  rpcx = random(0, width);
  rpcy = random(0, height);
  rps = random(height/4, height/2);
}

void draw() {
  background(0);
  
  // 3000 white pacman
 
 
  fill(255, 200);
  int count_eaten=0;
  int count_survived=0;
  for(int i=0; i<x.length; i++) {
    x[i] += speed[i]; 
    float yi = float(height)/x.length*i; 
    arc(x[i], yi, 12, 12, radians(30), radians(330)); 
    float d = dist(x[i], yi, rpx, rpy);
    if(d < 6 + 10){
      visible[i] = false;
    }
    
    
    if(visible[i]) //처음에는 visible 변수 안에 있는 300개의 공간에 모두 true 값이 저장 > true면 그림 그려줌
  {arc(x[i], yi, 12, 12, radians(30), radians(30));
    if(x[i] > width +10) count_survived += 1;}
    else{
    count_eaten += 1;
    }
  }
  println(count_eaten, count_survived);

  // red pacman
  // circle motion: x = baseline + cos(angle)*radius, y = baseline + sin(angle)*radius
  rpa += 0.1; // angle = previous_angle + speed 
  
  if(rpa >= TWO_PI) { 
    rpcx = random(0, width); // random base position at every 360 degrees
    rpcy = random(0, height); // random base position at every 360 degrees
    rps = random(height/4, height/2); // random radius (circle size) at every 360 degrees
    rpa = 0;
  }
  // constrained to be within the screen
  rpx = rpcx + cos(rpa)*rps; 
  rpx = constrain(rpx, 0+10, width-10); 
  rpy = rpcy + sin(rpa)*rps;
  rpy = constrain(rpy, 0+10, height-10);
  // draw
  fill(255, 0, 0);
  arc(rpx, rpy, 20, 20, radians(180+30), radians(360+180-30));  
} 
