int cols = 4;
int rows = 4;

/*
The beveled_rect() function is purely asthetic and makes the grid look prettier.

xpos = x-position of top-left corner
ypos = y-position of top left corner
xdis = horizontal length of rectangle
ydis = vertical length of rectangle
bev = bevel amount
*/

void beveled_rect(float xpos, float ypos, float xdis, float ydis, float bev)
{
  noStroke();
  //Top Bevel
  fill(250);
  beginShape();
  vertex(xpos, ypos);
  vertex(xpos+xdis, ypos);
  vertex(xpos+xdis-bev, ypos+bev);
  vertex(xpos+bev, ypos+bev);
  endShape(CLOSE);
  //Left Bevel
  fill(225);
  beginShape();
  vertex(xpos, ypos);
  vertex(xpos, ypos+ydis);
  vertex(xpos+bev, ypos+ydis-bev);
  vertex(xpos+bev, ypos+bev);
  endShape(CLOSE);
  //Right Bevel
  fill(100);
  beginShape();
  vertex(xpos+xdis, ypos);
  vertex(xpos+xdis, ypos+ydis);
  vertex(xpos+xdis-bev, ypos+ydis-bev);
  vertex(xpos+xdis-bev, ypos+bev);
  endShape(CLOSE);
  //Bottom Bevel
  fill(75);
  beginShape();
  vertex(xpos, ypos+ydis);
  vertex(xpos+xdis, ypos+ydis);
  vertex(xpos+xdis-bev, ypos+ydis-bev);
  vertex(xpos+bev, ypos+ydis-bev);
  endShape(CLOSE);
  //Center Bevel
  fill(175);
  rect(xpos+bev, ypos+bev, xdis-(2*bev), ydis-(2*bev));
}

void draw_random_shape(float xpos, float ypos)
{
  ellipseMode(RADIUS);
  rectMode(CORNER);  
  int colour = 0;
  int shape = 0;
  beveled_rect(xpos*100, ypos*100, 100, 100, 5);
  colour = int(random(6));
  switch(colour)
  {
    case 0: //RED
      fill(#FF0000);
      stroke(#800000);
      break;
    case 1: //ORANGE
      fill(#FF8000);
      stroke(#804000);
      break;
    case 2: //YELLOW
      fill(#FFFF00);
      stroke(#808000);
      break;
    case 3: //GREEN
      fill(#00FF00);
      stroke(#008000);
      break;
    case 4: //BLUE
      fill(#0000FF);
      stroke(#000080);
      break;
    case 5: //VIOLET
      fill(#8000FF);
      stroke(#400080);
      break;
  }
  //Picks a random shape and draws it with the previously selected fill colour.
  shape = int(random(5));
  switch(shape)
  {
    case 0: //CIRCLE
      ellipse((xpos*100)+50, (ypos*100)+50, 40, 40);
      break;
    case 1: //TRIANGLE
      beginShape();
      vertex((xpos*100)+50, (ypos*100)+10);
      vertex((xpos*100)+90, (ypos*100)+90);
      vertex((xpos*100)+10, (ypos*100)+90);
      endShape(CLOSE);
      break;
    case 2: //RHOMBUS
      beginShape();
      vertex((xpos*100)+50, (ypos*100)+10);
      vertex((xpos*100)+80, (ypos*100)+50);
      vertex((xpos*100)+50, (ypos*100)+90);
      vertex((xpos*100)+20, (ypos*100)+50);
      endShape(CLOSE);
      break;
    case 3: //SQUARE
      rect((xpos*100)+15, (ypos*100)+15, 70, 70);
      break;
    case 4: //HEXAGON
      beginShape();
      vertex((xpos*100)+10, (ypos*100)+50);
      vertex((xpos*100)+(50/(sqrt(3))), (ypos*100)+(60-(25*sqrt(3))));
      vertex((xpos+1)*100-(50/(sqrt(3))), (ypos*100)+(60-(25*sqrt(3))));
      vertex((xpos*100)+90, (ypos*100)+50);
      vertex((xpos+1)*100-(50/(sqrt(3))), (ypos*100)+(40+(25*sqrt(3))));
      vertex((xpos*100)+(50/(sqrt(3))), (ypos*100)+(40+(25*sqrt(3))));
      endShape(CLOSE);
      break;
  }
}

Array shape_and_colour()
{
  int shape_and_colourArray = int new [cols] [rows*2];
  for(int i = 0; i < cols; i++)
  {
    for(int j = 0; j < rows; j++)
    {
      int shape = int(random(5));
      shape_and_colourArray [i] [j] = shape;
    }
  }
  for(int i = 0; i < cols; i++)
  {
    for(j = 0; j < rows; j++)
    {
      int colour = int(random(5));
      shape_and_colourArray [i] [j+rows] = colour;
    }
  }
  return shape_and_colourArray
}
  
for(int i = 0; i < cols; i++)
{
  for(j = 0; j < rows*2; j++)
  {
    switch(shape_and_colourArray [i] [j])
    {
      case 0:
        println("Circle");
        break;
      case 1:
        println("Triangle");
        break;
      case 2:
        println("Rhombus");
        break;
      case 3:
        println("Square");
        break;
      case 4:
        println("Hexagon");
        break;
    }
  }
}
  
  
