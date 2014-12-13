/*-------------------------------\
|Flow Improv v. 2                |
|Loren Skinner IV                |
|Last updated: 14 November 2014  |
\-------------------------------*/

//GLOBAL VARIABLES//

int center = 0;    //For use with flow().
int range = 12;    //For use with flow().
int [] scale_degrees = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12};    //Corresponding to a chromatic scale starting on C.
String current_key = null;    //Stores the current key to know whether to use sharps or flats in enharmonics. Change by calling get_key(String Key).
int [] key_scale = new int[7];    //Stores the degrees in the diatonic scale of the current key. Change by calling get_key(String Key)
int [] mode_scale = new int[7];    //Stores the current modal scale. Change by calling get_mode(int mode), and is automatically changed upon calling get_key()
int last_note = 0;    //Stores the last note played to ensure transition between measures. Changed automatically upon calling measure()

/*
wrap7() takes an integer and maps it to a number in the range [0, 6].
Use to avoid ArrayOutOfBounds errors with key_scale[] by calling key_scale[wrap7(index#)].

num = number to be checked
*/

int wrap7 (int num)
{
  if(num > 6)    //if the number given is greater than 7 (it shouldn't get any greater than 13)
  {
    return num -= 7;    //take away 7 and return the number (which should now be in the range [0, 6]
  }
  else if (num < 0)    //if the number is less than 0 (it shouldn't get any less than -7)
  {
    return num += 7;    //add 7 and return the number (which should now be in the range [0, 6]
  }
  else    //if the number is already in the range [0, 6]
  {
    return num;    //return the number back (it's fine already!)
  }
}

/*
wrap12() takes an integer and maps it to a number in the range [0, 11].
Use to avoid ArrayOutOfBounds errors with scale_degrees[] by calling scale_degrees[wrap12(index#)].

num = number to be checked
*/

int wrap12 (int num)
{
  if(num > 11)    //if the number given is greater than 11 (it shouldn't get any greater than 23)
  {
    return num -= 12;    //take away 12 and return the number (which should now be in the range [0, 11]
  }
  else if (num < 0)    //if the number is less than 0 (it shouldn't get any less than -12)
  {
    return num += 12;    //add 12 and return the number (which should now be in the range [0, 11]
  }
  else    //if the number is already in the range [0, 11]
  {
    return num;    //return the number back (it's fine already!)
  }
}

/*
get_mode() alters mode_scale[] to reflect a given mode. It does this by rearranging key_scale[].
Use this for chord changes in the diatonic squence.

mode = The new mode
Valid Inputs: 1(ionian), 2(dorian), 3(phrygian), 4(lydian), 5(mixolydian), 6(aeolean), 7(locrian)
*/

void get_mode (int mode)
{
  for(int i = 0; i < key_scale.length; i++)
  {
    mode_scale[i] = key_scale[wrap7(mode+(i-1))];
  }
}

/*
get_key() updates the current key and changes the key_scale[] and mode_scale[] arrays to the
diatonic scale and ionian mode respectivelly. 
Use it when the music changes key signatures

Key = The new key
Valid inputs: C, C#, Db, D, D#, Eb, E, F, F#, Gb, G, G#, Ab, A, A#, Bb, B
*/

void get_key (String Key)
{
  current_key = Key;    //Changes the current_key accordingly
  int starting_degree;    //Initializes the starting_degree variable as the basis for changing key_scale[] (see below)
  
  //This sequene of "if" statements serves to translate between a Key (String) and a scale degree (int)
  if(Key.equals("C"))
  {
    starting_degree = 1;
  }
  else if(Key.equals("C#") || Key.equals("Db"))
  {
    starting_degree = 2;
  }
  else if(Key.equals("D"))
  {
    starting_degree = 3;
  }
  else if(Key.equals("D#") || Key.equals("Eb"))
  {
    starting_degree = 4;
  }
  else if(Key.equals("E"))
  {
    starting_degree = 5;
  }
  else if(Key.equals("F"))
  {
    starting_degree = 6;
  }
  else if(Key.equals("F#") || Key.equals("Gb"))
  {
    starting_degree = 7;
  }
  else if(Key.equals("G"))
  {
    starting_degree = 8;
  }
  else if(Key.equals("G#") || Key.equals("Ab"))
  {
    starting_degree = 9;
  }
  else if(Key.equals("A"))
  {
    starting_degree = 10;
  }
  else if(Key.equals("A#") || Key.equals("Bb"))
  {
    starting_degree = 11;
  }
  else if(Key.equals("B"))
  {
    starting_degree = 12;
  }
  else
  {
    starting_degree = 0;    //This will not register as a note in transpose()!!
  }
  //This sets the diatonic scale degrees based on the starting scale degree
  key_scale[0] = starting_degree;
  key_scale[1] = wrap12(starting_degree + 2);
  key_scale[2] = wrap12(starting_degree + 4);
  key_scale[3] = wrap12(starting_degree + 5);
  key_scale[4] = wrap12(starting_degree + 7);
  key_scale[5] = wrap12(starting_degree + 9);
  key_scale[6] = wrap12(starting_degree + 11);
  get_mode (1);    //This rewrites modal_scale[] to the ionian mode of the new degree to prevent accidentaly returning to the previous mode saved
}

/*
print_iarray() prints an array of integers in an organized fashion. 
Use this to print arrays of integers to the terminal in the form: {1, 2, 3, ... ,n}

int[] array = The array to be printed
*/

void print_iarray (int[] array)
{
  print("{");    //Prints an opening bracket
  for(int i = 0; i < (array.length - 1); i++)
  {
    print(array[i]+", ");    //Prints all but the last element of the array separated by a comma
  }
  println(array[(array.length - 1)]+"}");    //Prints the last element of the array and ends with a closing bracket
}

/*
print_sarray() prints an array of strings in an organized fashion.
Use this to print arrays of strings to the terminal in the form: {string1string2string3...stringn}
Note: The string arrays I use are pre-spaced on both ends, so this function does not include spaces between the elements!

String[] array = The array to be printed
}
*/

void print_sarray (String[] array)
{
  print("{");    //Prints an opening bracket
  for(int i = 0; i < array.length; i++)
  {
    print(array[i]);    //Prints all the elemts of the array. Add [+" "] minus the brackets before the last parenthesis to include spacing.
  }
  println("}");    //Prints a closing bracket
}

/*
print_measure() prints an array of notes (Strings) that represent a measure.
Use this to print measures of notes to the terminal in the form: | N  N  N  N  N  N  N  N | (each "N" is a note)
Call: print_measure( transpose( measure() ) )

String[] array = The array of notes. Use measure() to generate, then transpose() to change the notes into strings.
*/

void print_measure (String[] array)
{
  print("|");
  for(int i = 0; i < array.length; i++)
  {
    print(array[i]);
  }
  println("|");
}

/*
transpose() takes an array of integers (scale degrees) and turns them into Strings (note names).
Use it as the penultimate function call before a print() function. ex: print_measure( transpose( ... ) )

int[] int_array = the array of integers (with elements ranging from [1, 12]) to be transposed
*/

String [] transpose (int[] int_array)
{
  String [] note_array = new String[int_array.length];    //Creates a new array of equal length to the integer array
  for(int i = 0; i < int_array.length; i++)
  {
    //This "switch" statement converts each scale degree into the apprpriate note name (based on current_key)
    switch(int_array[i])
    {
      case 1:
        note_array [i] = " C ";
        break;
      case 2:
        if(current_key.equals("C")||current_key.equals("F")||
           current_key.equals("Bb")||current_key.equals("Eb")||
           current_key.equals("Ab")||current_key.equals("Db")||
           current_key.equals("Gb"))
        {
          note_array [i] = " Db";
          break;
        }
        else
        {
          note_array [i] = " C#";
          break;
        }
      case 3:
        note_array [i] = " D ";
        break;
      case 4:
        if(current_key.equals("C")||current_key.equals("F")||
           current_key.equals("Bb")||current_key.equals("Eb")||
           current_key.equals("Ab")||current_key.equals("Db")||
           current_key.equals("Gb"))
        {
          note_array [i] = " Eb";
          break;
        }
        else
        {
          note_array [i] = " D#";
          break;
        }
      case 5:
        note_array [i] = " E ";
        break;
      case 6:
        note_array [i] = " F ";
        break;
      case 7:
        if(current_key.equals("C")||current_key.equals("F")||
           current_key.equals("Bb")||current_key.equals("Eb")||
           current_key.equals("Ab")||current_key.equals("Db")||
           current_key.equals("Gb"))
        {
          note_array [i] = " Gb";
          break;
        }
        else
        {
          note_array [i] = " F#";
          break;
        }
      case 8:
        note_array [i] = " G ";
        break;
      case 9:
        if(current_key.equals("C")||current_key.equals("F")||
           current_key.equals("Bb")||current_key.equals("Eb")||
           current_key.equals("Ab")||current_key.equals("Db")||
           current_key.equals("Gb"))
        {
          note_array [i] = " Ab";
          break;
        }
        else
        {
          note_array [i] = " G#";
          break;
        }
      case 10:
        note_array [i] = " A ";
        break;
      case 11:
        if(current_key.equals("C")||current_key.equals("F")||
           current_key.equals("Bb")||current_key.equals("Eb")||
           current_key.equals("Ab")||current_key.equals("Db")||
           current_key.equals("Gb"))
        {
          note_array [i] = " Bb";
          break;
        }
        else
        {
          note_array [i] = " A#";
          break;
        }
      case 12:
        note_array [i] = " B ";
        break;
    }
  }
  return note_array;    //returns the array of notes
}

/*
flow() either returns 1 (up), -1 (down), and on rare occasions, 0 (flat).
It is designed to return values such that each up will eventually have a
down to compliment it, and the more successfull ups generated, the more
likely it is to generate a down (and vice versa). As such, succesive values
of flow() create an oscillating pattern of ups and downs that flow together,
hence the name.*/

int flow()
{
  //This number detirmines if the next value will continue or change direction
  int rand = (int(abs(randomGaussian())) + range);
  //This code runs ~95% of the time due to Gaussian distribution
  if(int(randomGaussian()) <= 1)
  {
    /*
    The rules of flow are simple:
    -If rand is larger than the current distance from the center,
    the value returned is random. This ensures that when close
    to zero, flow returns relatively random numbers (which evens
    out by the nature of probability).
    -If rand is smaller than the current distance from the center, 
    the value returned is in the opposite direction. This ensures that
    the values returned keep the flow within a certain range. 
    */
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
      center--;
      return -1;
    }
    else if(rand <= abs(center) && center < 0)
    {
      center++;
      return 1;
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
        center --;
        return -1;
      }
    }
  }
  //This code runs ~5% of the time due to Gaussian distribution
  else
  {
    return 0;
  }
}

int [] measure ()
{
  int [] measure = new int[8];
  int flow = flow();
  if(last_note != 0)
  {
    if(flow < 0)
    {
      for(int i = 0; i < 2; i++)
      {
        if(transition_notes()[i] == mode_scale[0]||
           transition_notes()[i] == mode_scale[2]||
           transition_notes()[i] == mode_scale[4])
        {
             measure[0] = transition_notes()[i];
             break;
        }
        else {}
      }
    }
    else if (flow > 0)
    {
      for(int i = 2; i < 4; i++)
      {
        if(transition_notes()[i] == mode_scale[0]||
           transition_notes()[i] == mode_scale[2]||
           transition_notes()[i] == mode_scale[4])
        {
             measure[0] = transition_notes()[i];
             break;
        }
        else {}
      }
    }
    else
    {
      measure[0] = last_note;
    }
  }
  else
  {
    measure[0] = mode_scale[int(random(3))*2];
  }
  int index = 0;
  for(int i = 0; i < mode_scale.length; i++)
  {
    if(measure[0] == mode_scale[i])
    {
      index = i;
      break;
    }
    else {}
  }
  int next_note = index;
  for(int i = 1; i < 4; i++)
  {
    next_note += flow();
    measure[i] = mode_scale[wrap7(next_note)];
  }
  if(next_note == 0 || next_note == 2 || next_note == 4)
  {
    next_note = int(random(3))*2;
  }
  else
  {
    if(next_note == 5)
    {
      next_note = 4;
    }
    else if(next_note == 6)
    {
      next_note = 0;
    }
    else if(int(random(2)) == 0)
    {
      next_note --;
    }
    else
    {
      next_note ++;
    }
  }
  measure[4] = mode_scale[wrap7(next_note)];
  for(int i = 5; i < 8; i++)
  {
    next_note += flow();
    measure[i] = mode_scale[wrap7(next_note)];
  }
  return measure;
}

int [] transition_notes()
{
  int position = 0;
  for(int i = 0; i < scale_degrees.length; i++)
  {
    if(last_note != 0 && last_note == scale_degrees[i])
    {
      position = i;
      break;
    }
    else if (last_note == 0) {}
    else {}
  }
  int [] notes = new int [4];
  notes[0] = scale_degrees[wrap12(position-2)];
  notes[1] = scale_degrees[wrap12(position-1)];
  notes[2] = scale_degrees[wrap12(position+1)];
  notes[3] = scale_degrees[wrap12(position+2)];
  return notes;
}

void setup()
{
  get_key("Bb");
  get_mode(2);
  print_sarray( transpose( measure() ) );
  get_mode(5);
  print_sarray( transpose( measure() ) );
  get_mode(1);
  print_sarray( transpose( measure() ) );
  print_sarray( transpose( measure() ) );
  exit();
}
  
