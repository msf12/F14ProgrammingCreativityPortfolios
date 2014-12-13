int rows = 20;
int columns = 20;
int box_size = 20;
PFont f;

void setup()
{
  size(int((box_size*columns)+1), int((box_size*rows)+1));    //Make the size encompass the total area that your grid encompasses.
  background(0);    //Set a blank white background.
  strokeWeight(0);    //Make the stroke lines somewhat thick.
  grid();    //Run the grid() function (draw a grid).
  printArray(PFont.list());
  f = createFont("Georgia", 24);
  textFont(f);
  textAlign(CENTER, CENTER);
  grid();
}

/*
As per usual, draw() is next to useless and only serves to redraw the grid after the mouse is released.
*/

void draw ()
{
  //grid();   //Run the grid() function (redraw the grid in case any changes were made).
}

/*
grid() draws a grid based on the preset number of rows, colums, and box size that you provide in the global variables above.
*/

void grid ()
{
  rectMode(CORNER);    //Sets the rectangle drawing mode to corner: (x_coordinate, y_coordinate, x_width, y_width)
  for(int i = 0; i < columns; i++)    //Iterates through every column
  {
    for(int j = 0; j < rows; j++)    //Iterates through every element (one in each row) of the current column
    {
      stroke(0);    //Set the stroke color to black
      fill(255);    //Set the fill color to white
      rect(i*box_size, j*box_size, box_size, box_size);    //Draw a rectangle at the appropriate position, and of size "box_size"
      fill(0);
      text((char)random(65, 91), i*box_size+10, j*box_size+8);
    }
  }
  //fill(0);
  //text((char)random(65, 91), 92, 100);
  noLoop();
  textAlign(CENTER,CENTER);
}

/*
mousePressed() handles what to do when...the mouse is pressed! (shocking!!)

Note: Gabby, this is the part you'll want to look at and play with (namely the first two lines after noLoop() )

Symbols to know:
% = modulo (what is the remainder if the first number is divided by the second?)
Ex: 17 % 5 = 2 because 17 / 5 = 3 Remainder 2

How does the (mouse_pos-(mouse_pos % box_size))/box_size) formula work?
Step 1. Take the mouse position: mouse_pos
Step 2. Subtract the amount off the mouse position that doesn't divide evenly into the size of the boxes: mouse_pos - (mouse_pos % box_size)
        This ensures that the remaining number is a whole number of "box_size"s
Step 3. Divide this number by the size of the boxes: (mouse_pos - (mouse_pos % box_size) ) / box_size
        This remaining number will represent how many "boxes" over the mouse is
*/

void mousePressed ()
{
  noLoop();    //Stop the draw loop (redrawing the grid() )
  int xinc = int((mouseX-(mouseX % box_size))/box_size);    //This will tell you which box you are in relative to the x direction:  -> [0][1][2][3][4]...etc
  int yinc = int((mouseY-(mouseY % box_size))/box_size);    //This will tell you which box you are in relative to the y direction:  |  [1]
  print("You clicked on the box at ("+(xinc)+", "+(yinc)+")");    //This will print your box location to the terminal               v  [2]
  println();    //This will print a new line                                                                                           [3]
  //fill(0);    //Change the fill to black                                                                                               [4]
 // rect(xinc*box_size, yinc*box_size, box_size, box_size);    //"Fill in" the current box you have clicked on                          ...etc
}

void mouseReleased()
{
  loop();    //When the mouse is released, keep looping (drawing the blank grid)
}



