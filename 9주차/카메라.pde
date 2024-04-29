size(400, 200);
float x = width/2, y = height/2;
translate(x, y);// 카메라 중심을 미리 잡아줌 -> 하트가 있는 지점에 카메라 (0, 0) 초점을 맞춤
rotate(radians(90)); //스케치북 전체가 돌아갔으니 그림이 눈에 보이는 screen frame 바깥으로 나가버림
arc(x-50, y, 100, 100, PI, TWO_PI); //하트 그림을 카메라에 맞춰서 그려야함
arc(x+50, y, 100, 100, PI, TWO_PI);
arc(x, y, 200, 200, 0, PI);
