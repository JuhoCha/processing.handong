size(300, 200);
for(int x = 0; x<width; x+=20){
 for(int y = 0; y<height; y+=20){
  fill((x+y)*0.5, (x+y)*0.3, (x+y)*0.8); //왜 0.5인거고 x=y값에 곱해주는지
  noStroke();
  rect(x, y, x+20, y+20); //그냥 x,y값이랑 20이라는 수 하면 x값은 계속 커질텐데 20도 그럼 그 x값에 맞추어서 커지는건가?
 }
}
