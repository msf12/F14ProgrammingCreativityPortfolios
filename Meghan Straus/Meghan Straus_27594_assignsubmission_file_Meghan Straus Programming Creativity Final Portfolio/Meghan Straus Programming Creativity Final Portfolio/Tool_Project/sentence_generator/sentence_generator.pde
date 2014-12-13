//sentence_tool
//Meghan Straus, mes13@hampshire.edu

//Sets the margin, font size, leading, and line number 
//the font. Credit to Lee's sentence generation code her.
int margin = 70;
int font_size = 16;
int leading = 4;
int line_number = 15;

//This boolean causes the "Press Spacebar" text to only appear once.
boolean drawSentence = true;


void setup() {
  size(640, 400);
  background(100);
  noLoop();
  //Loads the font here. Times New Roman
  PFont fontA = loadFont("Times-Roman-16.vlw");
  textFont(fontA, font_size);
  
//textln prints the text in the bottom rectangle
}

//Referenced both Lee's code and the Processing website for 
//this small section.
void textln(String text_to_print) {
  println(text_to_print);
  fill(0);
  textAlign(CENTER);
  text(text_to_print, 320, 345);

}
//I used Lee's simple sentence code from here down, editing it
//to fit my needs. Added another string for punctuation.

//Returns a random string from an array of strings.
String random_string (String[] string_array) {
  return string_array[int(random(string_array.length))];
}
//Returns a random article from an array of articles (Capitalized)
String ARTICLE () {
  String[] ARTICLES = { "A", "The"};
  return random_string(ARTICLES);
}
//Returns a string containing a random article (Uncapitalized)
String article () {
  String[] articles = { "a", "the"};
  return random_string(articles);
}

//Returns a string containing a random noun (first noun);
String noun1 () {
  String[] nouns1 = {"king", "queen", "knight", "horse", "dragon"};
  return random_string(nouns1);
}

//Returns a string containing a random noun (second noun);
String noun2 () {
  String[] nouns2 = {"king", "queen", "knight", "horse", "dragon"};
  return random_string(nouns2);
}

//Returns a string containing a random verb
String verb () {
  String[] verbs = { "fought", "carried", "loved", "hated", "flew"};
  return random_string(verbs);
}
//Returns a string containing a random sentence
String sentence () {
  return ARTICLE() + " " + noun1() + " " + verb() + " " + article() + " " + noun2() + ".";
}
void draw(){  
  //Creates the background rectangles.
  stroke(204, 150, 0);
  strokeWeight(3);
  fill(255);
  rect(50, 20, 540, 300);
  
  fill(255);
  rect(50, 325, 540, 30); 
 
 //Draws the sentence at the bottom of the screen only once
 if(drawSentence){
    fill(200);
    textAlign(CENTER);
    text("Press Spacebar to generate another sentence", 320, 380);
   drawSentence = false;
 }
  fill(0);
  textln(sentence()); 
}
//Redraws for a new sentence every time the spacebar is pressed
void keyPressed() {
  if (key == ' ') {
    redraw();
  }
   
}


  
  


