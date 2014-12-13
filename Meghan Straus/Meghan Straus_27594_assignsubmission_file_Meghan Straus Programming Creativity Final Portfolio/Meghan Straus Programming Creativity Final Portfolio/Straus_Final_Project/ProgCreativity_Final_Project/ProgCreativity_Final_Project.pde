//sentence_tool
//Meghan Straus, mes13@hampshire.edu

//Floats are used to generate the same number in two arrays.
float r = random(1, 10);
float t = random(1, 7);
float s = random(1,4);

//Creates arrays for character generation
PImage[] face = new PImage[7];
PImage[] eyes = new PImage[8];
PImage[] hair = new PImage[7];
PImage[] body = new PImage[10];
PImage[] world = new PImage[4];


//Sets the margin, font size, leading, and line number 
//of the the font.
int margin = 70;
int font_size = 16;
int leading = 4;
int line_number = 15;
boolean drawSentence = true;

void setup() {
  size(640, 400);
   noLoop();
   //Loads the font here. Times New Roman
  PFont fontA = loadFont("Times-Roman-16.vlw");
  textFont(fontA, font_size);
  
  
//Below are all the different images for generation
world[0] = loadImage("world1.png");
world[1] = loadImage("world2.png");
world[2] = loadImage("world3.png");
world[3] = loadImage("world4.png");

face[0] = loadImage("face1.png");
face[1] = loadImage("face2.png");
face[2] = loadImage("face3.png");
face[3] = loadImage("face4.png");
face[4] = loadImage("face5.png");
face[5] = loadImage("face6.png");
face[6] = loadImage("face7.png");

eyes[0] = loadImage("eyes1.png");
eyes[1] = loadImage("eyes2.png");
eyes[2] = loadImage("eyes3.png");
eyes[3] = loadImage("eyes4.png");
eyes[4] = loadImage("eyes5.png");
eyes[5] = loadImage("eyes6.png");
eyes[6] = loadImage("eyes7.png");

hair[0] = loadImage("hair1.png");
hair[1] = loadImage("hair2.png");
hair[2] = loadImage("hair3.png");
hair[3] = loadImage("hair4.png");
hair[4] = loadImage("hair5.png");
hair[5] = loadImage("hair6.png");
hair[6] = loadImage("hair7.png");

body[0] = loadImage("clothes1.png");
body[1] = loadImage("clothes2.png");
body[2] = loadImage("clothes3.png");
body[3] = loadImage("clothes4.png");
body[4] = loadImage("clothes5.png");
body[5] = loadImage("clothes6.png");
body[6] = loadImage("clothes7.png");
body[7] = loadImage("clothes8.png");
body[8] = loadImage("clothes9.png");
body[9] = loadImage("clothes10.png");


  
//textln prints the text in the bottom rectangle. Used Lee's code at 
//first and then wrote it out on my own from the Processing website
}

void textln(String text_to_print) {
  println(text_to_print);
  fill(0);
  textAlign(CENTER);
  text(text_to_print, 320, 345);

}
//I used Lee's simple sentence code from here down, editing it
//to fit my needs. 

//Random string generator from Lee's program
String random_string (String[] string_array) {
  return string_array[int(random(string_array.length))];
}

//Returns a random string from the array of heads. Edited Lee's 
//random string generator to generate with a random float instead.
String random_body (String[] string_array) {
  return string_array[int(r)];
}
  
String random_head (String[] string_array) {
  return string_array[int(t)];
}

String random_world (String[] string_array) {
  return string_array[int(s)];
}
//Returns a string containing a noun. Matches the noun with the body
//chosen by the float.
String body () {
  String[] body1 = {"mage", "mage", "mage", "warrior", "warrior", "warrior", "warrior", "ranger", "ranger", "ranger"};
  return random_body(body1);
}

String head () {
  String[] heads1 = {"human", "human", "human", "human", "fae", "orc", "demonic"};
  return random_head(heads1);
}

String world () {
  String[] worlds1 = {"the tundra", "the city", "the desert", "the forest"};
  return random_world(worlds1);
}

//Truly random generation. Uses Lee's random string generation.
String like1() {
  String[] likes1 = {"money", "fire", "birds", "weapons", "magical items", "books", "jewels", "music", "animals", "wenches", "mead"};
  return random_string(likes1);
}

String like2() {
  String[] likes2 = {"money", "fire", "birds", "weapons", "magical items", "books", "jewels", "music", "animals", "wenches", "mead"};
  return random_string(likes2);
}


//Returns a string containing a sentence that has been generated 
//by the above functions.
String sentence () {
  return "You are a " + head() + " " + body() + ". " + "You were born in" + " " + world() + ". " + "You enjoy" + " " + like1() + " " + "and" + " " + like2() + ". ";
}
void draw(){  
  //Creates the background rectangles.
  background(100);
  stroke(204, 150, 0);
  strokeWeight(3);
  fill(255);
  rect(50, 20, 540, 300);
   
  //Draws the character
  image(world[(int)s], 52, 22, width/1.19, height/1.34);
  image(body[(int)r],260,49,width/5.4,height/1.5);
  image(face[(int)t],260,40,width/5.4,height/3.5);
  image(eyes[(int)random(7)],260,40,width/5.4,height/3.5);
  image(hair[(int)random(7)],260,40,width/5.4,height/3.5);
  
  //Draws the sentences at the bottom of the screen
  textln(sentence()); 
}
//Redraws everything when the user presses the spacebar. Also 
//re-randomizes the floats for a new result every time.
void keyPressed() {
  if (key == ' ') {
    r = random(1,10);
    t = random(1,7);
    s = random(1,4);
    redraw();
  }
   
}


  
  


