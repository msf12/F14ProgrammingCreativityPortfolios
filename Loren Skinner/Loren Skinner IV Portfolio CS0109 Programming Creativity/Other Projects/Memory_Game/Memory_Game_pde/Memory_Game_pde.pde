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
  println(check_pairs(Values)); //Debugging purposes
  for (int i = 0; i < width/100; i++)
  {
    for (int j = 0; j < height/100; j++)
    {
      beveled_rect((i*100), (j*100), 100, 100, 5);
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
pairs {1,2,3,...,n,1,2,3,...,n} to check if a generated
array contains all pairs (so the game is winnable).

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
  int [] pair_aray = concat(array_1, array_2);
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
      if(sortedArray [i] == sort(paired_array(array.length/2)) [i])
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
