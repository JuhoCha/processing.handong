size(300, 600);
for(int y = 0; y<height; y++){
  float r = 224 + (10-224)/float(height)*y;//float는 소수점까지 
  float g = 106 + (198-106)/float(height)*y;
  float b = 16 + (99-16)/float(height)*y;
  stroke(r, g, b);
  line(0, y, width, y);
}
//코드 설명 듣기
//10-224는 시작 색과 끝색이라서 height값이 커질수록 음수였던게 작아짐
