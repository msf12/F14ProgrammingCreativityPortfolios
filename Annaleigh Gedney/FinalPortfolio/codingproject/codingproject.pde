//Annaleigh Gedney
//Coding Project #1

void setup()
{
  size(400, 400);
  smooth();
}

void dot (float x, float y, float diameter, float r, float g, float b, float a)
{
  fill(r, g, b, a);
  rect(x, y, diameter, diameter);
}

void randomDot()
{
  dot(mouseX, mouseY, 50, random(255), random(255), random(255), random(255));
}

void draw()
{
  randomDot();
}  

void mousePressed()
{
  background(random(0,255));
}
