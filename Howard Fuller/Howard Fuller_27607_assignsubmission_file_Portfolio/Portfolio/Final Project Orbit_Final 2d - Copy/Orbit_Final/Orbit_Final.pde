//Howard Fuller final project

float VenusAngle = 0;
float EarthAngle = 0;
float MoonAngle = 0;

void setup() {
  size(1000, 800);
}

void draw() {
  background(0, 0, 0);    // Black Space
  translate(width/2, height/2); //Puts orgin at center
  noStroke();

  fill(255, 200, 64);             
  ellipse(0, 0, 80, 80);  // The sun


  pushMatrix();

  rotate(VenusAngle);  // rotate Venus around the sun
  translate(120, 0); // move out to Venus orbit
  fill(155, 135, 95);
  ellipse(0, 0, 24, 24); //Venus


  popMatrix(); 


  rotate(EarthAngle);  // rotate around the sun
  translate(200, 0);  // move out to Earth orbit
  fill(64, 64, 255);                 
  ellipse(0, 0, 30, 30);  // Earth


  rotate(MoonAngle);  // rotate around the Earth
  translate(26, 0);
  fill(192, 192, 180);   
  ellipse(0, 0, 6, 6);  // the moon

  VenusAngle += 0.008;
  EarthAngle += 0.005;
  MoonAngle += 0.02;
}

