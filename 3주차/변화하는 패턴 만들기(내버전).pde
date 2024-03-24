size(480, 300);
background(#9419FA);
strokeWeight(10);
for(int i=30; i<1000; i+=50){ 
  strokeCap(SQUARE);
  stroke(#020CF7);
  line(30+i, 30, 30+i, 30+i*1/2);
}
