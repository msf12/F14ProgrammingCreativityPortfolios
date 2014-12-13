/*
Gaussian Improv
by Loren Skinner IV
Last updated: 10 October 2014

This code utilizes random Gaussian distribution and a few simple rules to generate an "improvized" string of notes
in a given key.
*/

//Set up an array that organizes the scale degrees
String[] scale_degrees = {" 1 ", " 2 ", " 3 ", " 5 ", " 6 ", "b7 ", " 7 ", "b3 ", "tri", "b2 ", "b6 ", " 4 "};
//                       [        Pentatonic Scale        ] [      Leading Tones      ] [  Dissonant Tones  ]

//Set up a variable to store the last note to check the current note against (~ala~ a Marakov Chain)
String last_note;

void setup() //Run four_bars() four times for sixteen measures of improv
{
  four_bars();
  four_bars();
  four_bars();
  four_bars();
}

void draw() {} //Lol useless draw() function is useless :P

//Generates a new note either based on the last note, or using Gausian distribution to pick a new random note

String generate_note()
{
  if(last_note == scale_degrees[8]) //Tri-tones always resolve up (because 4's are dissonant!!)
  {
    last_note = scale_degrees[3];
    return last_note;
  }
  else if (last_note == scale_degrees[7]) //b3's either resolve to the 3 or the 1 at random
  {
    if(int(random(2)) == 0)
    {
      last_note = scale_degrees[0];
      return last_note;
    }
    else
    {
      last_note = scale_degrees[2];
      return last_note;
    }
  }
  if(last_note == scale_degrees[6] || last_note == scale_degrees[9]) //b2's and 7's will always resolve to the 1
  {
    last_note = scale_degrees[0];
    return last_note;
  }
  else
  {
    float number = abs(randomGaussian()); //Generate a (positive) random Gaussian number
    int temp;
    if (number > 0 && number < 1)//This represents sd1 (~68%) and will ALWAYS return a (random) pentatonic note
    {
      temp = int(random(5));//(Attempts to) Store the value and check for a repeating note
      if(last_note == scale_degrees[temp])
      {
        if(abs(randomGaussian()) < 1)//If the note is going to repeat, generate a new note with a sd1 % (~68%) chance
        {
          last_note = scale_degrees[++temp];//Chooses the note one step away in the array
          return last_note;
        }
        else
        {
          last_note = scale_degrees[temp];//Otherwise, allow the note to repeat
          return last_note;
        }
      }
      else
      {
        last_note = scale_degrees[temp];
        return last_note;
      }
    }
    if (number > 1 && number < 2)//This represents sd2-sd1 (~25%) and will ALWAYS return a (random) leading tone
    {
      temp = int(random(5, 9));//Same repeating stuff...
      if(last_note == scale_degrees[temp])
      {
        if(abs(randomGaussian()) < 1)
        {
          last_note = scale_degrees[int(random(5))];//Chooses a note in the pentatonic scale to resolve to instead
          return last_note;
        }
        else
        {
          last_note = scale_degrees[temp];
          return last_note;
        }
      }
      else
      {
        last_note = scale_degrees[temp];
        return last_note;
      }
    }
    else //This represents "everything else" (100-sd1-sd2 or ~7%) and will choose EITHER a leading tone or dissonant note at random
    {
      temp = int(random(5, 11));//Ditto on the repetition...
      if(last_note == scale_degrees[temp])
      {
        if(abs(randomGaussian()) < 1)
        {
          last_note = scale_degrees[int(random(5))];//Resolves to a pentatonic tone
          return last_note;
        }
        else
        {
          last_note = scale_degrees[temp];
          return last_note;
        }
      }
      else
      {
        last_note = scale_degrees[temp];
        return last_note;
      }
    }
  }
}

//measure() prints the notes in the order that they're generated and separates (starts) measures with the '|' character

void measure()
{
  print("|");
  for (int i = 0; i < 8; i++)
  {
    if(abs(randomGaussian()) < 1)//Same Gaussian probability deal
    {
      print(generate_note());//Generates a note (~68%)
    }
    else
    {
      last_note = "   ";//Generates a rest (~32%)
      print(last_note);
    }
  }
}

//four_bars() just prints four measures, then prints a new line to organize the "notes" better

void four_bars()
{
  for (int i = 0; i < 4; i++)
  {
    measure();
  }
  print("|");
  println();
}


