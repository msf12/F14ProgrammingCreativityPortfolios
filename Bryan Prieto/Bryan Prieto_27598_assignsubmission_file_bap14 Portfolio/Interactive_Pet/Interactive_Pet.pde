//Interactive Character, 2014 Dec 9
//by Bryan Prieto, bap14@hampshire.edu
//CS109, Hampshire College
//text generator function orignally coded by Lee Spector, updated by Bryan Prieto

//As a final I want to create a code that shows computivity.
//but also with a personal goal of creating some interactivity and sense of animation. 

int size = 70;
float angle = 0.0;   //eye setup variables
int eyeX;
int eyeY;
PImage img;     // variable image

int margin = 24;    //sentence formating
int font_size = 18;
int leading = 3;
int line_number = 0;

void setup() {
  size(480, 480);
  smooth();
  eyeX = width/2; //eye placed in middle of window
  eyeY = height/2;
  img = loadImage("nature.jpg"); //load up the image used
  PFont fontA = loadFont("CourierNewPSMT-20.vlw");  //font
  textFont(fontA, font_size);
}


// this textln method can be used in place of println to send text BOTH to the
// console and to the graphic/applet display
void textln(String text_to_print) {
  int max_lines = (height - (2 * margin)) / (font_size + leading);
  println(text_to_print);
  // Use fill() to change the value or color of the text
  fill(0);
  text(text_to_print, margin, margin);
}

// From here down is code for generating very simple sentences.

// a utility to return a random element of an array of strings
String random_string (String[] string_array) {
  return string_array[int(random(string_array.length))];
}

// return a string containing a random article
String article () {
  String[] articles = { 
    "a", "the", "your", "this"
  };
  return random_string(articles);
}

// return a string containing a random noun
String noun () {
  String[] nouns = { 
    "man", "woman", "owner", "bone", "pup", "dog", "cat"
  };
  return random_string(nouns);
}

// return a string containing a random verb
String verb () {
  String[] verbs = { 
    "bit", "took", "saw", "licked", "carried", "heard", "loved", "cuddled", "hated", "chased", "called", "dominated", "obeyed"
  };
  return random_string(verbs);
}

//string of random adverb
String adverb() {
  String[] adverbs = { 
    "well", "hard", "badly", "all crazy", "all cute-like", "sadly"
  };
  return random_string(adverbs);
}

//string of random punctuation
String punct() {
  String[] puncts = { 
    ".", "!"
  };
  return random_string(puncts);
}


// return a string containing a random sentence
String sentence () {
  String[] sentences = {
  article() + " " + noun() + " " + verb() + " " + article() + " " + noun() + " " + adverb() + punct()  //random sentence
  ,"I love you.", "When will you feed me?","I want tummy wubs.", "When will my owner get home?", "*growl*"  //or one of these phrases
}; 
  return random_string(sentences);
}


void draw() {
  background(204);
  image(img, 0, 0, 650, 650);  //draw the image loaded
  angle = atan2(mouseY - eyeY, mouseX - eyeX); //caculate angle based on mouse position from the center
  fill(178, 132, 5);
  strokeWeight(4);
  stroke(106, 73, 7);

  //BODY
  beginShape(); 
  {
    vertex(100, 310);
    vertex(30, 400);
    vertex(0, 500);
    vertex(225, 500);
    vertex(210, 400);
    vertex(220, 350);
    endShape();
  }

  line(165, 380, 185, 500);
  ellipse(195, 270, 200, 200);  //head
  noStroke();
  arc(205, 270, 215, 190, 0, PI);
  pushMatrix();  //pushes transformations
  translate(eyeX, eyeY); //moves all shapes within the matrix to the center
  fill(255); 
  ellipse(-10, 0, size+5, size+5); //white eye
  noStroke();
  fill(20, 31, 142);
  ellipse(-5, 0, size+5, size+7); //blue eye
  fill(0);
  ellipse(0, 0, size, size);  //black eye
  rotate(angle); //move the following shapes based on the position of mouse by angle
  fill(255);
  ellipse(size/4, 0, size/2, size/2); //eye follow
  popMatrix();
  ellipse(225, 255, 17, 15); //smaller white eye

  //EAR
  noStroke();
  fill(178, 132, 5);
  arc(170, 230, 135, 260, PI, PI+HALF_PI+QUARTER_PI/2);
  ellipse(185, 125, 105, 45);
  stroke(106, 73, 7);
  fill(106, 73, 7);
  beginShape(); 
  {
    vertex(120, 175);
    vertex(145, 120);
    vertex(165, 117);
    vertex(120, 175);
    endShape();
  }

  //MOUTH
  fill(178, 132, 5);
  stroke(106, 73, 7);
  arc(272, 290, 80, 60, QUARTER_PI, HALF_PI+QUARTER_PI);
}

void keyPressed() {   //When SPACEBAR is pressed, creates speech bubble and changes character's expression
  if (key == ' ')
    noLoop();
  fill(255);
  noStroke();
  ellipse(230, 20, 500, 100);
  beginShape(); 
  {
    vertex(320, 50);
    vertex(350, 300);
    vertex(340, 50);
    endShape();
  }  
  fill(0);
  arc(268, 295, 80, 85, 0, PI);
  fill(100, 0, 0);
  arc(250, 295, 45, 45, 0, PI);
  stroke(0);
  strokeWeight(2);
  fill(178, 132, 5);
  arc(235, 290, 80, 50, PI+QUARTER_PI, TWO_PI-QUARTER_PI);
  textln(sentence()); //prints sentence
}

