float rux = height/40;
float ruy = height/20;
int px = 0; int py = 0;
float directionX_2 = 1; //방향 x
float directionY_2 = 1; //방향 y
float directionX_1 = 1; //방향 x
float directionY_1 = 1; //방향 y

void setup(){
  size(1200, 600);
  background(#717171);
}

void draw(){
  background(#717171);
  rain(height/40, height/20, 215);
  hero_bat();
  hero_sup();
}

void rain(float rx, float ry, color cl){
 int line = 0;
 int order = 0;
 for(float y = 0; y < height;  y += height/20){
   for(float x = 0; x < width; x += height/40){
     if(line %2 ==0){//홀수
       if(order%2 ==0){//홀수
         stroke(cl);
           line(x, y+2*ry, x+rx, y);}
             }
        else{if(order %2 ==1){
           //짝수일떈 그림 x
              }
            }
            //다른쪽 
       if(line %2 ==1){//홀수
       if(order %2 ==1){//홀수
         stroke(cl);
           line(x, y+2*ry, x+rx, y);}
             }
        else{if(order %2 ==0){
           //짝수일떈 그림 x
              }
            }
    order ++;
  }
  order = 0;
  line ++;
 }
}
  
void hero_bat(){ //왼쪽
  int d = +1;
  float unit = height/60;
  if ((px+unit*8.5>width) || (px-unit*8.5<0)){ //양쪽 벽에 닿는다면  
    directionX_1 = -directionX_1;}//방향 전환
    if(directionX_1 == -1){//왼쪽양의 방향이 바뀌면
    quad(px+12*unit, py+11*unit, px+17*unit, py+13*unit, px+17*unit, py+17*unit, px+12*unit, py+19*unit);//망토
    quad(px+13*unit, py+14*unit, px+17*unit, py+13*unit, px+17*unit, py+17*unit, px+13*unit, py+16*unit);//몸
    triangle(px+10*unit, py+14.5*unit, px+13*unit, py+14*unit, px+13*unit, py+15*unit); //윗다리
    triangle(px+10*unit, py+15.5*unit, px+13*unit, py+15*unit, px+13*unit, py+16*unit); //아랫다리
    ellipse(px+15.5*unit, py+13*unit, 3*unit, 1*unit);//왼쪽 팔
    ellipse(px+18.5*unit, py+17*unit, 3*unit, 1*unit);//오른쪽 팔
    ellipse(px+18*unit, py+15*unit, 2*unit, 2*unit);//머리통
    line(px+18*unit, py+14*unit, px+18*unit, py+16*unit);//머리선
    }
    else if (d == +1) {//머리가 왼쪽일때
    quad(px+30*unit, py+13*unit, px+35*unit, py+11*unit, px+35*unit, py+19*unit, px+30*unit, py+17*unit);//망토
    quad(px+30*unit, py+13*unit, px+34*unit, py+14*unit, px+34*unit, py+16*unit, px+30*unit, py+17*unit);//몸
    triangle(px+37*unit, py+14.5*unit, px+34*unit, py+14*unit, px+34*unit, py+15*unit); //윗다리
    triangle(px+37*unit, py+15.5*unit, px+34*unit, py+15*unit, px+34*unit, py+16*unit); //아랫다리
    ellipse(px+28.5*unit, py+13*unit, 3*unit, 1*unit);//오른쪽 팔
    ellipse(px+32.5*unit, py+17*unit, 3*unit, 1*unit);//왼쪽 팔
    ellipse(px+29*unit, py+15*unit, 2*unit, 2*unit);//머리통
    line(px+29*unit, py+14*unit, px+29*unit, py+16*unit);//머리선
    
  }
  if ((py+unit*8>height) || (py-unit*7.5<0)) { //방향 바꿔주기 함수
    directionY_1=-directionY_1; //방향
  }
}

void hero_sup(){//오른쪽
  int d = -1;
  float unit = height/60;
  if ((px+unit*7>width) || (px-unit*7<0)){ //양쪽 벽에 닿는다면  
    directionX_2 = -directionX_2;}//방향 전환
    if(directionX_2 == +1){//오른쪽 양의 방향이 바뀌면
    quad(px+30*unit, py+13*unit, px+35*unit, py+11*unit, px+35*unit, py+19*unit, px+30*unit, py+17*unit);//망토
    quad(px+30*unit, py+13*unit, px+34*unit, py+14*unit, px+34*unit, py+16*unit, px+30*unit, py+17*unit);//몸
    triangle(px+37*unit, py+14.5*unit, px+34*unit, py+14*unit, px+34*unit, py+15*unit); //윗다리
    triangle(px+37*unit, py+15.5*unit, px+34*unit, py+15*unit, px+34*unit, py+16*unit); //아랫다리
    ellipse(px+28.5*unit, py+13*unit, 3*unit, 1*unit);//오른쪽 팔
    ellipse(px+32.5*unit, py+17*unit, 3*unit, 1*unit);//왼쪽 팔
    ellipse(px+29*unit, py+15*unit, 2*unit, 2*unit);//머리통
    line(px+29*unit, py+14*unit, px+29*unit, py+16*unit);//머리선
  }
  else if (d == -1) {//머리가 왼쪽일때
  
  }
  if ((py+unit*8>height) || (py-unit*8<0)) { //방향 바꿔주기 함수
    directionY_2=-directionY_2; //방향
  }
}
