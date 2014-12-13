void setup ()
{
  size(300, 340);
  background (random(255));
  //noLoop();
}

void draw()
{
  //Turns the ellipse black if the mouse is pressed down
  noStroke();
  if (mousePressed == true){
    fill(0);
  } else {
    fill(255);
  }
  //Draws an ellipse with the width and height affected by mouseX
  //and mouseY
  ellipse(150, 150, mouseX, mouseY);

}
