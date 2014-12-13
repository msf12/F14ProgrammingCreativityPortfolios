void setup() {
  size(600,400,P3D);
  smooth();
  background(255);

}

int radius = 100;
void draw() {
fill(200);
stroke(150);

  translate(width/2,height/2);
  rotateY(radians(mouseX));
  rotateZ(radians(mouseY));
  background(255);

  for (int i = 1; i < 35; i++){
    for (int j = 0; j < 35; j++){
pushMatrix();
strokeWeight(1);
stroke(1);
if(i==20){
  strokeWeight(4);
  stroke(255,0,0);
}
if(j==20){
  strokeWeight(4);
  stroke(255,0,255);
}

  float cx = cos(i) * sin(j)*radius ;
  float cy = cos(j)*radius;
  float cz = sin(i) * sin(j)*radius; 
 
    point(cx,cy,cz);
popMatrix();
    }
  }

} 

