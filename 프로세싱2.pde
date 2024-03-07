//도형 그리기 모드 변경
// rectMode()나 ellipseMode()를 사용해 각각 rect()와 ellipse()의 파라메터 정의를 변경 가능
//corner 왼쪽 위 꼭지점 기준, 그 다음 두 파라메터는 각각 너비와 높이를 나타냄
//corners: rect() 혹은 ellipse()의 네 파라메터가 왼쪽 위 꼭지점과 오른쪽 아래 꼭지점 의미함
//center: 가운데 점 기준, 그 다음 두 파라메터는 각각 너비와 높이를 나타냄
//radius 가운데 점 기준

size(300, 400);
rectMode(CORNER); //default
fill(255);//white
rect(25, 25, 50, 50); //왼쪽 위 x,y,너비,높이

rectMode(RADIUS);
fill(255);
rect(25, 25, 50, 50); 

ellipseMode(RADIUS);
fill(255);
ellipse(50, 50, 30, 30);

ellipseMode(CORNER);
fill(255);
ellipse(25, 25, 30, 30);
