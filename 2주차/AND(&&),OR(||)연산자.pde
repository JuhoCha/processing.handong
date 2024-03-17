size(600, 600);
boolean a = false; //boolean은 참거짓만 판별
int b =1, c = -1; 
if(a){}else{fill(225, 0, 0); //거짓
ellipse(width/2, height/6, 50, 50);}

if(b>0){}else{fill(255, 255, 0); //참
ellipse(width/2, height*2/6, 50, 50);}

if(b == c){}else{fill(0, 255, 0); //거짓
ellipse(width/2, height*3/6, 50, 50);}

if(a&&b!=c){}else{fill(0, 0, 255); //&&은 AND 연산자로 둘 다 참이 아니면 다 거짓
ellipse(width/2, height*4/6, 50, 50);} //!는 logical not이다

if(a||b!=c){}else{fill(255, 0, 255); //||은 OR연산자로 둘 다 거짓이 아니면 다 참
ellipse(width/2, height*5/6, 50, 50);}

