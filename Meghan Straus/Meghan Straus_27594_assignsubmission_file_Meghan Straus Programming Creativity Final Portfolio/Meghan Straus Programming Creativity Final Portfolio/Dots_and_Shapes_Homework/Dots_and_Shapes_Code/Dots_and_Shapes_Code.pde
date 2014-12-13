//Meghan Straus HW for 09-15-2014

void setup()
{
  size(600, 400);
  background(random(255));
  noLoop();
}

//Lee's dot code!
  void dot (float x, float y, float diameter, float r, float g, float b, float a) {
  fill(r, g, b, a);
  ellipse(x, y, diameter, diameter);
}
  //Creates many random dots all ove the screen
 void randomDot () {
  dot(random(400), random(400), random(200), random(255), random(255), random(255), random(255));
}

//This part of the code is what draws the ranom shapes
void draw()
{
  noStroke();
  
  fill(random(50), random(255), random(255));
  triangle(100, 300, 500, 200, 100, 200);
  
  fill (random(255), 0, 0, random(255));
  ellipse(300, 200, 300, 300); //x, y, width, height
  
  fill(0, random(255), 0, random(255));
  ellipse (250, 100, 150, 150);
  
  fill(0, 0, random(255), random(255));
  ellipse (500, 300, 100, 100);
  
  fill(random(255), random(255), 0, 255);
  ellipse (50, 200, 50, 50);
  
  fill(0, random(255), random(255), 255);
  rect (100, 100, 50, 50);
  
  fill(random(255), 0, random(255), 255);
  rect (200, 300, 100, 50);
  
  fill(random(255), random(255), random(255), 255);
  rect (400, 100, 100, 40);
  
  fill(random(255), random(50), random(255), 255);
  triangle(50, 300, 200, 260, 600, 300);
  
  //Creates many random dots on the screen
  randomDot();
  randomDot();
  randomDot();
  randomDot();
  randomDot();
}
