//float sheep1X, sheep1Y; // x, y location for Sheep1
//int sheep1Xd, sheep1Yd; // x, y direction for Sheep1
//float sheep1Xs, sheep1Ys; // x, y speed for Sheep1

float sheepUnit, grassUnit; // unit size for Sheep and Grass
float maxH;

float []grassx = new float [200];
float []grassy = new float [200];

float []sheepx = new float [100];
float []sheepy = new float [100];
int []sheepxd = new int [100];
int []sheepyd = new int [100];
float []sheepxs = new float [100];
float []sheepys = new float [100];
float []jumpy = new float [100];
float []jump_angle = new float [100];
float []angle = new float [100];
float []angle_direction = new float [100];



void setup() {
  size(1600, 800); // screen size
  maxH=sheepUnit*5;
  sheepUnit=height/160;
  grassUnit=height/120;// unit size of Sheep and Grass is proportional to the screen Height
 
 for(int i=0; i<100; i++){
  sheepx[i]=random(0+sheepUnit*7, width-sheepUnit*7);
  sheepy[i]=random(0+sheepUnit*7, width-sheepUnit*7);// initial location for Sheep1
  sheepxd[i]=+1;
  sheepyd[i]=+1; // initial direction for Sheep1, down right
  sheepxs[i]=random(2, 8);
  sheepys[i]=sheepxs[i]*0.1; // initial speed for Sheep1, y speed is 10% of x speed
  jump_angle[i]=0;
  angle[i]=0.0;
  angle_direction[i]=1;
 }
  
  for(int i=0; i<200; i++){
    grassx[i] = random(0,width);
    grassy[i]= random(0,height);
  }

}

void draw() {
  
  grasses();
  

if(keyPressed && key== 's'){
  int i = 0;
  sheep(sheepx[i], jumpy[i], sheepxd[i], angle[i]);
    sheepx[i] +=sheepxd[i]*sheepxs[i];
    sheepy[i] +=sheepyd[i]*sheepys[i];
    jump_angle[i] = jump_angle[i] + sheepxs[i]*0.02;
    sheepy[i] = sheepy[i] - abs(sin(jump_angle[i]))*maxH;
    jumpy[i] = sheepy[i] - abs(sin(jump_angle[i]))*maxH;
    angle[i]+=sheepxs[i]*1/100*angle_direction[i];
    sheepx[i] = sheepx[i] + sheepxd[i]*sheepxs[i]; // motion of Sheep1 in x direction
    sheepy[i] = sheepy[i] + sheepyd[i]*sheepys[i]; // motion of Sheep1 in y direction
    if (sheepx[i] < 0+7*sheepUnit || sheepx[i] > width-7*sheepUnit) sheepxd[i] = -sheepxd[i]; // Sheep1: direction change at left and right eges
    if (sheepy[i] < 0+7*sheepUnit || sheepy[i] > height-7*sheepUnit) sheepyd[i] = -sheepyd[i];// Sheep1: direction change at top and bottom edges
  
      textSize(10);
      fill(0, 0, 0);
      text(i, sheepx[i]-4*sheepUnit, sheepy[i]+2*sheepUnit- abs(sin(jump_angle[i]))*maxH);
}else if(keyPressed && key == 'k'){
  for(int i=0; i<100; i++){
    sheep(sheepx[i], jumpy[i], sheepxd[i], angle[i]);
    sheepx[i] +=sheepxd[i]*sheepxs[i];
    sheepy[i] +=sheepyd[i]*sheepys[i];
    jump_angle[i] = jump_angle[i] + sheepxs[i]*0.02;
    sheepy[i] = sheepy[i] - abs(sin(jump_angle[i]))*maxH;
    jumpy[i] = sheepy[i] - abs(sin(jump_angle[i]))*maxH;
    angle[i]+=sheepxs[i]*1/100*angle_direction[i];
    sheepx[i] = sheepx[i] + sheepxd[i]*sheepxs[i]; // motion of Sheep1 in x direction
    sheepy[i] = sheepy[i] + sheepyd[i]*sheepys[i]; // motion of Sheep1 in y direction
    if (sheepx[i] < 0+7*sheepUnit || sheepx[i] > width-7*sheepUnit) sheepxd[i] = -sheepxd[i]; // Sheep1: direction change at left and right eges
    if (sheepy[i] < 0+7*sheepUnit || sheepy[i] > height-7*sheepUnit) sheepyd[i] = -sheepyd[i];// Sheep1: direction change at top and bottom edges
  
      textSize(10);
      fill(0, 0, 0);
      text(i, sheepx[i]-4*sheepUnit, sheepy[i]+2*sheepUnit);
    
        // sheep1 leg_angle
        if (angle[i] > PI/3) {
          angle_direction[i] = -angle_direction[i];
        } else if (angle[i] < 0) {
          angle_direction[i] = -angle_direction[i];
        }
    }
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
    if (flower) { // if there is a flower
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
