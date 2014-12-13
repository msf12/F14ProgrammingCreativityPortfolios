/*----------------------------\
|Flow Improv                  |
|Loren Skiner IV              |
|Last Updated: 29 October 2014|
\----------------------------*/

int center = 0;    //Sets the global center value to be used with flow()
String transition_note = null;    //Sets a global value to store the last note in a measure to detirmine the first note of the next measure in measure()
String current_key = null;    //Stores the current key to know what notes to reference in the chromatic arrays, as well as detirmine consonant notes
String [] key_scale = null;    //Stores the notes of the diatonic scale of the current key. measure() chooses only from these notes.
String [] transition_scale = null;    //Stores the enharmonic of the diatonic scale for transition between keys.
String [] chromatic_sharp_notes = {"C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B"};    //Stores the chromatic scale using only sharps
String [] chromatic_flat_notes  = {"C", "Db", "D", "Eb", "E", "F", "Gb", "G", "Ab", "A", "Bb", "B"};    //Stores the chromatic scale using only flats

void setup()    //The programs main processes happen here (there is no need for a draw() function)
{
  set_key("Bb");    //Changes the key to Bb which modifies current_key and []key_scale
  print_array(measure());    //Prints out a measure of notes in Bb
  print_array(measure());    //Prints out a measure of notes in Bb
  set_key("C");    //Changes the key to Ab which modifies current_key and []key_scale
  print_array(measure());    //Prints out a measure of notes in Ab
  print_array(measure());    //Prints out a measure of notes in Ab 
  exit();    //Closes the window immediately, since all relevant information is in the terminal
}

/*
print_array() prints arrays in a more conventional manner than simply calling print()

array = Whatever array (of type String) that is to be printed
*/

void print_array(String[] array)
{
  println();    //Prints a new line
  print("|");    //Prints an opening bracket
  for(int i = 0; i < array.length; i++)    //Iterates through the entire array
  {
    print(array[i]);    //Prints the array value
  }
  print("|");    //Prints a closing bracket
}

/*
transpose() turns an array of integers (scale degrees) into an array of strings (note names) based on current_key and []key_notes

array = Whatever array (of type int) that is to be transposed
*/

String[] transpose(int[] array)
{
  String[] notes = new String[array.length];    //Creates a new array of type String with the same length as []array
  String[] transition = new String[array.length];    //Creates a second array like the one above
  int position = 0;    //Sets a local position value to find where to start iterating through the chromatic arrays
  if(current_key.equals("C")||current_key.equals("F")||current_key.equals("Bb")||current_key.equals("Eb")||
     current_key.equals("Ab")||current_key.equals("Db")||current_key.equals("Gb"))    //Checks current_key to determine if []chromatic_flat_notes should be used
  {
    for(int i = 0; i < chromatic_flat_notes.length; i++)    //Iterates through all of []chromatic_flat_notes to find where the first note of the scale is
    {
      if(current_key.equals(chromatic_flat_notes[i]))    //If the note is found, record the note's position and break the loop
      {
        position = i;
        break;
      }
      else {}    //If the position isn't found, keep going
    }
    for(int i = 0; i < array.length; i++)    //Iterates through the argument array and replaces each scale degree with the proper note
    {
      switch(array[i])
      {
        case 1:
          notes[i] = space(chromatic_flat_notes[check(position + 0)]);
          transition[i] = space(chromatic_sharp_notes[check(position + 0)]);
          break;
        case 2:
          notes[i] = space(chromatic_flat_notes[check(position + 2)]);
          transition[i] = space(chromatic_sharp_notes[check(position + 2)]);
          break;
        case 3:
          notes[i] = space(chromatic_flat_notes[check(position + 4)]);
          transition[i] = space(chromatic_sharp_notes[check(position + 4)]);
          break;
        case 4:
          notes[i] = space(chromatic_flat_notes[check(position + 5)]);
          transition[i] = space(chromatic_sharp_notes[check(position + 5)]);
          break;
        case 5:
          notes[i] = space(chromatic_flat_notes[check(position + 7)]);
          transition[i] = space(chromatic_sharp_notes[check(position + 7)]);
          break;
        case 6:
          notes[i] = space(chromatic_flat_notes[check(position + 9)]);
          transition[i] = space(chromatic_sharp_notes[check(position + 9)]);
          break;
        case 7:
          notes[i] = space(chromatic_flat_notes[check(position + 11)]);
          transition[i] = space(chromatic_sharp_notes[check(position + 11)]);
          break;
        default:
          notes[i] = space(chromatic_flat_notes[check(position)]);
          transition[i] = space(chromatic_sharp_notes[check(position)]);
          break;
      }
    }
  }
  else if(current_key.equals("G")||current_key.equals("D")||current_key.equals("A")||current_key.equals("E")||
          current_key.equals("B")||current_key.equals("F#")||current_key.equals("C#"))    //Otherwise, check and see if []chromatic_sharp_notes should be used
  {
    for(int i = 0; i < chromatic_sharp_notes.length; i++)    //Iterates through all of []chromatic_sharp_notes to find the first note of the scale
    {
      if(current_key.equals(chromatic_sharp_notes[i]))    //If the note is found, record the note's position and break the loop
      {
        position = i;
        break;
      }
      else {}    //If the note isn't found, keep going through the loop
    }
    for(int i = 0; i < array.length; i++)    //Iterates through the argument array and replaces scale degrees with note names based on the current key
    {
      switch(array[i])
      {
        case 1:
          notes[i] = space(chromatic_sharp_notes[check(position + 0)]);
          transition[i] = space(chromatic_flat_notes[check(position + 0)]);
          break;
        case 2:
          notes[i] = space(chromatic_sharp_notes[check(position + 2)]);
          transition[i] = space(chromatic_flat_notes[check(position + 2)]);
          break;
        case 3:
          notes[i] = space(chromatic_sharp_notes[check(position + 4)]);
          transition[i] = space(chromatic_flat_notes[check(position + 4)]);
          break;
        case 4:
          notes[i] = space(chromatic_sharp_notes[check(position + 5)]);
          transition[i] = space(chromatic_flat_notes[check(position + 5)]);
          break;
        case 5:
          notes[i] = space(chromatic_sharp_notes[check(position + 7)]);
          transition[i] = space(chromatic_flat_notes[check(position + 7)]);
          break;
        case 6:
          notes[i] = space(chromatic_sharp_notes[check(position + 9)]);
          transition[i] = space(chromatic_flat_notes[check(position + 9)]);
          break;
        case 7:
          notes[i] = space(chromatic_sharp_notes[check(position + 11)]);
          transition[i] = space(chromatic_flat_notes[check(position + 11)]);
          break;
        default:
          notes[i] = space(chromatic_sharp_notes[check(position)]);
          transition[i] = space(chromatic_flat_notes[check(position)]);
          break;
      }
    }
  }
  transition = transition_scale;
  return notes;    //Returns []notes, which is an array of type String, to be printed out
}

/*
check() is used when dealing with []chromatic_flat_notes or []chromatic_sharp_notes to ensure that for() loops wrap around when constructing scales.
If a number is greater than 11, or less than 0, it will add or subtract 12 and return a number in the range [0, 11].
This is used to mimic movement between octaves, but its primary use is used to avoid ArrayOutOfBoundsExcetion errors...

num = The number to be "checked"
*/

int check(int num)
{
  if(num >= 12)
  {
    num -= 12;
  }
  else if(num < 0)
  {
    num += 12;
  }
  else {}
  return num;
}

/*
wrap() is just like check() (see above) but is used for []key_scale which only has 7 index values.
*/

int wrap(int num)
{
  if(num > 7)
  {
    num -= 7;
  }
  else if (num < 1)
  {
    num += 7;
  }
  else {}
  return num;
}

/*
space() takes a short string and adds spaces to make its length 3.
This ensures that when the notes are printed later in print_array(), they will line up nicely.
space() does nothing if the argument string is 3 or more notes long.

string = string to be spaced (will return string as normal if 3 or more characters long)
*/

String space(String string)
{
  if(string.length() == 1)    //If the string has only one character, put a space on either side
  {
    return " "+string+" ";
  }
  else if(string.length() == 2)    //If the string has two characters, put only a space at the beginning
  {
    return " "+string;
  }
  else
  {
    return string;
  }
}

/*
set_key() is used as a shortcut to be able to modify current_key and []key_notes with one function call

Key = Any one of the twelve musical keys: C, C#/Db, D, D#/Eb, E, F, F#/Gb, G, G#/Ab, A, A#/Bb, or B
*/

void set_key(String Key)
{
  int [] scale_degrees = {1, 2, 3, 4, 5, 6, 7};
  current_key = Key;
  key_scale = transpose(scale_degrees);
}

int flow()
{
  int rand = int(abs(randomGaussian()));
  if(int(randomGaussian()) <=1)
  {
    if(rand >= abs(center) && center > 0)
    {
      center++;
      return 1;
    }
    else if(rand >= abs(center) && center < 0)
    {
      center--;
      return -1;
    }
    else if(rand <= abs(center) && center > 0)
    {
      center++;
      return 1;
    }
    else if(rand <= abs(center) && center < 0)
    {
      center--;
      return -1;
    }
    else
    {
      if(int(random(2)) == 0)
      {
        center++;
        return 1;
      }
      else
      {
        center--;
        return -1;
      }
    }
  }
  else
  {
    return 0;
  }
}

String [] measure ()
{
  int[] measure = new int[8];
  int flow1 = flow();
  int flow2 = flow();
  for(int i = 0; i < 2; i++)
  {
    if(flow1 < 0 && transition_note != null)
    {
      if(transition_notes()[i].equals(space(key_scale[0]))||
         transition_notes()[i].equals(space(key_scale[2]))||
         transition_notes()[i].equals(space(key_scale[4])))
      {
        int index = 0;
        for(int j = 0; j < key_scale.length; j++)
        {
          if(key_scale[j].equals(transition_notes()[i]))
          {
            index = j;
            break;
          }
          else {}
        }
        measure[0] = index+1;
        break;
      }
      else if(transition_notes()[i+2].equals(space(key_scale[0]))||
              transition_notes()[i+2].equals(space(key_scale[2]))||
              transition_notes()[i+2].equals(space(key_scale[4])))
      {
        int index = 0;
        for(int j = 0; j < key_scale.length; j++)
        {
          if(key_scale[j].equals(transition_notes()[i+2]))
          {
            index = j;
            break;
          }
          else {}
        }
        measure[0] = index+1;
        break;
      }
      else
      {
        measure[0] = (int(random(2)) * 2) + 1;
      }
    }
    else if(flow1 > 0 && transition_note != null)
    {
      if(transition_notes()[i+2].equals(space(key_scale[0]))||
         transition_notes()[i+2].equals(space(key_scale[2]))||
         transition_notes()[i+2].equals(space(key_scale[4])))
      {
        int index = 0;
        for(int j = 0; j < key_scale.length; j++)
        {
          if(key_scale[j].equals(transition_notes()[i+2]))
          {
            index = j;
            break;
          }
          else {}
        }
        measure[0] = index+1;
        break;
      }
      else if(transition_notes()[i].equals(space(key_scale[0]))||
              transition_notes()[i].equals(space(key_scale[2]))||
              transition_notes()[i].equals(space(key_scale[4])))
      {
        int index = 0;
        for(int j = 0; j < key_scale.length; j++)
        {
          if(key_scale[j].equals(transition_notes()[i]))
          {
            index = j;
            break;
          }
          else {}
        }
        measure[0] = index+1;
        break;
      }
      else
      {
        measure[0] = (int(random(2)) * 2) + 1;
      }
    }
    else
    {
      measure[0] = (int(random(2)) * 2) + 1;
      break;
    }
  }
  for(int i = 1; i < 4; i++)
  {
    measure[i] = wrap(measure[i-1]+(flow1 * int((abs(randomGaussian())) + 1)));
    if(flow1 == 0)
    {
      flow1 = flow();
    }
    else {}
  }
  for(int i = 4; i < 8; i++)
  {
    measure[i] = wrap(measure[i-1]+(flow2 * int((abs(randomGaussian())) + 1)));
    if(flow2 == 0)
    {
      flow2 = flow();
    }
    else {}
  }
  if(measure[7] == 1||measure[7] == 3||measure[7] == 5)
  {
    measure[7] += flow2;
  }
  else {}
  if(measure[7] != 0)
  {
    transition_note = key_scale[wrap(measure[7] - 1)];
  }
  else
  {
    transition_note = key_scale[0];
  }
  return transpose(measure);
}

String [] transition_notes()
{
  int position = 0;
  boolean sharp = false;
  if(current_key.equals("C")||current_key.equals("F")||current_key.equals("Bb")||current_key.equals("Eb")||
     current_key.equals("Ab")||current_key.equals("Db")||current_key.equals("Gb"))
  {
    for(int i = 0; i < chromatic_flat_notes.length; i++)
    {
      if(transition_note != null && transition_note.equals(space(chromatic_flat_notes[i])))
      {
        position = i;
        sharp = false;
        break;
      }
      else if (transition_note == null) {}
      else {}
    }
  }
  else
  {
    for(int i = 0; i < chromatic_sharp_notes.length; i++)
    {
      if(transition_note != null && transition_note.equals(space(chromatic_sharp_notes[i])))
      {
        position = i;
        sharp = true;
        break;
      }
      else if (transition_note == null) {}
      else {}
    }
  }
  String[] notes = new String [4];
  if(sharp==false)
  {
    notes[0] = space(chromatic_flat_notes[check(position-2)]);
    notes[1] = space(chromatic_flat_notes[check(position-1)]);
    notes[2] = space(chromatic_flat_notes[check(position+1)]);
    notes[3] = space(chromatic_flat_notes[check(position+2)]);
  }
  else
  {
    notes[0] = space(chromatic_sharp_notes[check(position-2)]);
    notes[1] = space(chromatic_sharp_notes[check(position-1)]);
    notes[2] = space(chromatic_sharp_notes[check(position+1)]);
    notes[3] = space(chromatic_sharp_notes[check(position+2)]);
  }
  return notes;
}
