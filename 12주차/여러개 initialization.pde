int n_pw = 10; // total number of pinwheels to draw
float [] pwx = new float[n_pw]; // x locations of 10 pinwheels, each
float [] pwy = new float[n_pw];// y locations of 10 pinwheels, each
float [] pws = new float[n_pw]; // size of 10 pinwheels, each
float [] pwsp = new float[n_pw]; // speed of 10 pinwheels, each
float [] pwa = new float[n_pw]; // wing angle of 10 pinwheels, each 

void setup() {
  size(800, 800);
  smooth();
  noStroke();
  // initialization
  for(int i=0; i<n_pw; i++) {
    pwx[i] = random(0, width);
    pwy[i] = random(0, height);
    pws[i] = random(1, 3);
    pwsp[i] = random(0.1, 0.5);
    pwa[i] = 0; // starting angle = EAST
  }
}

void draw() {
  background(220);
  for(int i=0; i<n_pw; i++) { 
    // update the wing angles of 10 pinwheels, each 
    pwa[i] = drawPinWheel(pwx[i], pwy[i], pws[i], pwsp[i], pwa[i]);
  }
} 

float drawPinWheel(float px, float py, float ps, float psp, float pa) { 
  pushMatrix(); // transformation coordinate for Scale

  translate(px, py); // Scale center
  scale(ps); // Scale size
  
  // START of drawing
  fill(255);
  rect(0-4, 0+16, 8, 100); // post
  
  pushMatrix(); // transformation coordinate for Rotate
  translate(0, 0); // Rotate center
  pa += psp; // current angle = previous angle + speed
  rotate(pa);
  
  // four wings
  fill(200, 0, 0);
  quad(0, 0, 0, -60, 30, -20, 30, 0);
  fill(250, 250, 0);
  quad(0, 0, 60, 0, 20, 30, 0, 30);
  fill(0, 200, 0);
  quad(0, 0, 0, 60, -30, 20, -30, 0);
  fill(0, 0, 200);
  quad(0, 0, -60, 0, -20, -30, 0, -30);
  
  popMatrix(); // END of transformation coordinate for Rotate
  
  fill(255);
  ellipse(0, 0, 10, 10); // pin
  // END of drawing
  
  popMatrix(); // END of transformation coordinate for Scale
  
  return pa; // return the current angle of wings 
}
