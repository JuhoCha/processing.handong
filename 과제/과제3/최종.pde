float sheep1X, sheep1Y; // x, y location for Sheep1
int sheep1Xd, sheep1Yd; // x, y direction for Sheep1
float sheep1Xs, sheep1Ys; // x, y speed for Sheep1

float sheep2X, sheep2Y;// x, y location for Sheep2
int sheep2Xd, sheep2Yd;// x, y direction for Sheep2
float sheep2Xs, sheep2Ys;// x, y speed for Sheep2

float sheepUnit, grassUnit; // unit size for Sheep and Grass
float maxH;
int currentTime = millis();
int nFreeze = 0;
int eventStartTime = -2000;
float duration;
float jump_angle1;
float jump_angle2;
float sheepY1;
float sheepY2;
float angle1;
float angle2;
float angle_direct1;
float angle_direct2;

void setup() {
  size(1000, 800); // screen size
  sheep1X=width*1/3;
  sheep1Y=height*2/3;// initial location for Sheep1
  sheep1Xd=+1;
  sheep1Yd=+1; // initial direction for Sheep1, down right
  sheep1Xs=random(3, 6);//속도 랜덤 3~6
  sheep1Ys=sheep1Xs*0.1; // initial speed for Sheep1, y speed is 10% of x speed
  sheep2X=width*3/4;
  sheep2Y=height*2/3;// initial location for Sheep2
  sheep2Xd=-1;
  sheep2Yd=+1;// initial direction for Sheep2, down left
  sheep2Xs=random(2, 4); //속도 랜덤 2~4
  sheep2Ys=sheep2Xs*0.1;// initial speed for Sheep2, y speed is 10% of x speed
  sheepUnit=height/80;
  grassUnit=height/120;// unit size of Sheep and Grass is proportional to the screen Height
  maxH=sheepUnit*5;
  jump_angle1=0;
  jump_angle2=0;
  sheepY1=height*2/3;
  sheepY2=height*2/3;
  angle1 = 0.0;
  angle2=0.0;
  angle_direct1=1;
  angle_direct2=1;
}

void draw() {

  grasses();
  
  if (sheep1X < 0+7*sheepUnit || sheep1X > width-7*sheepUnit) sheep1Xd = -sheep1Xd; // Sheep1: direction change at left and right eges
  if (sheep1Y < 0+7*sheepUnit || sheep1Y > height-7*sheepUnit) sheep1Yd = -sheep1Yd;// Sheep1: direction change at top and bottom edges

  if (sheep2X < 0+7*sheepUnit || sheep2X > width-7*sheepUnit) sheep2Xd = -sheep2Xd;// Sheep2: direction change at left and right eges
  if (sheep2Y < 0+7*sheepUnit || sheep2Y > height-7*sheepUnit) sheep2Yd = -sheep2Yd;// Sheep2: direction change at top and bottom edges


//양의 움직임
  float d=dist(sheep1X, sheep1Y, sheep2X, sheep2Y);// distance between Sheep1 and Sheep2
  if (d < 7*sheepUnit + 7*sheepUnit) {// if it is shorter than the sum of radius of two bodies
    sheep1Xd = -sheep1Xd;// change x direction of Sheep1
    sheep2Xd = -sheep2Xd;// change x direction of Sheep2
    eventStartTime = currentTime;//타이머 쓰려고
  }
  currentTime = millis();

//양 1 멈추는 코드 (타이머)
  if ((currentTime - eventStartTime < 2000)) { //현재시간
  } else {
    sheep1X = sheep1X +8*sheep1Xd;
    sheep1Y = sheep1Y +0.8 * sheep1Yd;
    jump_angle1 = jump_angle1 + sheep1Xs*0.02;
    sheepY1 = sheep1Y - abs(sin(jump_angle1))*maxH;
    angle1+=sheep1Xs*1/100*angle_direct1;
  }
  sheep(sheep1X, sheepY1, sheep1Xd, angle1); // draw Sheep1

//양 2 멈추는 코드 (타이머)
  if ((currentTime - eventStartTime > 1000 && currentTime - eventStartTime < 2000 ))  { //오른쪽 양
  } else {
    sheep2X = sheep2X +8*sheep2Xd;
    sheep2Y = sheep2Y +0.8 * sheep2Yd;
    jump_angle2 = jump_angle2 + sheep2Xs*0.02;
    sheepY2 = sheep2Y - abs(sin(jump_angle2))*maxH;
    angle2+=sheep2Xs*1/100*angle_direct2;
  }
  sheep(sheep2X, sheepY2, sheep2Xd, angle2); // draw Sheep2r
  
  //다리 앵글 
    if(angle1>PI/3){
      angle_direct1=-angle_direct1;
      angle1=PI/3;
    } else if(angle1<0){
      angle_direct1=-angle_direct1;
      angle1=0;
    }
    if(angle2>PI/3){
      angle_direct2=-angle_direct2;
      angle2=PI/3;
    } else if(angle2<0){
      angle_direct2=-angle_direct2;
      angle2=0;
    }


}

void grasses() { // all grasses
  background(98, 188, 76);
  grass1(width/2, height*2/3, false, color(207, 101, 98)); // one grass without flower
  grass1(width/2+grassUnit*5, height*2/3, true, color(207, 23, 131)); // one grass with flower
}

void grass1(float x, float y, boolean flower, color c) {
  randomSeed(1); //setting position of the grasses
  for (int i=0; i<100; i++) { //draw 100 random grasses
    x = random(width);
    y = random(height);
    fill(#00FF92); // grass color
    stroke(#0D0C01); // grass outline
    triangle(x, y, x-1*grassUnit, y-3*grassUnit, x-2*grassUnit, y); // grass leaf
    triangle(x+1*grassUnit, y, x, y-4*grassUnit, x-1*grassUnit, y); // grass leaf
    triangle(x+2*grassUnit, y, x-1*grassUnit, y-3*grassUnit, x, y); // grass leaf
    if (flower) { // if there is a flower
      noStroke(); // no outline
      fill(random(256), random(256), random(256));
      //fill(c); // flower color - given as a parameter
      ellipse(x, y-4*grassUnit, 3*grassUnit, 3*grassUnit); // outer circle
      fill(#710E5C); // innor color
      ellipse(x, y-4*grassUnit, 1*grassUnit, 1*grassUnit); // inner circle
    }
  }
}

void sheep(float x, float y, int xd, float an) {
  noStroke(); // no outline
  fill(#6A684D); // leg color
 
  pushMatrix();//오른다리
  translate(x, y);
  rotate(-an);
  rect(2*sheepUnit, 4*sheepUnit, 1*sheepUnit, 4*sheepUnit, 5);// right leg
  rect(3.5*sheepUnit, 4*sheepUnit, 1*sheepUnit, 4*sheepUnit, 5);// rightmost leg
  popMatrix();
  pushMatrix();//왼다리
  translate(x, y);
  rotate(an);
  rect(-4*sheepUnit, 4*sheepUnit, 1*sheepUnit, 4*sheepUnit, 5); // leftmost leg
  rect(-2*sheepUnit, 4*sheepUnit, 1*sheepUnit, 4*sheepUnit, 5); // left leg
  popMatrix();
  
  
  fill(#CBC9A0); // body color
  ellipse(x, y, 8*sheepUnit, 8*sheepUnit); // body
  ellipse(x-3.5*sheepUnit, y-2*sheepUnit, 4*sheepUnit, 4*sheepUnit); // fur12
  ellipse(x-6*sheepUnit, y+0*sheepUnit, 3*sheepUnit, 6*sheepUnit);  // fur11
  ellipse(x-4*sheepUnit, y+2*sheepUnit, 4*sheepUnit, 5.5*sheepUnit);  // fur10
  ellipse(x-1*sheepUnit, y+3*sheepUnit, 4*sheepUnit, 4*sheepUnit);  // fur9
  ellipse(x+2*sheepUnit, y+3*sheepUnit, 4*sheepUnit, 4*sheepUnit);  // fur8
  ellipse(x+4*sheepUnit, y+2*sheepUnit, 4*sheepUnit, 4*sheepUnit);  // fur7
  ellipse(x+5*sheepUnit, y-1*sheepUnit, 4*sheepUnit, 4*sheepUnit);  // fur6
  ellipse(x+4*sheepUnit, y-3*sheepUnit, 4*sheepUnit, 4*sheepUnit);  // fur5
  ellipse(x+1.5*sheepUnit, y-3.5*sheepUnit, 5*sheepUnit, 4*sheepUnit);  // fur4

  sheepFace(x, y, xd);
}

void sheepFace(float x, float y, int xd) {
  fill(#E5E4D5);// face color
  ellipse(x+xd*4*sheepUnit, y-1*sheepUnit, 4*sheepUnit, 6*sheepUnit);//face at different locations according to the direction

  stroke(#6A684D);// ear color
  strokeWeight(10);// ear thickness
  noFill();// no fill for ear arc
  // right ear when it looks at the right direction, left ear when it looks at the left direction
  arc(x+xd*8*sheepUnit, y-3*sheepUnit, 4*sheepUnit, 4*sheepUnit, radians(50+xd*50), radians(130+xd*50));
  // left ear when it looks at the right direction, right ear when it looks at the left direction
  arc(x+xd*0*sheepUnit, y-3*sheepUnit, 4*sheepUnit, 4*sheepUnit, radians(50-xd*50), radians(130-xd*50));

  strokeWeight(1);// eye outline
  fill(#0D0C01); // eye color
  // right eye when it looks at the right direction, left eye when it looks at the left direction
  ellipse(x+xd*5.2*sheepUnit, y-1.2*sheepUnit, 0.5*sheepUnit, 1*sheepUnit); //
  // left eye when it looks at the right direction, right eye when it looks at the left direction
  ellipse(x+xd*3.2*sheepUnit, y-1.2*sheepUnit, 0.5*sheepUnit, 1*sheepUnit);

  noFill(); // no fill for nose and lip arc
  stroke(#0D0C01); // nose and lip color
  strokeWeight(1); // nose and lip thickness
  arc(x+xd*4*sheepUnit, y-1*sheepUnit, 2.5*sheepUnit, 2.5*sheepUnit, radians(80-xd*15), radians(100-xd*15)); // nose according to the direction
  line(x+xd*4.4*sheepUnit, y+0.2*sheepUnit, x+xd*4.3*sheepUnit, y+0.8*sheepUnit); // lip vertical line according to the direction
  arc(x+xd*4*sheepUnit, y-1*sheepUnit, 3*sheepUnit, 4*sheepUnit, radians(70-xd*10), radians(110-xd*10));  // lip according to the direction

  noStroke();// no outline
  fill(#CBC9A0);// fur color
  ellipse(x+xd*2*sheepUnit, y-4.5*sheepUnit, 3*sheepUnit, 4*sheepUnit);  // fur3
  ellipse(x+xd*4*sheepUnit, y-5*sheepUnit, 4*sheepUnit, 4*sheepUnit);  // fur2
  ellipse(x+xd*6*sheepUnit, y-3.5*sheepUnit, 2*sheepUnit, 4*sheepUnit);  // fur1
}
