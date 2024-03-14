size(300, 300);
float x = width/2;
float y = height/2;
arc(x, y+30, 200, 200, PI+HALF_PI/2, PI+HALF_PI*3/2);
arc(x, y-30, 200, 200, HALF_PI/2, HALF_PI*3/2);
triangle(x+30, y, x+100, y+50, x+100, y-50);
