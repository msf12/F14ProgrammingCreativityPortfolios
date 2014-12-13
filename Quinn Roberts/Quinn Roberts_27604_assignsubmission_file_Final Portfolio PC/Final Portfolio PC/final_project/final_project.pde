/*
Sentence creation tool
By Quinn Roberts
Code used from Lee Spector's text_area_sentence program and Loren's code
10/28/14
*/

//stores parts of speech
String[] nouns;
String[] articles;
String[] verbs;
String[] adjectives;
String[] adverbs;
String[] pronouns;
String[] prepositions;
String[] conjuctions;
String[] interjections;

//stores output
String[] sentences;

//window size
int height = 800;
int width = 800;

//grid settings
int rows = 4;
int columns = 4;
int box_size = width/4;

//Button Labels
String[][] labels = {{"noun","articles", "interjections", "number of sentences"}, 
                   {"verbs", "adverbs", "number up", "number down"},
                   {"adjectives", "pronouns", "reset word order", "run"},
                   {"prepositions", "conjuctions","show grammar", "save"}};

//number of sentences
int sentenceNumber = 10;

//Tracks button pressed
int buttonNumber;

//Tracks word order, starts off with an Article
int[] wordOrder = new int[0];



void setup(){
  //loads the word banks from the respective .txt files to the in-program arrays
  nouns = loadStrings("nouns.txt");
  articles = loadStrings("articles.txt");
  verbs = loadStrings("verbs.txt");
  adjectives = loadStrings("adjectives.txt");
  adverbs = loadStrings("adverbs.txt");
  pronouns = loadStrings("pronouns.txt");
  prepositions = loadStrings("prepositions.txt");
  conjuctions = loadStrings("conjuctions.txt");
  interjections = loadStrings("interjections.txt");
  //creates a window with the specified width and height
  size(width, height);
  //runs grid()
  grid();
}

//Draws a grid
//Copied from Loren
void grid (){
  //Sets the rectangle drawing mode to corner: (x_coordinate, y_coordinate, x_width, y_width)
  rectMode(CORNER);
  //Iterates through every column
  for(int i = 0; i < columns; i++){
    //Iterates through every element (one in each row) of the current column
    for(int j = 0; j < rows; j++){
      //Set the stroke color to black
      stroke(0);
      //Set the fill color to white
      fill(255);
      //Draw a rectangle at the appropriate position, and of size "box_size"
      rect(i*box_size, j*box_size, box_size, box_size);
      fill(0);
      textSize(16);
      //adds labels to the respective box
      text(labels[i][j],i*box_size+box_size/2,j*box_size+box_size/2);
      
    }
  }
  fill(0);
  noLoop();
  textAlign(CENTER,CENTER);
}

//Tracks where the mouse is pressed
//Modified from Loren's mousePressed method
void mousePressed(){
  //Stop the draw loop (redrawing the grid() )
  noLoop();
  //This will tell you which box you are in relative to the x direction:  -> [0][1][2][3][4]...etc
  int xinc = int((mouseX-(mouseX % box_size))/box_size);
  //This will tell you which box you are in relative to the y direction:  |  [1]
  int yinc = int((mouseY-(mouseY % box_size))/box_size);
  //Assigns the xinc and yinc combinations a number
  if(yinc == 0){
    if(xinc == 0){
      buttonNumber = 0;
    }else if(xinc == 1){
      buttonNumber = 1;
    }else if(xinc == 2){
      buttonNumber = 2;
    }else if(xinc == 3){
      buttonNumber = 3;
    }
  }else if(yinc == 1){
    if(xinc == 0){
      buttonNumber = 4;
    }else if(xinc == 1){
      buttonNumber = 5;
    }else if(xinc == 2){
      buttonNumber = 6;
    }else if(xinc == 3){
      buttonNumber = 7;
    }
  }else if(yinc == 2){
    if(xinc == 0){
      buttonNumber = 8;
    }else if(xinc == 1){
      buttonNumber = 9;
    }else if(xinc == 2){
      buttonNumber = 10;
    }else if(xinc == 3){
      buttonNumber = 11;
    }
  }else if(yinc == 3){
    if(xinc == 0){
      buttonNumber = 12;
    }else if(xinc == 1){
      buttonNumber = 13;
    }else if(xinc == 2){
      buttonNumber = 14;
    }else if(xinc == 3){
      buttonNumber = 15;
    }
  }
  //runs the method that acts on a button press 
  buttonTracker();
}

//Executes the button associated with buttonNumber's current value
void buttonTracker(){
  //Adds a noun to the sentence
  if(buttonNumber == 0){
    wordOrder = append(wordOrder, 0);
    println("Noun");
  //Adds a verb to the sentence
  }else if(buttonNumber == 1){
    wordOrder = append(wordOrder, 1);
    println("Verb");
  //Adds an adjective to the sentence
  }else if(buttonNumber == 2){
    wordOrder = append(wordOrder, 2);
    println("Adjective");
  //Adds a Preposition to the sentence
  }else if(buttonNumber == 3){
    wordOrder = append(wordOrder, 3);
    println("Preposition");
  //Adds a article to the sentence
  }else if(buttonNumber == 4){
    wordOrder = append(wordOrder, 4);
    println("Article");
  //Adds an adverb to the sentence
  }else if(buttonNumber == 5){
    wordOrder = append(wordOrder, 5);
    println("Adverb");
  //Adds a pronoun to the sentence
  }else if(buttonNumber == 6){
    wordOrder = append(wordOrder, 6);
    println("Pronoun");
  //Adds a conjuction to the sentence
  }else if(buttonNumber == 7){
    wordOrder = append(wordOrder, 7);
    println("Conjuction");
  //Adds an interjection to the sentence
  }else if(buttonNumber == 8){
    wordOrder = append(wordOrder, 8);
    println("Interjection");
  //Increases the number of sentences generated by one
  }else if(buttonNumber == 9){
    sentenceNumber++;
    println("Sentence number increased");
  //Resets sentence order to original state (one article)
  }else if(buttonNumber == 10){
    wordOrder = new int[0];
    println("Word order reset");
  //Prints the current word order
  }else if(buttonNumber == 11){
    viewWordOrder();
  //Prints the current numbers of sentences to be generated
  }else if(buttonNumber == 12){
    println("Sentences to be printed: " + sentenceNumber);
  //Increases the number of sentences generated by one
  }else if(buttonNumber == 13){
    sentenceNumber--;
    println("Sentence number decreased");
  //runs the sentence generator
  }else if(buttonNumber == 14){
    generateSentences(wordOrder, sentenceNumber);
    printArray(sentences);
  }else if(buttonNumber == 15){
    saveSentences(sentences, ' ');
  }
}

//Converts wordOrder into words
void viewWordOrder(){
  for(int i = 0; i < wordOrder.length; i++){
    if(wordOrder[i] == 0){
      print("Noun ");
    }else if(wordOrder[i] == 1){
      print("Verb ");
    }else if(wordOrder[i] == 2){
      print("Adjective ");
    }else if(wordOrder[i] == 3){
      print("Preposition ");
    }else if(wordOrder[i] == 4){
      print("Article ");
    }else if(wordOrder[i] == 5){
      print("Adverb ");
    }else if(wordOrder[i] == 6){
      print("Pronoun ");
    }else if(wordOrder[i] == 7){
      print("Conjuction ");
    }else if(wordOrder[i] == 8){
      println("Interjection ");
    }
  }
}

// a utility to return a random element of an array of strings
// copied from Lee Spector's text_area_sentence program
String random_string(String[] string_array){
  return string_array[int(random(string_array.length))];
}

// return a string containing a random article
// modified from Lee Spector's text_area_sentence program
String article(){
  return random_string(articles);
}
  
// return a string containing a random noun
// modified from Lee Spector's text_area_sentence program
String noun(){
  return random_string(nouns);
}

// return a string containing a random verb
// modified from Lee Spector's text_area_sentence program
String verb(){
  return random_string(verbs);
}

// return a string containing a random adjective
// modified from Lee Spector's text_area_sentence program
String adjective(){
  return random_string(adjectives);
}

// return a string containing a random adverb
// modified from Lee Spector's text_area_sentence program
String adverb(){
  return random_string(adverbs);
}

// return a string containing a random pronoun
// modified from Lee Spector's text_area_sentence program
String pronoun(){
  return random_string(pronouns);
}

// return a string containing a random preposition
// modified from Lee Spector's text_area_sentence program
String preposition(){
  return random_string(prepositions);
}

// return a string containing a random conjuction
// modified from Lee Spector's text_area_sentence program
String conjuction(){
  return random_string(conjuctions);
}

// return a string containing a random interjection
// modified from Lee Spector's text_area_sentence program
String interjection(){
  return random_string(interjections);
}

// return an string array containing a specified number of random sentences
// modified from Lee Spector's text_area_sentence program
void generateSentences(int[] order, int number){
  String[] temp = new String[number];
  for(int i = 0; i<number; i++){
    String s = "";
    for (int j = 0; j< wordOrder.length; j++){
      if(wordOrder[j] == 0){
        s += noun() + " ";
      }else if(wordOrder[j] == 1){
        s += verb() + " ";
      }else if(wordOrder[j] == 2){
        s += adjective() + " ";
      }else if(wordOrder[j] == 3){
        s += preposition() + " ";
      }else if(wordOrder[j] == 4){
        s += article() + " ";
      }else if(wordOrder[j] == 5){
        s += adverb() + " ";
      }else if(wordOrder[j] == 6){
        s += pronoun() + " ";
      }else if(wordOrder[j] == 7){
        s += conjuction() + " ";
      }else if(wordOrder[j] == 8){
        s += interjection() + " ";
      }
    }
    temp[i] = s;
  }
  sentences = temp;
}

//Creates a text file from the input name and given string array in the same folder as the program
void saveSentences(String fileName, String[] export){
  saveStrings(fileName, export);
}

void draw(){
  grid();
}
