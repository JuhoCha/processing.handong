size(400,350);
background(0);
background(255);
//색깔의 경우 0보다 작은 숫자는 무조건 0으로, 255보다 큰 수는 무조건 255로 인식함
background(255, 0);
ellipse(132, 82, 200, 200);
ellipse(200, -16, 180, 180);
size(480,120);
stroke(153);
ellipse(132, 82, 200, 200);
stroke(204, 20, 80, 120);

strokeWeight(8);//설정에 따라 선 굵기차이
//strokeCap() 선의 양 끝을 둥글게 혹은 각지게
//strokeJoin() 모서리를 둥글게 혹은 각지게
//smooth() 스크린에 그려지는 선의 가장자리를 인접한 픽셀의 값과 혼합하여 부드럽게 처리
//noSmooth() 테두리가 거칠게 표현
//도형의 색 설정은 fill() 이 안에 gray, alpha, v1~3까지 RGB 혹은 HBS 설정 가능
