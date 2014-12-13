//List all the notes in chromatic order
String [] chromatic_sharp_notes = {"C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B"};
String [] chromatic_flat_notes  = {"C", "Db", "D", "Eb", "E", "F", "Gb", "G", "Ab", "A", "Bb", "B"};
//Arrangement of notes based on the current key (Default: Key of C)
String [] key_notes      = {" C ", " D ", " E ", " G ", " A ", "Bb ", " B ", "Eb ", "F# ", "Ab ", "Db ", " F "};
// Equivilant scale degree:{  1  ,   2  ,   3  ,   5  ,   6  ,  b7  ,   7  ,  b3  ,  #4  ,  b6  ,  b2  ,   4  }
//                         [        Pentatonic Scale        ] [      Leading Tones      ] [  Dissonant Tones  ] 

//Set up a variable to store the last note to check the current note against (~ala~ a Marakov Chain)
String last_note;

void setup()
{
  find_key("C");
  four_bars();
  four_bars();
  four_bars();
  last_four_bars();
  exit();
}

void draw() {} //Lol, useless draw() function is useless :P

//print_array() prints an array nicely for debugging purposes

void print_array (String[] array)
{
  print("{"+array [0]);
  for(int i = 1; i < array.length; i++)
  {
    print(","+array [i]);
  }
  println("}");
}

/*
check() is simply a function to ensure that the value of 'position' in the
find_key() function doesn't exceed 11 to avoid "ArrayIndexOutOfBoundsException" error
while keeping position mapped to the correct scale degrees.
(It essentially causes 'position' to "wrap around" the scale when it reaches the end.)
*/

int check (int number)
{
  if(number >= 12)
  {
    number -= 12;
    return number;
  }
  else
  {
    return number;
  }
}

String space(String string)
{
  if(string.length() == 1)
  {
    return " "+string+" ";
  }
  else if(string.length() == 2)
  {
    return string+" ";
  }
  else
  {
    return string;
  }
}

/*The find_key() function utilizes a StringList to reorganize the chromatic_notes array
into the key_notes array based on the key given*/

void find_key (String Key)
{
  StringList new_key = new StringList ();
  int position = 0;
  if(Key=="G"||Key=="D"||Key=="A"||Key=="E"||Key=="B"||Key=="F#"||Key=="C#")
  {
    for(int i = 0; i < chromatic_sharp_notes.length; i++)
    {
      if(Key == chromatic_sharp_notes[i])
      {
        position = i;
        break;
      }
      else {}
    }
    new_key.append(space(chromatic_sharp_notes[position]));
    new_key.append(space(chromatic_sharp_notes[check(position+2)]));
    new_key.append(space(chromatic_sharp_notes[check(position+4)]));
    new_key.append(space(chromatic_sharp_notes[check(position+7)]));
    new_key.append(space(chromatic_sharp_notes[check(position+9)]));
    new_key.append(space(chromatic_sharp_notes[check(position+10)]));
    new_key.append(space(chromatic_sharp_notes[check(position+11)]));
    new_key.append(space(chromatic_sharp_notes[check(position+3)]));
    new_key.append(space(chromatic_sharp_notes[check(position+6)]));
    new_key.append(space(chromatic_sharp_notes[check(position+8)]));
    new_key.append(space(chromatic_sharp_notes[check(position+1)]));
    new_key.append(space(chromatic_sharp_notes[check(position+5)]));
    key_notes = new_key.array();
  }
  else if(Key=="C"||Key=="F"||Key=="Bb"||Key=="Eb"||Key=="Ab"||Key=="Db"||Key=="Gb")
  {
    for(int i = 0; i < chromatic_flat_notes.length; i++)
    {
      if(Key == chromatic_flat_notes[i])
      {
        position = i;
        break;
      }
      else {}
    }
    new_key.append(space(chromatic_flat_notes[position]));
    new_key.append(space(chromatic_flat_notes[check(position+2)]));
    new_key.append(space(chromatic_flat_notes[check(position+4)]));
    new_key.append(space(chromatic_flat_notes[check(position+7)]));
    new_key.append(space(chromatic_flat_notes[check(position+9)]));
    new_key.append(space(chromatic_flat_notes[check(position+10)]));
    new_key.append(space(chromatic_flat_notes[check(position+11)]));
    new_key.append(space(chromatic_flat_notes[check(position+3)]));
    new_key.append(space(chromatic_flat_notes[check(position+6)]));
    new_key.append(space(chromatic_flat_notes[check(position+8)]));
    new_key.append(space(chromatic_flat_notes[check(position+1)]));
    new_key.append(space(chromatic_flat_notes[check(position+5)]));
    key_notes = new_key.array();
  }
  else
  {
    println("Couldn't determine key...");
    exit();
  }
}

//Generates a new note either based on the last note, or using Gausian distribution to pick a new random note

String generate_note()
{
  if(last_note == key_notes[8]) //Tri-tones always resolve up (because 4's are dissonant!!)
  {
    last_note = key_notes[3];
    return last_note;
  }
  else if (last_note == key_notes[7]) //b3's usualy resolve to the 3, 2, or 1 at random
  {
    float chance = abs(randomGaussian());
    if(chance < 2)
    {
      int temp = int(random(3));
      if(temp == 0)
      {
        last_note = key_notes[0];
        return last_note;
      }
      else if(temp == 1)
      {
        last_note = key_notes[1];
        return last_note;
      }
      else
      {
        last_note = key_notes[2];
        return last_note;
      }
    }
    else
    {
      return generate_note();
    }
  }
  else if(last_note == key_notes[9]) //b2's will always resolve to the 1
  {
    last_note = key_notes[0];
    return last_note;
  }
  else if(last_note == key_notes[9])//b6's will usually resolve to the 5 or 6
  {
    float chance = abs(randomGaussian());
    if (chance < 2)
    {
      int temp = int(random(2));
      if(temp == 0)
      {
        last_note = key_notes[3];
        return last_note;
      }
      else
      {
        last_note = key_notes[4];
        return last_note;
      }
    }
    else
    {
      return generate_note();
    }
  }
  else if(last_note == key_notes[5])//b7's usually resolve to a 6 and sometimes a 7
  {
    float chance = abs(randomGaussian());
    if(chance > 0 && chance < 1)
    {
      last_note = key_notes[3];
      return last_note;
    }
    else if (chance > 1 && chance < 2)
    {
      last_note = key_notes[6];
      return last_note;
    }
    else
    {
      return generate_note();
    }
  }
  else
  {
    float number = abs(randomGaussian()); //Generate a (positive) random Gaussian number
    int temp;
    if (number > 0 && number < 1)//This represents sd1 (~68%) and will ALWAYS return a (random) pentatonic note
    {
      temp = int(random(5));//Store the value and check for a repeating note
      if(last_note == key_notes[temp])
      {
        if(abs(randomGaussian()) < 1)//Usually play a new note, but sometimes allow repeating notes
        {
          return generate_note();//Generate a new note
        }
        else
        {
          last_note = key_notes[temp];//Otherwise, allow the note to repeat
          return last_note;
        }
      }
      else
      {
        last_note = key_notes[temp];
        return last_note;
      }
    }
    if (number > 1 && number < 2)//This represents sd2-sd1 (~25%) and will ALWAYS return a (random) leading tone
    {
      temp = int(random(5, 9));//Same repeating stuff...
      if(last_note == key_notes[temp])
      {
        if(abs(randomGaussian()) < 1)
        {
          last_note = key_notes[int(random(5))];//Chooses a note in the pentatonic scale to resolve to instead
          return last_note;
        }
        else
        {
          last_note = key_notes[temp];
          return last_note;
        }
      }
      else
      {
        last_note = key_notes[temp];
        return last_note;
      }
    }
    else //Represents "everything else" (100-sd1-sd2 or ~7%) and will choose EITHER a leading or dissonant note
    {
      temp = int(random(5, 11));//Ditto on the repetition...
      if(last_note == key_notes[temp])
      {
        if(abs(randomGaussian()) < 1)
        {
          last_note = key_notes[int(random(5))];//Resolves to a pentatonic tone
          return last_note;
        }
        else
        {
          last_note = key_notes[temp];
          return last_note;
        }
      }
      else
      {
        last_note = key_notes[temp];
        return last_note;
      }
    }
  }
}

/*measure() prints notes/rests in the order that they're generated and separates
(starts) measures with the '|' character*/

void measure()
{
  print("|");
  for (int i = 0; i < 8; i++)
  {
    if(last_note==key_notes[0]||last_note==key_notes[1]||
       last_note==key_notes[2]||last_note==key_notes[3])//Only generates a rest on a consonant note
    {
      if(abs(randomGaussian()) < 1 )
      {
        last_note = " _ ";//Generates a rest (~32%)
        print(last_note);
      }
      else
      {
        print(generate_note());//Generates a new note (~68%)
      }
    }
    else
    {
      print(generate_note());
    }
  }
}

//last_measure() makes sure the measure ends on consonant notes, while still resolving past dissonances

void last_measure()
{
  if(int(random(2)) == 1)
  {
    print("|");
    print(generate_note());
    String temp = generate_note();
    if(last_note!=key_notes[0]&&last_note!=key_notes[1]&&
       last_note!=key_notes[2]&&last_note!=key_notes[3])//Only generates a rest on a consonant note
    {
      print(key_notes[int(random(5))]);
    }
    else
    {
      print(temp);
    }
    print(key_notes[0]);
    for(int i = 0; i < 5; i++)
    {
      print(" _ ");
    }
  }
  else
  {
    print("|");
    print(generate_note());
    print(generate_note());
    print(generate_note());
    String temp = generate_note();
    if(last_note!=key_notes[0]&&last_note!=key_notes[1]&&
       last_note!=key_notes[2]&&last_note!=key_notes[3])//Only generates a rest on a consonant note
    {
      print(key_notes[int(random(5))]);
    }
    else
    {
      print(temp);
    }
    print(key_notes[0]);
    for(int i = 0; i < 3; i++)
    {
      print(" _ ");
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

//last_four_bars() prints four measures and ends the phrase on consonant notes
void last_four_bars()
{
  for (int i = 0; i < 3; i++)
  {
    measure();
  }
  last_measure();
  print("|");
  println();
}
