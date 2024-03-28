size(800, 800);
background(173, 231, 252);
int y = height/2; //화면의 반
fill(14, 103, 9);
rect(0, y, width, height); 
int unit = height/120;

float sunit = height/80; //양의 float
float sx = width/2; //양의 x좌표
float sy = height*3/4; //양의 y좌표

int xx = width; //꽃 부분에서 사용할것들 
int yy = height;

//잔디
for(int px = 0; px <width; px+=5*unit){
  for(int py = y; py < height; py+=5*unit){
    //비율이 다를때 꽃 나오는 코드
   if( xx < yy ){ if(px<sx-10*sunit || px>sx+10*sunit){ //화면 비율 다를때 꽃 나오고 양 주변 사라지게 하는 가로
      fill(#DC5FFF);  //꽃
      ellipse(px+2*unit, py-4*unit, 2.5*unit, 2.5*unit);
      fill(#FF7982); 
      ellipse(px+2*unit, py-4*unit, 0.5*unit, 0.5*unit);
      fill(#0BAF04); //잔디
      triangle(px+unit, py, px+unit*2, py-3*unit, px+4*unit, py);
      triangle(px+2*unit, py, px+unit*3, py-4*unit, px+4*unit, py);
      triangle(px+2*unit, py-3*unit, px+unit*3, py, px+5*unit, py);
   }
   }
   if( xx > yy ){ if( py<sy-13*sunit || py>sy+13*sunit){ //화면 비율 다를때 꽃 나오고 양 주변 사라지게 하는 세로
      fill(#DC5FFF); //꽃
      ellipse(px+2*unit, py-4*unit, 2.5*unit, 2.5*unit);
      fill(#FF7982);
      ellipse(px+2*unit, py-4*unit, 0.5*unit, 0.5*unit);
      fill(#0BAF04); //잔디
      triangle(px+unit, py, px+unit*2, py-3*unit, px+4*unit, py);
      triangle(px+2*unit, py, px+unit*3, py-4*unit, px+4*unit, py);
      triangle(px+2*unit, py-3*unit, px+unit*3, py, px+5*unit, py);
   }
   }
   //화면 비율이 같을때 나오는 코드
   if( xx == yy ){ if( py<sy-13*sunit || py>sy+13*sunit || px<sx-10*sunit || px>sx+10*sunit){ //화면 비율 다를때 꽃 나오고 양 주변 사라지게 하는 세로
      fill(#0BAF04); //잔디
      triangle(px+unit, py, px+unit*2, py-3*unit, px+4*unit, py);
      triangle(px+2*unit, py, px+unit*3, py-4*unit, px+4*unit, py);
      triangle(px+2*unit, py-3*unit, px+unit*3, py, px+5*unit, py);
   }
   }
  }
}

//양
//다리
fill(#64644E);
strokeJoin(BEVEL);
noStroke();
rect(sx-4*sunit, sy+4*sunit, sunit*1, sunit*4, 10); //앞다리 1
rect(sx-2*sunit, sy+4*sunit, sunit*1, sunit*4, 10); //앞다리 2
rect(sx+1*sunit, sy+4*sunit, sunit*1, sunit*4, 10); //뒷다리 1
rect(sx+2.5*sunit, sy+4*sunit, sunit*1, sunit*4, 10); //뒷다리 2

fill(#F0EEB8);
noStroke();//몸통
ellipse(sx, sy, 8*sunit, 8*sunit); //큰원
ellipse(sx+5*sunit, sy-1*sunit, 4.2*sunit, 4.2*sunit); //큰원 오른쪽
ellipse(sx+4.5*sunit, sy-3*sunit, 4.2*sunit, 4.2*sunit); //오른쪽 45도 상단
ellipse(sx+4.5*sunit, sy+2*sunit, 4.2*sunit, 4.2*sunit); //오른쪽 45도 하단
ellipse(sx+2*sunit, sy+3*sunit, 4.2*sunit, 4.2*sunit); //오른쪽 5시 하단
ellipse(sx-1*sunit, sy+3*sunit, 4.2*sunit, 4.2*sunit); //오른쪽 6시 하단
ellipse(sx-4*sunit, sy+2*sunit, 4.2*sunit, 6*sunit); //왼쪽 7시 하단
ellipse(sx-6*sunit, sy, 3.5*sunit, 6*sunit); //왼쪽 9시 
ellipse(sx-6*sunit, sy-3.5*sunit, 3.2*sunit, 4*sunit); //왼쪽 11시 상단
ellipse(sx-4.5*sunit, sy-5*sunit, 3.5*sunit, 3.5*sunit); //왼쪽 11시 옆 상단
ellipse(sx-2*sunit, sy-3.5*sunit, 3.2*sunit, 3.8*sunit); //왼쪽 11시 옆옆 상단
ellipse(sx+1.5*sunit, sy-4*sunit, 5.1*sunit, 4.2*sunit); //12시
//얼굴
fill(#FFFFF2); //머리 색
ellipse(sx-4*sunit, sy-1*sunit, 4.2*sunit, 5.2*sunit);//머리통
fill(#050505);//눈
ellipse(sx-3*sunit, sy-1.2*sunit, 0.5*sunit, 0.7*sunit); //눈 1
ellipse(sx-5.2*sunit, sy-1.2*sunit, 0.5*sunit, 0.7*sunit); //눈 2
noFill(); //귀 파트
stroke(#64644E); //귀색
strokeWeight(7); //귀 두껍게
arc(sx-1*sunit, sy-3*sunit, sunit*3, sunit*3, HALF_PI, PI);
arc(sx-7*sunit, sy-3*sunit, sunit*3, sunit*3, 0, HALF_PI);
//입, 코, 인중
strokeWeight(1);
stroke(#0D0D0C);
arc(sx-4*sunit, sy-0.2*sunit, sunit*1, sunit*1, HALF_PI, PI-HALF_PI/3);//코
line(sx-4.3*sunit, sy+0.5*sunit, sx-4*sunit, sy+1*sunit);
arc(sx-4*sunit, sy+0.7*sunit, sunit*1, sunit*1, 0+HALF_PI/3, PI-HALF_PI/3); //입
