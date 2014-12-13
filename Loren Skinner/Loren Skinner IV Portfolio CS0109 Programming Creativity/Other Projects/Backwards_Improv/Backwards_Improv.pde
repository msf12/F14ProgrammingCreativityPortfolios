String [] chromatic_sharp_notes = {"C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B"};
String [] chromatic_flat_notes  = {"C", "Db", "D", "Eb", "E", "F", "Gb", "G", "Ab", "A", "Bb", "B"};
String [] maj_notes = new String[10];//{"1", "2", "3", "5", "6", "4", "7", "b3", "b7", "#4"}
String [] min_notes = new String[9]; //{"1", "3", "4", "5", "7", "2", "6", "b5", "#7"}
//                                     [   Pentatonic Scale   ]           [ Leading Tones ]
//                                     [         Consonant Scale         ] [  Dissonance  ]
//Notes are organized so consonant notes come first, then leading or "dissonant" notes

ArrayList<String> notes = new ArrayList<String>();
String last_note = "_";
int first_note = 0;

void setup()
{
  print_array(find_key("C"));
//  print_array(find_key("F#"));
//  print_music(compose(measure(find_key("C"))));
//  print_music(compose(measure(find_key("C"))));
//  print_music(compose(measure(find_key("C"))));
//  print_music(compose(measure(find_key("C"))));
  print_music(four_bars("C","C","C","C"));
  exit();
}

/*
The print_array() and print_list() functions print Arrays/ArrayLists nicely
Debugging purposes only (Only take <String> type arguments)
*/

void print_array (String [] array)
{
  print("{"+array [0]);
  for(int i = 1; i < array.length; i++)
  {
    print(array [i]);
  }
  println("}");
}

void print_list(ArrayList <String> list)
{
  print("{"+space(list.get(0)));
  for(int i = 1; i < list.size(); i++)
  {
    print(space(list.get(i)));
  }
  println("}");
}

//The print_music() function prints music nicely

void print_music (ArrayList list)
{
  int measure = 0;
  int measures = list.size()/8;
  for(int k = 0; k < (measures - measures % 4) / 4; k++)
  {
    print("|");
    for(int j = 0; j < 4; j++)
    {
      for (int i = 0; i < 8; i++)
      {
        print(space(list.get((8*measure)+i).toString()));
      }
      print("|");
      measure++;
    }
    println();
  }
  if(measures % 4 != 0)
  {
    print("|");
    for(int j = 0; j < measures % 4; j++)
    {
      for (int i = 0; i < 8; i++)
      {
        print(space(list.get((measures - measures % 4) + i).toString()));
      }
      print("|");
      measure++;
    }
  }
  else {}
}

/*
check() is simply a function to ensure that the value of 'position' in the
find_key() function doesn't exceed 11 to avoid "ArrayIndexOutOfBoundsException" error
while keeping position mapped to the correct scale degrees.
(It essentially causes 'position' to "wrap around" the scale when it reaches the end.)
*/

int check (int number)
{
  if (number >= 12)
  {
    number -= 12;
    return number;
  }
  else if (number < 0)
  {
    number += 12;
    return number;
  }
  else
  {
    return number;
  }
}

int mcheck (int number)
{
  if(number >= 11)
  { 
    number -= 11;
    return number;
  }
  else if (number < 0)
  {
    number += 11;
    return number;
  }
  else
  {
    return number;
  }
}

//Space keeps the notes uniformly separated so the measures line up (helps with reading)

String space(String string)
{
  if (string.length() == 1)
  {
    return " "+string+" ";
  }
  else if (string.length() == 2)
  {
    return " "+string;
  }
  else
  {
    return string;
  }
}

String [] find_key(String Key)
{
  StringList new_key = new StringList ();
  int position = 0;
  if (Key=="G"||Key=="D"||Key=="A"||Key=="E"||Key=="B"||Key=="F#")
  {
    for (int i = 0; i < chromatic_sharp_notes.length; i++)
    {
      if (Key == chromatic_sharp_notes[i])
      {
        position = i;
        break;
      }
      else {}
    }
    for(int i = 0; i < 12; i++)
    {
      new_key.append(space(chromatic_sharp_notes[check(position+i)]));
    }
    new_key.remove(1);
    return new_key.array();
  }
  else if (Key=="C"||Key=="F"||Key=="Bb"||Key=="Eb"||Key=="Ab"||Key=="Db"||Key=="Gb")
  {
    for (int i = 0; i < chromatic_flat_notes.length; i++)
    {
      if (Key == chromatic_flat_notes[i])
      {
        position = i;
        break;
      }
      else {}
    }
    for(int i = 0; i < 12; i++)
    {
      new_key.append(space(chromatic_flat_notes[check(position+i)]));
    }
    new_key.remove(1);
    return new_key.array();
  }
  else
  {
    String[]error = {"Couldn't determine key..."};
    return error;
  }
}



String[] measure (String[] scale)
{
  String [] measure = {"_", "_", "_", "_", "_", "_", "_", "_"};
  int position = 0;
  int mposition = 0;
  if(first_note == 0)
  {
    switch(int(random(3)))
    {
      case 0:
        measure[0] = scale[0];
        break;
      case 1:
        measure[0] = scale[3];
        break;
      case 2:
        measure[0] = scale[6];
        break;
    }
  }
  else
  {
    measure[0] = scale[first_note];
  }
  first_note();
  switch(first_note)
  {
    case 0:
      switch(int(random(5)))
      {
        case 0:
          measure[7] = scale[1];
          break;
        case 1:
          measure[7] = scale[2];
          break;
        case 2:
          measure[7] = scale[8];
          break;
        case 3:
          measure[7] = scale[9];
          break;
        case 4:
          measure[7] = scale[10];
          break;
      }
      case 3:
      switch(int(random(3)))
      {
        case 0:
          measure[7] = scale[1];
          break;
        case 1:
          measure[7] = scale[2];
          break;
        case 2:
          measure[7] = scale[4];
          break;
      }
      case 6:
      switch(int(random(4)))
      {
        case 0:
          measure[7] = scale[5];
          break;
        case 1:
          measure[7] = scale[7];
          break;
        case 2:
          measure[7] = scale[8];
          break;
        case 3:
          measure[7] = scale[9];
          break;
      }
  }
  switch(int(random(3)))
  {
    case 0:
      measure[4] = scale[0];
      switch(int(random(5)))
      {
        case 0:
          measure[3] = scale[10];
          break;
        case 1:
          measure[3] = scale[9];
          break;
        case 2:
          measure[3] = scale[8];
          break;
        case 3:
          measure[3] = scale[1];
          break;
        case 4:
          measure[3] = scale[2];
          break;
      }
    case 1:
      measure[4] = scale[3];
      if(int(random(2)) == 0)
      {
        measure[3] = scale[2];
        break;
      }
      else
      {
        measure[3] = scale[4];
        break;
      }
    case 2:
      measure[4] = scale[6];
      switch(int(random(3)))
      {
        case 0:
          measure [3] = scale[5];
          break;
        case 1:
          measure [3] = scale[7];
          break;
        case 2:
          measure [3] = scale[8];
          break;
      }
  }
  switch(int(random(8)))
  {
    case 0:
      measure[7] = scale[1];
      last_note = measure[7];
      break;
    case 1:
      measure[7] = scale[2];
      last_note = measure[7];
      break;
    case 2:
      measure[7] = scale[4];
      last_note = measure[7];
      break;
    case 3:
      measure[7] = scale[5];
      last_note = measure[7];
      break;
    case 4:
      measure[7] = scale[7];
      last_note = measure[7];
      break;
    case 5:
      measure[7] = scale[8];
      last_note = measure[7];
      break;
    case 6:
      measure[7] = scale[9];
      last_note = measure[7];
      break;
    case 7:
      measure[7] = scale[10];
      last_note = measure[7];
      break;
  }
  return measure;
}

void first_note()
{
  switch(int(random(3)))
  {
    case 0:
      first_note = 0;
      break;
    case 1:
      first_note = 3;
      break;
    case 2:
      first_note = 6;
      break;
  }
}
    
ArrayList<String> four_bars (String key1, String key2, String key3, String key4)
{
  ArrayList<String> music = new ArrayList<String>();
  for(int i = 0; i < 8; i++)
  {
    music.add(compose(measure(find_key(key1))).get(i).toString());
  }
  for(int i = 0; i < 8; i++)
  {
    music.add(compose(measure(find_key(key2))).get(i).toString());
  }
  for(int i = 0; i < 8; i++)
  {
    music.add(compose(measure(find_key(key3))).get(i).toString());
  }
  for(int i = 0; i < 8; i++)
  {
    music.add(compose(measure(find_key(key4))).get(i).toString());
  }
  return music;
}

ArrayList compose(String[] measure)
{
  ArrayList <String> melody = new ArrayList <String>();
  for(int j = 0; j < 1; j++)
  {
    ArrayList<String> temp = new ArrayList <String>();
    for(int i = 0; i < measure.length; i++)
    {
      temp.add(measure[i]);
    }
    for(int i = 0; i < temp.size(); i++)
    {
      melody.add(temp.get(i));
    }
    temp.clear();
  }
  return melody;
}

