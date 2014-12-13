/*
Concentration by Loren Skinner IV
 Last Updated: 25 September 2014
 */

/*
Global Variable Setup
 
 Values [] = the array of values that stores all the shapes in the game
 player_select = the phase for the player to select a new shape
 player_match = the phase for the player to match their selected shape
 */

int [] Values;
boolean player_select = true;
boolean player_match = false;
int x_temp;
int y_temp;
int value_temp;
int zero_count = 0;
int timer = second();

/*
Sets the initial values for the game (size, background, smooth,
 shapeModes, randomizes Values [], etc.) and draws the initial blank
 grid.
 */

void setup()
{
  size(600, 500);
  background(255);
  smooth();
  rectMode(CORNER);
  ellipseMode(RADIUS);
  Values = randomize(paired_array((width/100)*(height/100)/2));
  print_array(Values);  //Debugging purposes
  fill_grid();
}

void update_timer()
{
  timer = second();
}


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
The fill_grid() function fills the grid with blank tiles
 */

void fill_grid()
{
  for (int i = 0; i < Values.length; i++)
  {
    int box_x = i % 6;
    int box_y = (i - (box_x)) % 5;
    if (Values [i] == 0)
    {
      zero_count++;
    } else
    {
      beveled_rect((box_x*100), (box_y*100), 100, 100, 5);
    }
  }
}

/*
The randomize() function takes an array and randomizes
 the placement of its elements by turning it into an IntList,
 and making use of the .shuffle() method.
 */

int [] randomize(int[] array)
{
  IntList pairs = new IntList();
  for (int i = 0; i < array.length; i++)
  {
    pairs.append(array [i]);
  }
  pairs.shuffle();
  for (int i = 0; i < array.length; i++)
  {
    array [i] = pairs.get(i);
  }
  return array;
}

/*
The paired_array() function simply generates an array of
 side-by-side pairs {0, 0, 1, 1, 2, 2, ... , n, n} to check
 if a generated array contains all pairs (so the game is winnable).
 
 pairs = how many pairs the array needs (n in the above example)
 */

int [] paired_array(int pairs)
{
  int [] array_1 = new int [pairs];
  int [] array_2 = new int [pairs];
  for (int i = 0; i < pairs; i++)
  {
    array_1 [i] = i+1;
    array_2 [i] = i+1;
  }
  int [] pair_aray = sort(splice(array_1, array_2, array_1.length));
  return pair_aray;
}

/*
The print_array() function prints an array nicely
 Debugging purposes only
 */

void print_array (int [] array)
{
  print("{", array [0]);
  for (int i = 1; i < array.length; i++)
  {
    print(",", array [i]);
  }
  println("}");
}

void draw_shape (int value, int xpos, int ypos)
{
  switch(value)
  {
  case 1: //RED CIRCLE
    fill(#FF0000);
    stroke(#800000);
    ellipse((xpos*100)+50, (ypos*100)+50, 40, 40);
    break;
  case 2: //YELLOW CIRCLE
    fill(#FFFF00);
    stroke(#808000);
    ellipse((xpos*100)+50, (ypos*100)+50, 40, 40);
    break;
  case 3: //GREEN CIRCLE
    fill(#00FF00);
    stroke(#008000);
    ellipse((xpos*100)+50, (ypos*100)+50, 40, 40);
    break;
  case 4: //BLUE CIRCLE
    fill(#0000FF);
    stroke(#000080);
    ellipse((xpos*100)+50, (ypos*100)+50, 40, 40);
    break;
  case 5: //RED TRIANGLE
    fill(#FF0000);
    stroke(#800000);
    beginShape();
    vertex((xpos*100)+50, (ypos*100)+10);
    vertex((xpos*100)+90, (ypos*100)+90);
    vertex((xpos*100)+10, (ypos*100)+90);
    endShape(CLOSE);
    break;
  case 6: //YELLOW TRIANGLE
    fill(#FFFF00);
    stroke(#808000);
    beginShape();
    vertex((xpos*100)+50, (ypos*100)+10);
    vertex((xpos*100)+90, (ypos*100)+90);
    vertex((xpos*100)+10, (ypos*100)+90);
    endShape(CLOSE);
    break;
  case 7: //GREEN TRIANGLE
    fill(#00FF00);
    stroke(#008000);
    beginShape();
    vertex((xpos*100)+50, (ypos*100)+10);
    vertex((xpos*100)+90, (ypos*100)+90);
    vertex((xpos*100)+10, (ypos*100)+90);
    endShape(CLOSE);
    break;
  case 8: //BLUE TRIANGLE
    fill(#0000FF);
    stroke(#000080);
    beginShape();
    vertex((xpos*100)+50, (ypos*100)+10);
    vertex((xpos*100)+90, (ypos*100)+90);
    vertex((xpos*100)+10, (ypos*100)+90);
    endShape(CLOSE);
    break;
  case 9: //RED SQUARE
    fill(#FF0000);
    stroke(#800000);
    rect((xpos*100)+15, (ypos*100)+15, 70, 70);
    break;
  case 10: //YELLOW SQUARE
    fill(#FFFF00);
    stroke(#808000);
    rect((xpos*100)+15, (ypos*100)+15, 70, 70);
    break;
  case 11: //GREEN SQUARE
    fill(#00FF00);
    stroke(#008000);
    rect((xpos*100)+15, (ypos*100)+15, 70, 70);
    break;
  case 12: //BLUE SQUARE
    fill(#0000FF);
    stroke(#000080);
    rect((xpos*100)+15, (ypos*100)+15, 70, 70);
    break;
  case 13: //RED RHOMBUS
    fill(#FF0000);
    stroke(#800000);
    beginShape();
    vertex((xpos*100)+50, (ypos*100)+10);
    vertex((xpos*100)+80, (ypos*100)+50);
    vertex((xpos*100)+50, (ypos*100)+90);
    vertex((xpos*100)+20, (ypos*100)+50);
    endShape(CLOSE);
    break;
  case 14: //YELLOW RHOMBUS
    fill(#FFFF00);
    stroke(#808000);
    beginShape();
    vertex((xpos*100)+50, (ypos*100)+10);
    vertex((xpos*100)+80, (ypos*100)+50);
    vertex((xpos*100)+50, (ypos*100)+90);
    vertex((xpos*100)+20, (ypos*100)+50);
    endShape(CLOSE);
    break;
  case 15: //GREEN RHOMBUS
    fill(#00FF00);
    stroke(#008000);
    beginShape();
    vertex((xpos*100)+50, (ypos*100)+10);
    vertex((xpos*100)+80, (ypos*100)+50);
    vertex((xpos*100)+50, (ypos*100)+90);
    vertex((xpos*100)+20, (ypos*100)+50);
    endShape(CLOSE);
    break;
  default:
    fill(255);
    noStroke();
    rect((xpos*100), (ypos*100), 100, 100);
  }
}

/*
The update() function is contained in the draw() loop anc is constatntly
 checking to see if the selected shapes match, and wether to erase them
 or redraw the blank grid
 */

void update()
{
  int xinc = (mouseX-(mouseX%100))/100;
  int yinc = (mouseY-(mouseY%100))/100;
  int value = Values[(yinc*6)+xinc];
  draw_shape(value, xinc, yinc);
  timer = second();
  while (timer != second ())
  {
    if (player_select == true && player_match == false)
    {
      if (value == 0) {
      } else
      {
        x_temp = xinc;
        y_temp = yinc;
        value_temp = value;
        player_select = false;
        player_match = true;
      }
    } else if (player_match == true && player_select == false)
    {
      if (value == 0) {
      } else if (value_temp != value)
      {
        fill_grid();
      } else if (value_temp == value)
      {
        Values[(yinc*6)+xinc] = 0;
        Values[(y_temp*6)+x_temp] = 0;
        fill(255);
        noStroke();
        rect((xinc*100), (yinc*100), 100, 100);
        rect((x_temp*100), (y_temp*100), 100, 100);
      }
    }
    player_select = true;
    player_match = false;
  }
}

void draw()
{
  //update_timer;
}

void mousePressed()
{
  if (mouseButton == LEFT)
  {
    update();
  } else {
  }
}

