/*
Loren Skinner IV's Random Shape Program
Last Updated: 2014 Sept 11th
*/


//The number of rows and columns in the pattern. Can be changed!
int cols = 5;
int rows = 5;

//Sets whether to make the squares prettier(true) or not(false). Can be changed!
boolean bevel = true;

/*
Sets whether to start with a blank grid(false),
or with a pattern(true). Can be changed!
*/
boolean pattern = false;

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

/*
The random_shape() function creates a new grid square with a
random shape in a random color. It is the basis of this program

xpos = x position of top left corner
ypos = y position of top left corner
*/

void random_shape(float xpos, float ypos)
{
  ellipseMode(RADIUS);
  rectMode(CORNER);
  //Initializes the colour variable and sets the default colour value   
  int colour = 0;
  //Initializes the shape variable and sets the default shape value
  int shape = 0;
  //Redraws the square to erase previous shape
  if(bevel == true)
  {
    beveled_rect(xpos*100, ypos*100, 100, 100, 5);
  }
  else
  {
    stroke(0);
    fill(255);
    rect(xpos*100, ypos*100, 100, 100);
  }
  //Picks a random colour
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
  //Stops the draw() function from looping indefinitely.
  //(This prevents seizure-inducing flashy colours and shapes)
  noLoop();
}

/*
Setup runs only once and sets up the grid (and first pattern if applicable),
as well as setting parameters for the program.
*/

void setup()
{
  //Sets the window size based on the number of rows and columns,
  //and whether or not a beveled grid is being used
  if(bevel == true)
  {
    size((cols*100), (rows*100));
  }
  else
  {
    size((cols*100) + 2,(rows*100) + 2);
  }
  background(0);
  smooth();
  fill(255);
  stroke(0);
  strokeWeight(2);
  rectMode(CORNER);
  //Draws the initial shape grid (and pattern if applicable)
  for (int i = 0; i < cols; i++)
  {
    for (int j = 0; j < rows; j++)
    {
      if(pattern == true)
      {
        random_shape(i, j);
      }
      else
      {
        if(bevel == true)
        {
          beveled_rect(i*100, j*100, 100, 100, 5);
        }
        else
        {
          stroke(0);
          fill(255);
          rect(i*100, j*100, 100, 100);
        }
      }
    }
  }
}

/*
The main draw() function.
It's pretty dissappointing since all the real work is done by random_shape()...
*/

void draw()
{ 
  noLoop();
}

/*
When the left mouse button is clicked, change only the square it is clicking on.

When the right mouse button is clicked, clear only the square it is clicking on.
*/

void mousePressed()
{
  int xinc = (mouseX-(mouseX % 100))/100;
  int yinc = (mouseY-(mouseY % 100))/100;
  if(mouseButton == LEFT)
  {
    random_shape(xinc, yinc);
    loop();
  }
  if(mouseButton == RIGHT)
  {
    if(bevel == true)
    {
      beveled_rect(xinc*100, yinc*100, 100, 100, 5);
    }
    else
    {
      stroke(0);
      fill(255);
      rect(xinc*100, yinc*100, 100, 100);
    }
    loop();
  }
  else {}
}

/*
When the spacebar is pressed, change all the squares.
(if held, the program will go into flashy-shape-and-colour-seizure mode)

When the backspace key is pressed, clear the grid.
*/

void keyPressed()
{
  if(key == ' ')
  {
    for(int i = 0; i < cols; i++)
    {
      for(int j = 0; j < rows; j++)
      {
        random_shape(i, j);
      }
    }
    loop();
  }
  if(key == BACKSPACE)
  {
    for(int i = 0; i < cols; i++)
    {
      for(int j = 0; j < rows; j++)
      {
        if(bevel == true)
        {
          beveled_rect(i*100, j*100, 100, 100, 5);
        }
        else
        {
          stroke(0);
          fill(255);
          rect(i*100, j*100, 100, 100);
        }
      }
    }
    loop();
  }    
  else {}
}
       
     
 
