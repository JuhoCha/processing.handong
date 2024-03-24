size(400, 400);
//for(int z=25; z<height; z+=25){이건 왜 안되는지 여쭤보기 z써서 원의 지름 크기 조절하고싶었는데
  for(int x=25; x<width; x+=25){ //원의 중심
    for(int y=25; y<height; y+=25){
      fill(x/25*15);
      ellipse(x,y, y/25, y/25);
    }
  }
//}
