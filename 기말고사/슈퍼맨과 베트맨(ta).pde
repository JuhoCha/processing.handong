//변수 설정할때 오타 조심
int side;
int unit;
float[] heroX;
float[] heroY;
int[] heroXD;
int[] heroYD;
float[] heroXS;
float[] heroYS;
boolean[] turning;
float[] angle;

void setup(){
size(1200, 600);
  side = height/20;
  unit = height/60;
  slide =1;
  
}

void draw(){
  background(90);
  
  stroke(200);
  for(int i=0; i<100; i++){
    float x = random(0, width);
    float y = random(0, height);
    line(x+side*1/2, y, x, y+side*2);
  }
 
 whiteBox(slide);
   if(slide>0) return;
   
   for(int i = 0; i<Bat_num+Sup_num; i++){
     if(turning[i] == false){
       heroX[i] += heroXS[i]*heroXD[i];
       heroY[i] += heroYS[i]*heroYD[i];
       if(i<Bat_num) drawSuperhero(heroX[i], heroY[i], heroXD[i], color(0), color(0), unit);
       else drawSuperhero(heroX[i], heroY[i], heroXD[i], color(255, 0, 0), color(0, 0, 255), unit);
       if(heroY[i]<0+unit*4 || heroY[i]>height-unit*4) heroYD[i] =-heroYD[i];
       if(heroX[i]<0+unit*5 || heroX[i]>width-unit*5) turning[i] = true;
     }else if(turning[i] == true){
       angle[i]+=heroXS[i]*0.01*heroXD[i];
       pushMatrix();//여기 안에서는 좌표 값 0으로 바꿔줘야함 왜? translate는 화면 좌표를 당겨오는 함수라서
       translate(heroX[i], heroY[i]);
       rotate(angle[i]);
     if(i<Bat_num) drawSuperhero(0, 0, heroXD[i], color(0), color(0), unit);
     else drawSuperhero(0, 0, heroXD[i], color(255, 0, 0), color(0, 0, 255), unit);
     popMatrix();  
     if(angle[i]>PI || angle[i]<-PI){
       turning[i] = false;
       heroXD[i] = -heroXD[i];
       angle[i] = 0;
     }
   }  
 }
}


int slide;
void whiteBox(int sl){
  if(slide ==1){
       rectMode(CENTER);
       fill(255, 128);
       rect(width/2, height/2, width/2, height/2);
       rectMode(CORNERS);
       
       drawSuperhero(width/2-width/8, height/2, -1, color(0), color(0), unit);
       textSize(48);
       textAlign(LEFT, CENTER);
       text("How many batman", width/2, height/4, width*3/4, height*3/4);
    }else if(slide ==2){
       rectMode(CENTER);
       fill(255, 128);
       rect(width/2, height/2, width/2, height/2);
       rectMode(CORNERS);
       
       drawSuperhero(width/2-width/8, height/2, 1, color(255,0,0), color(0,0,255), unit);
       textSize(48);
       textAlign(LEFT, CENTER);
       text("How many Superman", width/2, height/4, width*3/4, height*3/4);
      }
    }

      int Bat_num, Sup_num, total =0;
  void keyPressed(){
    if(key>='1' && key<='9'){
      if(slide == 1){
        Bat_num = key - '0';
        slide = 2;
      }else if(slide == 2){
        Sup_num = key - '0';
        slide = 0;
        total = Bat_num + Sup_num;
        
        heroX = new float[total];
        heroY = new float[total];
        heroXD = new int[total];
        heroYD = new int[total];
        heroXS = new float[total];
        heroYS = new float[total];
        turning = new boolean[total];
        angle = new float[total];
        
        for(int i=0; i<total; i++){
          heroX[i] = random(0+unit*5, width-unit*5);
          heroY[i] = random(0+unit*4, height-unit*4);
          heroXS[i] = random(2, 4);
          heroYS[i] = random(2, 4);
          turning[i] = false;
          angle[i] = 0;
        }
        
        for(int i =0; i<Bat_num; i++){
          heroXD[i]=-1;
          heroYD[i]=-1;
        }
        
        for(int i=Bat_num; i<total; i++){
        heroXD[i]=1;
        heroYD[i]=1;
        }
      }  
    }
  }


void drawSuperhero(float sx, float sy, int sd, color sc1, color sc2, int ut){
  stroke(255);
  fill(sc1);
  quad(sx+sd*2*ut, sy-2*ut, sx+sd*2*ut, sy+2*ut, sx-sd*3*ut, sy+4*ut, sx-sd*3*ut, sy-4*ut);
  fill(sc2);
  quad(sx-sd*2*ut, sy+1*ut, sx+sd*2*ut, sy+2*ut, sx+sd*2*ut, sy-2*ut, sx-sd*2*ut, sy-1*ut);
  triangle(sx-sd*5*ut, sy-0.5*ut, sx-sd*2*ut, sy, sx-sd*2*ut, sy-1*ut);
  triangle(sx-sd*5*ut, sy+0.5*ut, sx-sd*2*ut, sy, sx-sd*2*ut, sy+1*ut);
  ellipse(sx+sd*3.5*ut, sy-2*ut, 3*ut, 1*ut);
  ellipse(sx+sd*0.5*ut, sy+2*ut, 3*ut, 1*ut);
  fill(232, 185, 135);
  arc(sx+sd*3*ut, sy, 2*ut, 2*ut, PI+HALF_PI, TWO_PI+HALF_PI);
  fill(0);
  arc(sx+sd*3*ut, sy, 2*ut, 2*ut, HALF_PI, PI+HALF_PI);
}
