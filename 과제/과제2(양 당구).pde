  void setup(){
    size(1000, 800);
    background(14, 103, 9); //땅의 바탕 색
    unit = height/120;
  }

//int unit = height/120; //잔디에 쓸 unit을 지정함
int unit;
float sunit = height/80; //양의 float
float sx1 = width*3/4; //양1의 x좌표 (오른쪽)
float sy1 = height*2/3; //양1의 y좌표
float sx2 = width*1/3; //양2의 x좌표 (왼쪽)
float sy2 = height*2/3; //양2의 y좌표

int xx = width; //꽃 부분에서 사용할 x 
int yy = height; //꽃 부분에서 사용할 y



void draw(){
  background(14, 103, 9); //땅의 바탕 색
  //잔디
    
    //꽃
    //for(float fx = 0; fx<width; fx+=5){
    //  for(float fy = 0; fy<height; fy+=5){
    //  fill(#DC5FFF);  //꽃의 색
    //  ellipse(fx+2*unit, fy-4*unit, 2.5*unit, 2.5*unit); //꽃 큰거
    //  fill(#FF7982); 
    //  ellipse(fx+2*unit, fy-4*unit, 0.5*unit, 0.5*unit); //꽃 작은거
    //  fill(#0BAF04); //잔디의 색
    //  triangle(fx+unit, fy, fx+unit*2, fy-3*unit, fx+4*unit, fy); //잔디1
    //  triangle(fx+2*unit, fy, fx+unit*3, fy-4*unit, fx+4*unit, fy); //잔디2
    //  triangle(fx+2*unit, fy-3*unit, fx+unit*3, fy, fx+5*unit, fy); //잔디3 
    //  }
    //}
    for(float py = 0; py<height; py+=(5*unit)){
      for(float px = 0; px<width; px+=5*unit){
       //잔디
         if((py/(5*unit)) % 2 != 0){ //
           if((px/(5*unit)) % 3 != 0){
             triangle(px+unit, py, px+unit*2, py-3*unit, px+4*unit, py); //잔디1
             triangle(px+2*unit, py, px+unit*3, py-4*unit, px+4*unit, py); //잔디2
             triangle(px+2*unit, py-3*unit, px+unit*3, py, px+5*unit, py); //잔디3
           }
         }
         else{
           if(((px+(5*unit))/(5*unit)) % 3 != 0){
             triangle(px+unit, py, px+unit*2, py-3*unit, px+4*unit, py); //잔디1
             triangle(px+2*unit, py, px+unit*3, py-4*unit, px+4*unit, py); //잔디2
             triangle(px+2*unit, py-3*unit, px+unit*3, py, px+5*unit, py); //잔디3
           }
         }
        }
    }
    
  
      //양 1
      //다리
      fill(#64644E); //다리의 색
      strokeJoin(BEVEL); //다리 둥글게 만들기 위한 코드
      noStroke();
      rect(sx1-4*sunit, sy1+4*sunit, sunit*1, sunit*4, 10); //앞다리 1
      rect(sx1-2*sunit, sy1+4*sunit, sunit*1, sunit*4, 10); //앞다리 2
      rect(sx1+1*sunit, sy1+4*sunit, sunit*1, sunit*4, 10); //뒷다리 1
      rect(sx1+2.5*sunit, sy1+4*sunit, sunit*1, sunit*4, 10); //뒷다리 2

      fill(#F0EEB8);
      noStroke();//몸통
      ellipse(sx1, sy1, 8*sunit, 8*sunit); //중심큰원
      ellipse(sx1+5*sunit, sy1-1*sunit, 4.2*sunit, 4.2*sunit); //큰원 오른쪽
      ellipse(sx1+4.5*sunit, sy1-3*sunit, 4.2*sunit, 4.2*sunit); //오른쪽 45도 상단
      ellipse(sx1+4.5*sunit, sy1+2*sunit, 4.2*sunit, 4.2*sunit); //오른쪽 45도 하단
      ellipse(sx1+2*sunit, sy1+3*sunit, 4.2*sunit, 4.2*sunit); //오른쪽 5시 하단
      ellipse(sx1-1*sunit, sy1+3*sunit, 5.2*sunit, 5.2*sunit); //오른쪽 6시 하단
      ellipse(sx1-4*sunit, sy1+2*sunit, 5.2*sunit, 7*sunit); //왼쪽 7시 하단
      ellipse(sx1-6*sunit, sy1, 3.5*sunit, 6*sunit); //왼쪽 9시 
      ellipse(sx1-5*sunit, sy1-2*sunit, 6*sunit, 6*sunit); //왼쪽 9시 옆에 하나 더  
      ellipse(sx1-6*sunit, sy1-3.5*sunit, 3.2*sunit, 4*sunit); //왼쪽 11시 상단
      ellipse(sx1-4.5*sunit, sy1-5*sunit, 3.5*sunit, 3.5*sunit); //왼쪽 11시 옆 상단
      ellipse(sx1-2*sunit, sy1-3.5*sunit, 3.2*sunit, 3.8*sunit); //왼쪽 11시 옆옆 상단
      ellipse(sx1+1.5*sunit, sy1-4*sunit, 5.1*sunit, 4.2*sunit); //12시

      //얼굴
      fill(#FFFFF2); //머리 색
      ellipse(sx1-4*sunit, sy1-1*sunit, 4.2*sunit, 5.2*sunit);//머리통
      fill(#050505);//눈
      ellipse(sx1-3*sunit, sy1-1.2*sunit, 0.5*sunit, 0.7*sunit); //눈 1
      ellipse(sx1-5.2*sunit, sy1-1.2*sunit, 0.5*sunit, 0.7*sunit); //눈 2
      noFill(); //귀 파트
      stroke(#64644E); //귀색
      strokeWeight(7); //귀 두껍게
      arc(sx1-1*sunit, sy1-3*sunit, sunit*3, sunit*3, HALF_PI, PI); //귀1
      arc(sx1-7*sunit, sy1-3*sunit, sunit*3, sunit*3, 0, HALF_PI); //귀2
      //입, 코, 인중
      strokeWeight(1);
      stroke(#0D0D0C);
      arc(sx1-4*sunit, sy1-0.2*sunit, sunit*1, sunit*1, HALF_PI, PI-HALF_PI/3);//코
      line(sx1-4.3*sunit, sy1+0.5*sunit, sx1-4*sunit, sy1+1*sunit);
      arc(sx1-4*sunit, sy1+0.7*sunit, sunit*1, sunit*1, 0+HALF_PI/3, PI-HALF_PI/3); //입
      
      
      //양 2
      //다리
      fill(#64644E); //다리의 색
      strokeJoin(BEVEL); //다리 둥글게 만들기 위한 코드
      noStroke();
      rect(sx2-4*sunit, sy2+4*sunit, sunit*1, sunit*4, 10); //앞다리 1
      rect(sx2-2*sunit, sy2+4*sunit, sunit*1, sunit*4, 10); //앞다리 2
      rect(sx2+1*sunit, sy2+4*sunit, sunit*1, sunit*4, 10); //뒷다리 1
      rect(sx2+2.5*sunit, sy2+4*sunit, sunit*1, sunit*4, 10); //뒷다리 2

      fill(#F0EEB8);
      noStroke();//몸통
      ellipse(sx2, sy2, 8*sunit, 8*sunit); //중심큰원
      ellipse(sx2+5*sunit, sy2-1*sunit, 4.2*sunit, 4.2*sunit); //큰원 오른쪽
      ellipse(sx2+4.5*sunit, sy2-3*sunit, 4.2*sunit, 4.2*sunit); //오른쪽 45도 상단
      ellipse(sx2+4.5*sunit, sy2+2*sunit, 4.2*sunit, 4.2*sunit); //오른쪽 45도 하단
      ellipse(sx2+2*sunit, sy2+3*sunit, 4.2*sunit, 4.2*sunit); //오른쪽 5시 하단
      ellipse(sx2-1*sunit, sy2+3*sunit, 5.2*sunit, 5.2*sunit); //오른쪽 6시 하단
      ellipse(sx2-4*sunit, sy2+2*sunit, 5.2*sunit, 7*sunit); //왼쪽 7시 하단
      ellipse(sx2-6*sunit, sy2, 3.5*sunit, 6*sunit); //왼쪽 9시 
      ellipse(sx2-5*sunit, sy2-2*sunit, 6*sunit, 6*sunit); //왼쪽 9시 옆에 하나 더  
      ellipse(sx2-6*sunit, sy2-3.5*sunit, 3.2*sunit, 4*sunit); //왼쪽 11시 상단
      ellipse(sx2-4.5*sunit, sy2-5*sunit, 3.5*sunit, 3.5*sunit); //왼쪽 11시 옆 상단
      ellipse(sx2-2*sunit, sy2-3.5*sunit, 3.2*sunit, 3.8*sunit); //왼쪽 11시 옆옆 상단
      ellipse(sx2+1.5*sunit, sy2-4*sunit, 5.1*sunit, 4.2*sunit); //12시

      //얼굴
      fill(#FFFFF2); //머리 색
      ellipse(sx2+4*sunit, sy2-1*sunit, 4.2*sunit, 5.2*sunit);//머리통
      fill(#050505);//눈
      ellipse(sx2+3*sunit, sy2-1.2*sunit, 0.5*sunit, 0.7*sunit); //눈 1
      ellipse(sx2+5.2*sunit, sy2-1.2*sunit, 0.5*sunit, 0.7*sunit); //눈 2
      noFill(); //귀 파트
      stroke(#64644E); //귀색
      strokeWeight(7); //귀 두껍게
      arc(sx2+1*sunit, sy2-3*sunit, sunit*3, sunit*3, HALF_PI, PI); //귀1
      arc(sx2+7*sunit, sy2-3*sunit, sunit*3, sunit*3, 0, HALF_PI); //귀2
      //입, 코, 인중
      strokeWeight(1);
      stroke(#0D0D0C);
      arc(sx2+4*sunit, sy2-0.2*sunit, sunit*1, sunit*1, HALF_PI, PI-HALF_PI/3);//코
      line(sx2+4.3*sunit, sy2+0.5*sunit, sx2+4*sunit, sy2+1*sunit);
      arc(sx2+4*sunit, sy2+0.7*sunit, sunit*1, sunit*1, 0+HALF_PI/3, PI-HALF_PI/3); //입
}

