// Ben Bailey
// 20140909

void setup() {
  size(480, 480);
  background(255, 255, 255, 20);
  noStroke();
  //noLoop();
}

int z = 0;

void circle(float x, float y, float diameter, float r, float g, float b, float t) {
  fill(r, g, b, t);
  ellipse(x, y, diameter, diameter);
}

void draw() {
  if(z >= 255) {
    z = 0;
  }
  background(z, z, z);
  for(int i = 0; i < 480; i++){
    circle(i, i, 80, random(255), random(255), random(255), random(255));
    circle(width-i, i, 80, random(255), random(255), random(255), random(255));
  }
  z = z + 5;
}
