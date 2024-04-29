void setup(){
  size(300, 200);
  background(80, 100, 200);
  smooth();
  translate(width/2, height/2);
 }

float r_degree=0;
int count = 0;

void draw(){
  if(count == 36) {
    background(80, 100, 200);
    count = 0;
  }
  smooth();
  translate(width/2, height/2);
  strokeWeight(8);
  stroke(250, 200, 50);
  //시스템이 미리 정의한 함수, 변수가 아니라면 사용자가 미리 정의한 함수, 변수
  //변수: 타입 이름 = 초기값 ==> 이런식의 정의 없이 어떤 이름을 쓴다면 the variable does not exist 에러 발생
  //for(int i = 0; i<36; i++){
    r_degree = r_degree+10;
    rotate(radians(r_degree)); //회전하는 애니메이션 - 회전량이 변화하도록 만들어야 함
    line(0, 0, 0, 70);
    count ++;//36개 그려지면 되니까 지금 몇개 그려졌는지 세기
    //}
}


