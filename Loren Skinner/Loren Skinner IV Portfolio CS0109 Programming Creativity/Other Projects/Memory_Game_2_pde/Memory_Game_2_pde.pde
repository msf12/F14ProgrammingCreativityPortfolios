/*
Memory Game Code by Loren Skinner IV
Last updated: 19 September 2014
*/

int [] Values; 

void setup()
{
  size(600, 500);
  background(255);
  strokeWeight(2);
  smooth();
  rectMode(CORNER);
  ellipseMode(RADIUS);
  Values = randomize(paired_array((width/100)*(height/100)/2));
  if(check_pairs(Values) == false)
  {
    exit();
  }
  else {}
  //Sets up the Display Grid
  for (int i = 0; i < width/100 ; i++)
  {
    for (int j = 0; j < height/100 ; j++)
    {
      beveled_rect(i*100, j*100, 100, 100, 5); //Draws 100px x 100px boxes over the etire screen
    }
  }
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
The print_array() function prints an array nicely
Debugging purposes only
*/

void print_array (int [] array)
{
  print("{", array [0]);
  for(int i = 1; i < array.length; i++)
  {
    print(",", array [i]);
  }
  println("}");
}

/*
The randomize() function takes an array and randomizes
the placement of its elements by turning it into an IntList,
and making use of the .shuffle() method.
*/

int [] randomize(int[] array)
{
  IntList pairs = new IntList();
  for(int i = 0; i < array.length; i++)
  {
    pairs.append(array [i]);
  }
  pairs.shuffle();
  for(int i = 0; i < array.length; i++)
  {
    array [i] = pairs.get(i);  
  }
  return array;
}

/*
THe paired_array() function simply generates an array of
side-by-side pairs {0, 0, 1, 1, 2, 2, ... , n, n} to check
if a generated array contains all pairs (so the game is winnable).

pairs = how many pairs the array needs (n in the above example)
*/

int [] paired_array(int pairs)
{
  int [] array_1 = new int [pairs];
  int [] array_2 = new int [pairs];
  for(int i = 0; i < pairs; i++)
  {
    array_1 [i] = i;
    array_2 [i] = i;
  }
  int [] pair_aray = sort(splice(array_1, array_2, array_1.length));
  return pair_aray;
}

/*
The check_pairs() function uses the paired_array() function
to check if a given array contains pairings of its elements.
*/

boolean check_pairs (int [] array)
{
  if(array.length % 2 == 1)
  {
    return false;
  }
  else
  {
    int [] sortedArray = sort(array);
    int pair_counter = 0;
    for(int i = 0; i < sortedArray.length; i++)
    {
      if(sortedArray [i] == paired_array(array.length/2) [i])
      {
        pair_counter++;
      }
      else {}
    }
    if(pair_counter == array.length)
    {
      return true;
    }
    else
    {
      return false;
    }
  }
}

void draw_shape (int value, int xpos, int ypos)
{
 switch(value)
  {
    case 0: //RED CIRCLE
      fill(#FF0000);
      stroke(#800000);
      ellipse((xpos*100)+50, (ypos*100)+50, 40, 40);
      break;
    case 1: //YELLOW CIRCLE
      fill(#FFFF00);
      stroke(#808000);
      ellipse((xpos*100)+50, (ypos*100)+50, 40, 40);
      break;
    case 2: //GREEN CIRCLE
      fill(#00FF00);
      stroke(#008000);
      ellipse((xpos*100)+50, (ypos*100)+50, 40, 40);
      break;
    case 3: //BLUE CIRCLE
      fill(#0000FF);
      stroke(#000080);
      ellipse((xpos*100)+50, (ypos*100)+50, 40, 40);
      break;
    case 4: //RED TRIANGLE
      fill(#FF0000);
      stroke(#800000);
      beginShape();
      vertex((xpos*100)+50, (ypos*100)+10);
      vertex((xpos*100)+90, (ypos*100)+90);
      vertex((xpos*100)+10, (ypos*100)+90);
      endShape(CLOSE);
      break;
    case 5: //YELLOW TRIANGLE
      fill(#FFFF00);
      stroke(#808000);
      beginShape();
      vertex((xpos*100)+50, (ypos*100)+10);
      vertex((xpos*100)+90, (ypos*100)+90);
      vertex((xpos*100)+10, (ypos*100)+90);
      endShape(CLOSE);
      break;
    case 6: //GREEN TRIANGLE
      fill(#00FF00);
      stroke(#008000);
      beginShape();
      vertex((xpos*100)+50, (ypos*100)+10);
      vertex((xpos*100)+90, (ypos*100)+90);
      vertex((xpos*100)+10, (ypos*100)+90);
      endShape(CLOSE);
      break;
    case 7: //BLUE TRIANGLE
      fill(#0000FF);
      stroke(#000080);
      beginShape();
      vertex((xpos*100)+50, (ypos*100)+10);
      vertex((xpos*100)+90, (ypos*100)+90);
      vertex((xpos*100)+10, (ypos*100)+90);
      endShape(CLOSE);
      break;
    case 8: //RED SQUARE
      fill(#FF0000);
      stroke(#800000);
      rect((xpos*100)+15, (ypos*100)+15, 70, 70);
      break;
    case 9: //YELLOW SQUARE
      fill(#FFFF00);
      stroke(#808000);
      rect((xpos*100)+15, (ypos*100)+15, 70, 70);
      break;
    case 10: //GREEN SQUARE
      fill(#00FF00);
      stroke(#008000);
      rect((xpos*100)+15, (ypos*100)+15, 70, 70);
      break;
    case 11: //BLUE SQUARE
      fill(#0000FF);
      stroke(#000080);
      rect((xpos*100)+15, (ypos*100)+15, 70, 70);
      break;
    case 12: //RED RHOMBUS
      fill(#FF0000);
      stroke(#800000);
      beginShape();
      vertex((xpos*100)+50, (ypos*100)+10);
      vertex((xpos*100)+80, (ypos*100)+50);
      vertex((xpos*100)+50, (ypos*100)+90);
      vertex((xpos*100)+20, (ypos*100)+50);
      endShape(CLOSE);
      break;
    case 13: //YELLOW RHOMBUS
      fill(#FFFF00);
      stroke(#808000);
      beginShape();
      vertex((xpos*100)+50, (ypos*100)+10);
      vertex((xpos*100)+80, (ypos*100)+50);
      vertex((xpos*100)+50, (ypos*100)+90);
      vertex((xpos*100)+20, (ypos*100)+50);
      endShape(CLOSE);
      break;
    case 14: //GREEN RHOMBUS
      fill(#00FF00);
      stroke(#008000);
      beginShape();
      vertex((xpos*100)+50, (ypos*100)+10);
      vertex((xpos*100)+80, (ypos*100)+50);
      vertex((xpos*100)+50, (ypos*100)+90);
      vertex((xpos*100)+20, (ypos*100)+50);
      endShape(CLOSE);
      break;
  }
}

void draw()
{
  noLoop();
}

void mousePressed()
{
//  Sets up variables to track which box the mouse is in
  int xinc = (mouseX-(mouseX%100))/100;
  int yinc = (mouseY-(mouseY%100))/100;
  int value = Values[(yinc*6)+xinc];
  /* 
  Draws the shape that is attributed to the box when the left
  mouse buton is clicked, and hides the shape when the right mouse
  button is clicked.
  */
  if(mouseButton == LEFT)
  {
    draw_shape(value, xinc, yinc);
    loop();
  }
  else if(mouseButton == RIGHT)
  {
    beveled_rect((xinc*100), (yinc*100), 100, 100, 5);
    loop();
  }
  else {}
}

