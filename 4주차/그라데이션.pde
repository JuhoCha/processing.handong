size(300, 600);
for(int y=0; y<height; y++){
  float r = 224 + (10 - 224)/float(height)*y;
  float g = 106 + (198 - 106)/float(height)*y;
  float b = 16 + (99 - 16)/float(height)*y;
  stroke(r,g,b);
  line(0, y, width, y );
}
