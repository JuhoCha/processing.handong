size(300, 300);
line(width/2, 0, width/2, height);
//왼쪽물고기
arc(width*1/4, width/2+10, 100, 100, PI+HALF_PI/2, PI+HALF_PI*3/2);
arc(width*1/4, width/2-10, 100, 100, HALF_PI/2, HALF_PI*3/2);
triangle(height/2-70, height/2, height/2-120, height/2+30, height/2-120, height/2-30);
//오른쪽물고기
arc(width*3/4, width/2+10, 100, 100, PI+HALF_PI/2, PI+HALF_PI*3/2);
arc(width*3/4, width/2-10, 100, 100, HALF_PI/2, HALF_PI*3/2);
triangle(width*3/4-7, height*3/4, width*3/4-50, height*3/4+30, width*3/4-50, height*3/4-30);

