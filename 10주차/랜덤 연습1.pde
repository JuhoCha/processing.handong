void setup(){
  size(1000, 800);
}

void draw(){//1초에 60번씩 자동으로 실행되면서, 화면을 새로 고침
  background(102, 201, 100);
  randomSeed(1);//랜덤 숫자가 결정되는 순서(패턴)는 고정
  ellipse(random(width), random(height), 100, 100);//화면이 새로 그려질때마다 새로운 위치 랜덤 값을 가지게 됨
//랜덤하게 정하기는 하는데, 안정적으로 한번 정한 것을 계속 쓰고 싶다면???
//(1) 쉬운 해결책: randomSeed: 테스트 할때는 좋음. 그러나 랜덤을 쓰는 이유는 예측불가능하게 하고싶어서 그럼. 근데 이건 고정됨
//(2)
}
