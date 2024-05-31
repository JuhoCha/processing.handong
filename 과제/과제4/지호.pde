float sheep1X, sheep1Y; // x, y location for Sheep1
int sheep1Xd, sheep1Yd; // x, y direction for Sheep1
float sheep1Xs, sheep1Ys; // x, y speed for Sheep1

float sheepUnit, grassUnit; // unit size for Sheep and Grass
float maxH;
float eventStartTime=-2000;
float currentTime = millis();
float jump_angle1;
float sheepY1;
float angle11;
float angle_direction1;

float []grassx = new float [200];
float []grassy = new float [200];

//float []sheepx
//float []sheepy
//float []sheepxd
//float []sheepyd
//float []sheepxs
//float []sheepys
//float []jump_angle
//float []angle
//float []angle_direction


void setup() {
  size(1600, 800); // screen size
  sheep1X=width*1/3;
  sheep1Y=height*2/3;// initial location for Sheep1
  sheep1Xd=+1;
  sheep1Yd=+1; // initial direction for Sheep1, down right
  sheep1Xs=random(2, 8);
  sheep1Ys=sheep1Xs*0.1; // initial speed for Sheep1, y speed is 10% of x speed
  sheepUnit=height/160;
  grassUnit=height/120;// unit size of Sheep and Grass is proportional to the screen Height
  maxH=sheepUnit*5;
  jump_angle1=0;
  sheepY1=height*2/3;
  angle11=0.0;
  angle_direction1=1;
  
  for(int i=0; i<200; i++){
    grassx[i] = random(0,width);
    grassy[i]= random(0,height);
  }
  
}

void draw() {
  
  grasses();
  
  //for(int i=0; i<100; i++){
  //  sheep(sheepx[i], sheepy[i], sheepxd[i]);
  //  sheepx[i] +=sheepxd[i]*sheeps[i];
  //}
 
  currentTime = millis();
  
  //stopping code of sheep1
  if ((currentTime - eventStartTime < 2000)) {//현재시간
  } else {
    sheep1X = sheep1X + sheep1Xd*sheep1Xs; // motion of Sheep1 in x direction
    sheep1Y = sheep1Y + sheep1Yd*sheep1Ys; // motion of Sheep1 in y direction
    jump_angle1 = jump_angle1 + sheep1Xs*0.02;
    sheepY1 = sheep1Y - abs(sin(jump_angle1))*maxH;
    angle11+=sheep1Xs*1/100*angle_direction1;
  }
  sheep(sheep1X, sheepY1, sheep1Xd, angle11); // draw Sheep1


if (sheep1X < 0+7*sheepUnit || sheep1X > width-7*sheepUnit) sheep1Xd = -sheep1Xd; // Sheep1: direction change at left and right eges
  if (sheep1Y < 0+7*sheepUnit || sheep1Y > height-7*sheepUnit) sheep1Yd = -sheep1Yd;// Sheep1: direction change at top and bottom edges

    
  // sheep1 leg_angle
  if (angle11 > PI/3) {
    angle_direction1 = -angle_direction1;
  } else if (angle11 < 0) {
    angle_direction1 = -angle_direction1;
  }
}

void grasses() { // all grasses
  background(98, 188, 76);
  for(int i=0; i<100; i++){
  grass1(grassx[i], grassy[i], false, color(207, 101, 98)); // one grass without flower
  grass1(grassx[i+100], grassy[i+100], true, color(207, 23, 131)); // one grass with flower
  }
}

void grass1(float x, float y, boolean flower, color c) {

  //randomSeed(1); //setting position of the grasses
    fill(#55792E); // grass color
    stroke(#0D0C01); // grass outline
    triangle(x, y, x-1*grassUnit, y-3*grassUnit, x-2*grassUnit, y); // grass leaf
    triangle(x+1*grassUnit, y, x, y-4*grassUnit, x-1*grassUnit, y); // grass leaf
    triangle(x+2*grassUnit, y, x-1*grassUnit, y-3*grassUnit, x, y); // grass leaf
    if (꽃) { // if there is a flower
      noStroke(); // no outline
      fill(random(256), random(256), random(256));
      //fill(c); // flower color - given as a parameter
      ellipse(x, y-4*grassUnit, 3*grassUnit, 3*grassUnit); // outer circle
      fill(#710E5C); // innor color
      ellipse(x, y-4*grassUnit, 1*grassUnit, 1*grassUnit); // inner circle
    }
  }


void sheep(float x, float y, int xd, float a) {
  noStroke(); // no outline
  fill(#6A684D); // leg color
  pushMatrix();
  translate(x, y);
  rotate(a);
  rect(-4*sheepUnit, 4*sheepUnit, 1*sheepUnit, 4*sheepUnit, 5); // leftmost leg
  rect(-2*sheepUnit, 4*sheepUnit, 1*sheepUnit, 4*sheepUnit, 5); // left leg
  popMatrix();
  pushMatrix();
  translate(x, y);
  rotate(-a);
  rect(2*sheepUnit, 4*sheepUnit, 1*sheepUnit, 4*sheepUnit, 5);// right leg
  rect(3.5*sheepUnit, 4*sheepUnit, 1*sheepUnit, 4*sheepUnit, 5);// rightmost leg
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
