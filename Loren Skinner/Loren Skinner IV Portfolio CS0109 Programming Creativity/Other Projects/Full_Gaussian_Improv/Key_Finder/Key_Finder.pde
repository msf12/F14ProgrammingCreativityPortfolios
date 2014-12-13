/*
Key Finding Code: A code that utilizes an array of the chromatic scale tones and sorts them to be appropriate for a given (major) key.
Loren Skinner IV
*/

String [] chromatic_notes = {"C", "Db", "D", "Eb", "E", "F", "F#", "G", "Ab", "A", "Bb", "B"}; //List of all the notes in chromatic order
String []       key_notes = {"C", "D", "E", "G", "A", "Bb", "B", "Eb", "F#", "Ab", "Db", "F"}; //List of notes arranged by the current key (Default: Key of C)
// Equivilant scale degree: { 1 ,  2 ,  3 ,  5 ,  6 ,  b7 ,  7 ,  b3 ,#4/b5,  b6 ,  b2 ,  4 }
//                          [   Pentatonic Scale   ] [    Leading Tones    ] [Dissonant Tones] 

void setup()
{
  find_key("F");
  print_array(key_notes);
  find_key("Eb");
  print_array(key_notes);
  find_key("A");
  print_array(key_notes);
}

void draw() {}

//print_array() prints an array nicely for debugging purposes

void print_array (String[] array)
{
  print("{", array [0]);
  for(int i = 1; i < array.length; i++)
  {
    print(",", array [i]);
  }
  println("}");
}

/*
check() is simply a function to ensure that the value of 'position' in the find_key() function doesn't exceed 11 to avoid "ArrayIndexOutOfBoundsException" error
while keeping position mapped to the correct scale degrees. (It essentially causes 'position' to "wrap around" the scale when it reaches the end.)
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

//The find_key() function utilizes a StringList to reorganize the chromatic_notes array into the key_notes array based on the key given

void find_key (String Key)
{
  StringList new_key = new StringList ();
  int position = 0;
  for(int i = 0; i < chromatic_notes.length; i++)
  {
    if(Key == chromatic_notes[i])
    {
      position = i;
      break;
    }
    else {}
  }
  new_key.append(chromatic_notes[position]);
  new_key.append(chromatic_notes[check(position+2)]);
  new_key.append(chromatic_notes[check(position+4)]);
  new_key.append(chromatic_notes[check(position+7)]);
  new_key.append(chromatic_notes[check(position+9)]);
  new_key.append(chromatic_notes[check(position+10)]);
  new_key.append(chromatic_notes[check(position+11)]);
  new_key.append(chromatic_notes[check(position+3)]);
  new_key.append(chromatic_notes[check(position+6)]);
  new_key.append(chromatic_notes[check(position+8)]);
  new_key.append(chromatic_notes[check(position+1)]);
  new_key.append(chromatic_notes[check(position+5)]);
  key_notes = new_key.array();
}
