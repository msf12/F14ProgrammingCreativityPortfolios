/*-----------------------------\
|Flow Improv (v 3.1)           |
|Loren Skiner IV               |
|Last Updated: 11 December 2014|
\------ -----------------------*/

int center = 0;  //Sets a center value to be used with flow()
int range = 24;  //Sets a range variable to be used with flow()
String current_key = null;  //Stores the current key to be used throughout
int [] key_scale = new int[7];  //Stores the current diatonic scale to derive modes
int [] mode_scale = new int[7];  //Stores the current modal scale to use for note generation
int [] chromatic_scale = {1,2,3,4,5,6,7,8,9,10,11,12};  //Stores all the notes as chromatic scale degrees
int last_note = 0;  //Stores the last note used to be referenced

void setup()
{
  //Default vi-ii-V-I progression in Bb
  set_key("Bb");
  set_mode(6);
  measure();
  set_mode(2);
  measure();
  set_mode(5);
  measure();
  set_mode(1);
  measure();
  exit();
}

/*
rhythm() generates an array with 8 elements corresponding to the number of eighth note beats in a measure.
Each element detirmines the rhythmic structure of the measure.

0 = rest
1 = new note
2 = hold the last note
*/

int[] rhythm()
{
  int[] bar = new int[8];  //Create a new array named "bar"
  if(int(random(2)) == 0)  //Half of the time...
  {
    for(int i = 0; i < bar.length; i++)  //...fill the array with random (50/50) ones and zeroes...
    {
      if(int(random(3)) == 0)
      {
        bar[i] = 0;
      }
      else
      {
        bar[i] = 1;
      }
    }
    for(int i = 0; i < (bar.length) - 1; i++)
    {
      if(bar[i] == 1 || bar[i] == 2)  //...find all the one's and twos...
      {
        if(int(random(5)) == 0)  //...and change the number after (since two cannot proceed zero) to a two one-fifth of the time.
        {
          bar[i+1] = 2;
        }
        else {}
      }
      else {}
    }
  }
  else    //The other half of the time...
  {
    for(int i = 0; i < bar.length; i++)  //...fill the array with all ones...
    {
      bar[i] = 1;
    }
    if(int(random(3)) == 0)  //...and change a third of the ones to twos.
    {
      for(int i = 0; i < (bar.length) - 1; i++)
      {
        if(bar[i] == 1 || bar[i] == 2)
        {
          if(int(random(5)) == 0)
          {
            bar[i+1] = 2;
          }
          else {}
        }
        else {}
      }
    }
  } 
  return bar;
}

/*
measure() takes the rhythm array from rhythm() and converts ones and twos into notes
and zeroes into rests. Generation of the next note is dependant on flow().
*/

void measure()
{
  int[] notes = rhythm();  //Create a rhythm array which will be directly modified
  if(notes[0] == 1)
  {
    notes[0] = mode_scale[wrap7(int(random(3))*2)];
  }
  else {}
  for(int i = 1; i < (notes.length - 1); i++)
  {
    if(notes[i] == 0) {}  //If the array element is a zero, do nothing.
    else if(notes[i] == 1 && notes[i-1] == 0 && notes[i+1] == 0)  //If the array element is an isolated one, meaning it is separated by rests...
    {
      notes[i] = mode_scale[wrap7(int(random(3))*2)];  //...make it a consonant note...
      last_note = notes[i];  //...and record the last note.
    }
    else if(notes[i] == 1 && notes[i-1] == 1 && notes[i+1] == 1)  //If the array element is a one surrounded by other ones...
    {
      notes[i] = mode_scale[wrap7(last_note + flow())];  //...generate a new note using flow() based upon the last note...
      last_note = notes[i];  //...and record the last note.
    }
    else if(notes[i] == 1 && notes[i+1] == 2)  //If the array element is a one and the next element is a two (meaning the note will be held out)...
    {
      notes[i] = mode_scale[wrap7(int(random(3))*2)];  //...make it a consonant note...
      last_note = notes[i];  //...and record the last note.
    }
    else if(notes[i] == 1 && notes[i-1] == 1 && notes[i+1] == 0)  //If the array element is a one and is proceeded by a zero...
    {
      if(wrap7(last_note+1) == mode_scale[0] ||  //...find a consonant note a step away from the last note...
         wrap7(last_note+1) == mode_scale[2] ||
         wrap7(last_note+1) == mode_scale[4])
      {
        notes[i] = last_note+1;  //...and use it...
        last_note = notes[i];  //...and record the last note.
      }
      else if(wrap7(last_note-1) == mode_scale[0] ||  //Ditto for above...
              wrap7(last_note-1) == mode_scale[2] ||
              wrap7(last_note-1) == mode_scale[4])
      {
        notes[i] = last_note-1;
        last_note = notes[i];  //...until here
      }
      else  //If a consonant cannot be found a reasonable distance away...
      {
        notes[i] = mode_scale[wrap7(int(random(3))*2)];  //...use a consonant note...
        last_note = notes[i];  //...and record the last note
      }
    }
    else if(notes[i] == 2)  //If the array element is a two...
    {
      notes[i] = -1;  //...hold the last note out. (In actuallity, the program simply remembers the note played before the "two" element and just uses a symbol to hold out the last note)
    }
    else {}
  }
  if(notes[7] == 0) {}
  else if(notes[7] == 1 && notes[6] == 0)
  {
    notes[7] = mode_scale[wrap7(int(random(3))*2)];
    last_note = notes[7];
  }
  else if(notes[7] == 1 && notes[6] == 1)
  {
    notes[7] = wrap7(last_note + flow());
    last_note = notes[7];
  }
  else if(notes[7] == 2)
  {
    notes[7] = -1;
  }
  else {}
  print_measure( transpose(notes) );  //Lastly, transpose and print the measure!
}

//This print_array() function prints integer arrays.

void print_iarray(int[] array)
{
  println();
  print("{"+array[0]);
  for(int i = 1; i < array.length; i++)
  {
    print(", "+array[i]);
  }
  println("}");
}

/*
wrap7() takes an integer and maps it to a number in the range [0, 6].
Use to avoid ArrayOutOfBounds errors with key_scale[] by calling:
key_scale[wrap7(index#)].

num = number to be checked
*/

int wrap7 (int num)
{
  if(num > 6)
  {
    return num % 7;
  }
  else if (num < 0)
  {
    return (7 - (abs(num) % 7)) % 7;
  }
  else
  {
    return num;
  }
}

/*
wrap12() takes an integer and maps it to a number in the range [0, 11].
Use to avoid ArrayOutOfBounds errors with scale_degrees[] by calling:
scale_degrees[wrap12(index#)].

num = number to be checked
*/

int wrap12 (int num)
{
  if(num > 11)
  {
    return num % 12;
  }
  else if (num < 0)
  {
    return (12 - (abs(num) % 12)) % 12;
  }
  else
  {
    return num;
  }
}

//This print_array() function prints string arrays.

void print_sarray(String[] array)
{
  println();
  print("{"+array[0]);
  for(int i = 1; i < array.length; i++)
  {
    print( array[i] );
  }
  println("}");
}

//This "print_array" function prints string arrays in a different format.

void print_measure(String[] notes)
{
  println();
  print("|");
  for(int i = 0; i < notes.length; i++)
  {
    print(notes[i]);
  }
  println("|");
}

/*
space() takes a string of three characters or less and spaces it
to make it three characters long for use in transpose()
*/

String space(String string)
{
  if(string.length() > 3)
  {
    return "N/A";
  }
  else if(string.length() == 1)
  {
    return " "+string+" ";
  }
  else if(string.length() == 2)
  {
    return " "+string;
  }
  else
  {
    return string;
  }
}

/*
set_key() updates the current key and changes the key_scale[] and 
mode_scale[] arrays to the diatonic scale and ionian mode respectivelly. 
Use it when the music changes key signatures

Key = The new key
Valid inputs: C, C#, Db, D, D#, Eb, E, F, F#, Gb, G, G#, Ab, A, A#, Bb, B
*/

void set_key (String Key)
{
  current_key = Key;    //Changes the current_key accordingly
  int starting_degree;    /*Initializes the starting_degree variable
                          as the basis for changing key_scale[] (see below)*/
  
  /*This sequene of "if" statements serves to translate between a
  Key (String) and a scale degree (int)*/
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
  set_mode (1);    //This rewrites modal_scale[] to ionian (major)
}

/*
set_mode() alters mode_scale[] to reflect a given mode. It does this by
rearranging key_scale[].
Use this for chord changes in the diatonic squence.

mode = The new mode
Valid Inputs: 1(ionian), 2(dorian), 3(phrygian), 4(lydian),
5(mixolydian), 6(aeolean), 7(locrian)
*/

void set_mode (int mode)
{
  for(int i = 0; i < key_scale.length; i++)
  {
    mode_scale[i] = key_scale[wrap7(mode+(i-1))];
  }
}

/*
transpose() takes an array of integers (scale degrees) and turns
them into Strings (note names).
Use it as the penultimate function call before a print() function.
ex: print_measure( transpose( ... ) )

int[] int_array = the array of integers to be transposed
*/

String [] transpose (int[] int_array)
{
  String [] note_array = new String[int_array.length];
  //Creates a new array of equal length to the integer array
  for(int i = 0; i < int_array.length; i++)
  {
    /*This "switch" statement converts each scale degree
    into the apprpriate note name (based on current_key)*/
    switch(int_array[i])
    {
      case -1:  //-1 is the integer representation of "hold the last note"
        note_array [i] = "---";
        break;
      case 0:  //0 is the integer representation of a rest
        note_array [i] = "   ";
        break;
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
