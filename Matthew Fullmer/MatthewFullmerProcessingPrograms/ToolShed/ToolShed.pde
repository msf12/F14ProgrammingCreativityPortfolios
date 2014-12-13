////12/11/14
//Matthew Fullmer
//CS - 109 Programming Creativity
//
//This is the ToolShed program, designed with one feature in mind: showcase all the class's Tool projects presented in the online Tools program
//Also, use some of its variables in a fractal-based program that draws a fern.
//In the one hand, this program succeeds. It does, as accurately as possible, combine the applications the class designed into a seamless whole. However, the variables that were sent to the fractal program tended to break it.
//Everything working at once is also bizarre and extremely difficult to keep in order. I've done the best I can, but there are places where I do not know why or how particular things work.
//This is actually a program I would like to return to at some point in order to unravel the crazy knot that makes this whole thing tick.
//Also, I would love to make a combination program of the Final Projects because I think that would be incredibly cool to see and would offer even more possiblilities for creative computing.
//Having said all this, I have done my best to comment the program and how I understand its functionality. There are some parts that may be disappointing, yet I am still amazed that all the various applications eventually worked out the way they did.
//Away, here goes.



//THESE ARE THE VARIABLES LABELED WITH THE NAME OF THE PERSON'S PROGRAM THAT USES THEM
//I've also left much of the original comments intact as they have helped me in figuring out what various pieces of code do.


//Matthew Variables///////////
float value1 = 0;
float boxSize = 75;
int value2 = 0;
int value3 = 0;
int randoShaper = 1;
float mousePosX = mouseX;
float mousePosY = mouseY; 
float posX = width/2;
float posY = height/2;
float posZ = width*height/2;
int dirX = 50;
int dirY = 50;
int dirZ = 50;
/////////////////////////////
//Alexi Variables///////////
int canvas_size = 700;

int [][] myellipse = { 
  {
    250, 250, 25, 25, 8, 99, 56, 0
  }
  , //ellipse1 x,y, radius, speed, r, b, g
  {
    375, 270, 25, 25, 10, 99, 56, 0
  }
  , //ellipse2 x,y, radius, speed, r, b, g
  {
    355, 250, 25, 25, 6, 99, 56, 0
  }
  , //ellipse3 x,y, radius, speed, r, b, g
  {
    450, 230, 25, 25, 8, 99, 56, 0
  }
  , //ellipse4 x,y, radius, speed, r, b, g
  {
    265, 265, 25, 25, 6, 99, 56, 0
  }
  , //ellipse5 x,y, radius, speed, r, b, g
  {
    345, 245, 25, 25, 8, 99, 56, 0
  }
  , //ellipse6 x,y, radius, speed, r, b, g
  {
    450, 450, 25, 25, 8, 99, 56, 0
  }
  , 
  {
    75, 75, 25, 25, 8, 99, 56, 0
  }
  , 
  {
    125, 125, 25, 25, 6, 99, 56, 0
  }
  , 
  {
    175, 100, 25, 25, 8, 99, 56, 0
  }
  , 
  {
    265, 200, 25, 25, 10, 99, 56, 0
  }
  , 
  {
    380, 400, 25, 25, 6, 99, 56, 0
  }
}; 

int [] colorprox = {
  0, 0, 0
}; //a proxy that stores color 
int [] rectcolor = {
  99, 56, 0
}; //sets the rect color at the start of draw, before the loop where rectangles spawn

int speed = 1; // creates movement
int time = 10000; //10 seconds
float direction = 1.1;
float accel = 1.5;
int state = 1;
boolean go = false; //go is set to false
boolean ubounce = false; //
///////////////////////////////
//Annaleigh////////////////////
int[] fillVal = {
  255, 255, 255
};
/////////////////////////////////
//Bryan//////////////////////////
boolean drawing = false; //make "draw" variable, set to "off"
int A = 20; // size of circle
float xPosition = width-10;
float yPosition;
float xSpeed;
float ySpeed;
/////////////////////////////////
//Gabrielle///////////////////////////
int rectWidth;
/////////////////////////////////////////
//Howard///////////////////////////////////////
PImage img;
PImage arrow;
float x;
float y;
////////////////////////////////////////////////////////
//Kwasi////////////////////////////////////////////////
String[] answers = {
  "Yes", "No", "Maybe", "Stop Whining", "Try Harder"
};
//Kwasi///////////////////////////////////////////////
//Loren////////////////////////////////////////////////
int center = 0;    //This is required to use flow()!! Change at your own risk! (Don't risk it...)
int range  = 2;
//Loren////////////////////////////////////////////////
//Meghan//////////////////////////////////////////////////////
int margin = 70;
int font_size = 16;
int leading = 4;
int line_number = 15;
boolean drawSentence = true;
//Meghan//////////////////////////////////////////////////////
//Shepardson////////////////////////////////////////////////////////
Character cowman;
Character gendarme;
Character tradesman;
Character indian;

int[] a = new int[100];
int[] b = new int[100];
int[] c = new int[100];
int[] d = new int[100];

String a1 = "THE COWMAN";
String b1 = "THE GENDARME";
String c1 = "THE UNSKILLED TRADESMAN";
String d1 = "THE INDIAN SOVEREIGN";
String Attributes [] = {
  null, "a shrinking violet", "gregarious", null, "meek", "grandiloquent", null, "superstitious", "evil", null, "repugnant", "alluring", null, "conciliatory", "pugnacious", null, "stupid", "erudite"
};
String Dispositions [] = {
  null, "familiar", "friendly", "annoyed", "nervous", "fixing his evil gaze upon", "suspicious"
};

int a2 = 0;
int b2 = 1;
int c2 = 2;
int d2 = 3;
int scene = 0;
//Shepardson/////////////////////////////////////////////////////////////////////////////
//Valentina//////////////////////////////////////////////////////////////////////////////////
Dot[] dots;
int countDot = 15;
int drawlines;
//Valentina/////////////////////////////////////////////////////////////////////////////////
//Zane////////////////////////////////////////////////////////////////////////////////////////
int[] Intro = new int[32];
int[] NatMinorScale = {
  1, 3, 4, 6, 8, 9, 11, 13
};
//Zane////////////////////////////////////////////////////////////////////////////////////////
//Quinn/////////////////////////////////////////////////////////////////////////////////////////
//stores parts of speech
String[] Qnouns;
String[] Qarticles;                        //All of Quinn's variables had to be renamed as there is another program that uses the same names
String[] Qverbs;
String[] Qadjectives;
String[] Qadverbs;
String[] Qpronouns;
String[] Qprepositions;
String[] Qconjuctions;
String[] Qinterjections;

//stores output
String[] Qsentences;
//Quinn////////////////////////////////////////////////////////////////////////////////////////////////


void setup()
{
  size(500, 500, P3D);
  if (frame != null) 
  {
    frame.setResizable(true);  //Allows the window to be resized. This should have been removed in retrospect as many of the programs had to be edited to accomodate this 
  }
  stroke(0);
  strokeWeight(1.5);
  yPosition = height-10;
  ySpeed = random(-8, 16);        //An attempt at automating Bryan's painting program by giving the ellipses in his program the ability to move. Did not function in the end and had to be scrapped as figuring out why it was not working was taking too much time
  xSpeed = random(-8, 16);
  //Howard///////////////////////////////////////////////
  img  = loadImage("img.gif"); 
  arrow = loadImage("arrow.gif");
  x = 1;
  //Howard////////////////////////////////////////////////
  //Meghan//////////////////////////////////////////////////
  PFont fontA = loadFont("Times-Roman-16.vlw");
  textFont(fontA, font_size);
  ///////Meghan/////////////////////////////////////////////
  //Shepardson///////////////////////////////////////////////
  cowman = new Character (a, a1, a2);
  gendarme = new Character (b, b1, b2);
  tradesman = new Character (c, c1, c2);
  indian = new Character (d, d1, d2);
  //Shepardson/////////////////////////////////////////////////
  //Valentina//////////////////////////////////////////////////
  dots = new Dot[countDot]; //add dots to canvas
  for (int i=0; i< countDot; i++) {
    dots[i] = new Dot(random(width+400), random(height), 5); // randomize dot placement, define diameter
  }
  //Valentina///////////////////////////////////////////////
  //Zane/////////////////////////////////////////////////////////////
  GenerateIntro();
  println(Intro);
  //Zane////////////////////////////////////////////////////////////
  //Quinn//////////////////////////////////////////////////////////////
  Qnouns = loadStrings("nouns.txt");
  Qarticles = loadStrings("articles.txt");
  Qverbs = loadStrings("verbs.txt");
  Qadjectives = loadStrings("adjectives.txt");
  Qadverbs = loadStrings("adverbs.txt");                           //More of Quinn's variables that all needed to be renamed
  Qpronouns = loadStrings("pronouns.txt");
  Qprepositions = loadStrings("prepositions.txt");
  Qconjuctions = loadStrings("conjuctions.txt");
  Qinterjections = loadStrings("interjections.txt");
  QgenerateSentences(10);
  saveSentences("sentences.txt", Qsentences);
  //Quinn//////////////////////////////////////////////////////////////////////
  //SUPER TURTLE?/////////////////////////////////////////////////////////////////
  setxy(width/2+400, height+300);  // move to near the bottom of the window
  angle = -90;           // the turtle starts facing up                                        //This should look familiar 
  penStateUp = true;         // the pen is initially up
  setpc(random(255), random(255), random(255)); //Tried to randomize the pen color. Not sure why it doesn't actually change color. Something is probably countering this somewhere in the program
  strokeWeight(1);
  //TURTLE TIME?//////////////////////////////////////////////////////////////
}

void draw() {
  //TurtleDraw();
  AlexiDraw(); //Alexi's program runs first as it will be in the background for only a sort time 
  ValentinaDraw();  //Again, program worked best when run in the background
  AnnaleighDraw();  //Prints HAPPY HALLOWEEN with a pumpkin
  ShepDraw();    //Doesn't really work                                //Literally calls everyone's draw methods, one at a time. Out of all my attempts to get this program working, this was the most efficent and easy to organized way to make the program run that also worked 
  MeghanDraw();   //Sentence-gen
  LorenDraw();    //FLOW. Near the front. Cuz it gets crazy at the front
  BryanDraw();    //Paint
  ZaneDraw();     //Sure, why not
  MatthewDraw();   //Anything run after my program is affected by its translate method. Menaning that everything starts orbiting the spheres that follow the mouse. Which is weid and probably more straight forward than I assume, but for the life of me cannot figure out
  HowardDraw();    //The orbting spinner is actually kinda fun
  KwasiDraw();   //Sphere with its own directional lighting, looks really cool
  BenDraw();     //The Bailey critic
  QuinnDraw();    //Ten random sentences from 9000 nouns. Very random
  GKDraw();        //Rhyming....kinda
 

  //noLoop();   //This program must loop or die
}
//Matthew///////////////////////////////////////////////////////////////////////////
void MatthewDraw() //Matthew Tool Program (filling orb that w/ orbital. 3D program)
{
  //background(value2);
  mousePosX = mouseX;
  mousePosY = mouseY; 


  if (mousePressed)
  {
    translate(width/2, height/2, -100); //Press the mouse and the orbital and sphere move a certain distance from the mouse. Wanted to make it look like it was zooming out
    stroke(255);
    noFill();
    box(200);  //Also throws a 3D box into the middle of the screen. Because I wanted to see what would happen

    translate(mousePosX*2, mousePosY*2, mousePosY*2);  //this is for the smaller orbital that follows the larger sphere
    rotateX(mouseY * 0.05);
    rotateY(mouseX * 0.05);
    fill(mouseX * 2, mouseY%255, value1);
    sphereDetail(mouseX / 20);
    sphere(40);
  } else
  {
    background((mouseX + 5%255), mouseY/2, 250); //If you aren't pressing the mouse, it draws a background, so it appears that the sphere and its orbital are traveling in 3D space without a trail behind them
    stroke(255, 50);
    pendown();
    fern(2000);

    translate(mousePosX, mousePosY, mousePosY);
    rotateX(mouseY * 0.025);
    rotateY(mouseX * 0.025);
    fill(mouseX * 2, mouseY%255, 160);  //Edited the variables until I like how the sphere followed the mouse. I wanted the sensation of 3D movement left to right, up to down, and forward and back
    sphereDetail(mouseX / 50);
    sphere(60);
  }
  translate(mousePosX + 20, mousePosY, mousePosY);
  rotateX(mouseY * 0.025);  //Orbital code
  rotateY(mouseX * 0.025);
  fill(mouseX * 2, 0, 160);
  sphereDetail(mouseX / 20);
  sphere(30);

  if (keyPressed)
  {
    //Gabrielle//////////////////////////////////////////////////////////////////////////////
    if (key== 'a') {
      background(0, 0, 255);
    } else if (key== 'b') {
      background(22, 106, 217);                    //GABRIELLE'S program!!!
    } else if (key=='d') {                         // Changes the background if you press a specific key. Not too hard to implement since its functionality can live in another program just fine.
      background(22, 217, 171);
    } else if (key== 'e') {
      background(22, 217, 96);
    } else if (key== 'f') {
      background(22, 217, 22);
    } else if (key=='g') {
      background(142, 217, 22);
    } else if (key== 'h') {
      background(217, 217, 22);
    } else if (key== 'i') {
      background(217, 187, 22);
    } else if (key=='j') {
      background(217, 148, 22);
    } else if (key== 'k') {
      background(217, 119, 22);
    } else if (key== 'x') {
      background(22, 207, 217);
    } else if (key=='y') {
      background(22, 217, 184);
    } else if (key== 'z') {
      background(22, 217, 161);
    }
    //Gabrielle/////////////////////////////////////////////////////////////////////////////////

    if (key == 'c' || key == 'C')
    {
      camera(mouseX, height/2, (height/2) / tan(PI/6), width/2, height/2, 0, 0, 1, 0);
    }
    if (key == 'm' || key == 'M')
    {
      translate(width/2, height/2, -50);  //When you press the M key, creates a 3D pyramid shape that follows the mouse in a simialr way that the orbital does. Once again added because I wanted to see what would happen
      stroke(255);
      rotateX(PI/2);
      rotateZ(-PI/6);
      noFill();

      beginShape();
      vertex(-100, -100, -100);
      vertex( 100, -100, -100);
      vertex(   0, 0, 100);

      vertex( 100, -100, -100);
      vertex( 100, 100, -100);
      vertex(   0, 0, 100);

      vertex( 100, 100, -100);
      vertex(-100, 100, -100);
      vertex(   0, 0, 100);

      vertex(-100, 100, -100);
      vertex(-100, -100, -100);
      vertex(   0, 0, 100);
      endShape();
      noFill();
      ;
    }
  }
}
//Matthew/////////////////////////////////////////////////////////////////////

//This is Alexi's program. As far as I can tell, he has attempted to create a form of "gravity" that affects his ellipeses after 10 seconds. The gravity does not quite fit the bill, but the program itself was not too hard to make play nice with the others as it is relatively self-contained

//Alexi///////////////////////////////////////////////////////////////////////
void change() {

  //myellipse[x-coordinate] [y-coordinate] subtract/add speed (direction), multiplied by the speed parameter of myellipse
  myellipse[0][0] -= speed * myellipse[0][4];
  myellipse[1][1] -= speed * myellipse[1][4];
  myellipse[2][0] += speed * myellipse[2][4];
  myellipse[3][0] += speed * myellipse[3][4];
  myellipse[4][1] += speed * myellipse[4][4];
  myellipse[5][1] -= speed * myellipse[5][4];
  myellipse[6][1] -= speed * myellipse[6][4];
  myellipse[7][0] += speed * myellipse[7][4];
  myellipse[8][1] += speed * myellipse[8][4];
  myellipse[9][1] += speed * myellipse[9][4];
  myellipse[10][0] -= speed * myellipse[10][4];
  myellipse[11][1] += speed * myellipse[11][4];

  for (int i = 0; i < myellipse.length; i++) {

    if ((((myellipse[i][0] + myellipse[i][2]/2) > canvas_size) || (myellipse[i][0] - myellipse[i][2]/2 < 0)) ||
      (((myellipse[i][1] + myellipse[i][2]/2) > canvas_size) || (myellipse[i][1] - myellipse[i][3]/2 < 0))) {
      if (!ubounce) {                   // if ubounce is false, if nothing has bounced colorprox gets random rgb value. 
        colorprox[0] = int(random(255));
        colorprox[1] = int(random(255));
        colorprox[2] = int(random(255));
        ubounce = true; //ubounce is now true, colorprox doesn't get new color value.
      }
      //when it does bounce, myellipse color is changed to color stored in colorprobro, change direction too.
      myellipse[i][5] = colorprox[0]; 
      myellipse[i][6] = colorprox[1];
      myellipse[i][7] = colorprox[2];
      myellipse[i][4] *=-1;
    }
  }

  ubounce = false;  
  for (int i = 0; i < myellipse.length-1; i++) {
    if (myellipse[i][5] != myellipse[i+1][5] && myellipse[i][6] != myellipse[i+1][6] && myellipse[i][7] != myellipse[i+1][7]) { //check to see if any ellipse is a different color from the next ellipse.
      ubounce = true; //if not all the same color, ubounce is true.
      break; //stop loop.
    }
  }
}

float stop_and_drop() {
  go = false; 
  for (int i = 0; i < myellipse.length; i++) {
    speed *= accel;
    myellipse[i][1] += speed * direction;
    if (myellipse[i][1] + myellipse[i][3] > canvas_size) {
      direction *=-1.05;
      accel = .85;
    }
    if (speed < 1 && myellipse[i][1] + myellipse[i][3] < canvas_size) {
      speed = 1;
      accel = 1.15;
      direction *=-1.05;
      println(speed + " and " + accel + " and " + direction);
    }
    
  }
  println("The end: " + speed + " and " + accel + " and " + direction);
  return direction;
}

void AlexiDraw() {
  int CurrentTime = millis();
  if (go) {
    change(); //if go is true, do change function.
  } 
  //  if(mousePressed)
  //  {
  //    CurrentTime = 0;
  //  }

  if (state == 2) {
    background(100);

    stop_and_drop();
  } else { 
    background(203, 236, 255);
  }

  noStroke();

  for (int i = 0; i < myellipse.length; i++) { //spwans all ellipse stored in 2D array
    fill(myellipse[i][5], myellipse[i][6], myellipse[i][7]); //gets the color parameter from myellipse
    ellipse(myellipse[i][0], myellipse[i][1], myellipse[i][2], myellipse[i][3]); //defines the properties of the ellipse
  }
  if (CurrentTime > time) {
    state = 2;
  }
}
//Alexi///////////////////////////////////////////////////////////////////////////////////

//Annaleigh's program is very straight-forward and that's great. It prints out HAPPY HALLOWEEN. The only change was the removal of the background as that would break the functionality of clicking to see all the programs happenig at once

//Annaleigh///////////////////////////////////////////////////////////////////////////////

void AnnaleighDraw()
{


  //border
  fill(0); 
  triangle(0, 0, 0, 100, 100, 0);
  triangle(1100, 0, 1000, 0, 1100, 100);
  triangle(0, 500, 0, 400, 100, 500);
  triangle(1100, 500, 1100, 400, 1000, 500);
  fill(fillVal[0], fillVal[1], fillVal[2]);

  //"H"
  fill(0);
  rect(100, 100, 10, 150);
  rect(110, 160, 50, 10);
  rect(150, 100, 10, 150);
  fill(fillVal[0], fillVal[1], fillVal[2]);

  //"A"
  triangle(220, 100, 180, 250, 260, 250);

  //"P"
  fill(0);
  rect(290, 100, 10, 150);
  fill(fillVal[0], fillVal[1], fillVal[2]);
  triangle(300, 100, 360, 135, 300, 175);

  //"P"
  fill(0);
  rect(380, 100, 10, 150);
  fill(fillVal[0], fillVal[1], fillVal[2]);
  triangle(390, 100, 450, 135, 390, 175);


  //"Y"
  triangle(470, 100, 500, 175, 530, 100);
  fill(0);
  rect(495, 175, 10, 75);
  fill(fillVal[0], fillVal[1], fillVal[2]);

  ///////////////////////////////////////////////////////////

  //"H"
  fill(0);
  rect(260, 260, 10, 150);
  rect(270, 330, 50, 10);
  rect(320, 260, 10, 150);
  fill(fillVal[0], fillVal[1], fillVal[2]);

  //"A"
  triangle(390, 260, 350, 410, 430, 410);

  //"L"
  fill(0);
  rect(460, 260, 10, 150);
  rect(470, 400, 50, 10);

  //"L"
  rect(550, 260, 10, 150);
  rect(560, 400, 50, 10);
  fill(fillVal[0], fillVal[1], fillVal[2]);

  //"O" and pumpkin
  if (fillVal[0] == 255) {
    fill(#A5430A);
  } else {
    fill(random(70, fillVal[0]), random(70, fillVal[1]), random(70, fillVal[2]));
  }
  ellipse(660, 330, 124, 124);
  rect(655, 250, 10, 15);


  //"W"
  fill(fillVal[0], fillVal[1], fillVal[2]);
  fill(0);
  rect(740, 260, 10, 150);
  fill(fillVal[0], fillVal[1], fillVal[2]);
  triangle(780, 330, 750, 410, 810, 410);
  fill(0);
  rect(810, 260, 10, 150);
  fill(fillVal[0], fillVal[1], fillVal[2]);

  //"E"
  fill(0);
  rect(840, 260, 10, 150);      
  rect(850, 260, 50, 10);        //top
  rect(850, 330, 40, 10);        //middle
  rect(850, 400, 50, 10);        //bottom

  //"E"
  rect(930, 260, 10, 150);
  rect(940, 260, 50, 10);        //top
  rect(940, 330, 40, 10);        //middle
  rect(940, 400, 50, 10);        //bottom

  //"N"
  rect(1010, 260, 10, 150);
  rect(1070, 260, 10, 150);
  fill(fillVal[0], fillVal[1], fillVal[2]);
  triangle(1020, 260, 1070, 400, 1070, 380);


  ///////////////////////////////////////////////////////////

  //spider
  fill(#A5430A);
  line(800, 0, 800, 100);
  stroke(250);  //thread
  ellipse(800, 125, 50, 50);        //body

  //right legs
  line(819, 105, 840, 80);
  stroke(250);
  line(840, 80, 850, 90);
  stroke(250);
  line(823, 113, 850, 100);
  stroke(250);
  line(850, 100, 860, 110);
  stroke(250);
  line(825, 125, 860, 120);
  stroke(250);
  line(860, 120, 870, 130);
  stroke(250);
  line(821, 138, 858, 137);
  stroke(250);
  line(858, 137, 870, 150);
  stroke(250);

  //left legs
  line(782, 105, 755, 87);
  stroke(250);
  line(755, 87, 745, 95);
  stroke(250);
  line(776, 120, 746, 103);
  stroke(250);
  line(746, 103, 735, 112);
  stroke(250);
  line(775, 129, 743, 120);
  stroke(250);
  line(742, 120, 732, 132);
  stroke(250);
  line(780, 139, 747, 135);
  stroke(250);
  line(747, 135, 737, 145);
  stroke(250);
}

float HappyHalloween()
{
  return 8;
}

//Annaleigh///////////////////////////////////////////////////////////////////////////

//The Bailey critic. Had to output to the println since I could nont get textln Text Box to work without breaking the entire program. This was actually a very long fight and I wish I hadn't given up. I just could not figure out why the Text Screen would break the program

//Ben/////////////////////////////////////////////////////////////////////////////////
// word banks

String[] oldBands = {
  "Sonic Youth", "Swans", "King Crimson", "Arcade Fire", "Aphex Twin", "Radiohead", "Morrissey"
};

String[] decades = {
  "00s", "10s", "60s", "70s", "80s", "90s"
};

String[] pretentious_words = {
  "juxtaposition", "dichotomy", "dissonance"
};

String[] modifiers = {
  "quietly ambitious", "sophomoric", "warped", "decisively analog", "cliche", "trite", "intimate", "idiosyncratic", "effortless", "cerebral", "anxious"
};

String[] nouns = {
  "romp", "journey", "meditation", "concept", "pilgrimage", "odyssey"
};

String randomArray(String[] arr) {
  return arr[(int)random(arr.length)];
}

// words

String decade() {
  return randomArray(decades);
}

String oldBand() {
  return randomArray(oldBands);
}

String pretention() {
  return randomArray(pretentious_words);
}

String modifier() {
  if (random(2.0) > 1.7) {
    return randomArray(modifiers) + ", " + modifier();
  }
  return randomArray(modifiers);
}

String BenNoun() {
  return randomArray(nouns);
}

// phrases

String oldBandComparison() {
  return "Similar, but not quite identical to the " + pretention() + " of " + decade() + "-era " + oldBand() + " and " + decade() + "-era " + oldBand();
}

String previousEffort() {
  return "their previous effort feels " + modifier() + " in comparison.";
}

String firstHalf() {
  return "The first half of the album is a " + modifier() + " " + noun() + ", while";
}

String secondHalf() {
  return "the second half is more of a " + modifier() + " " + noun() + ".";
}

void BenDraw()
{
  float countwords;
  int firstA;
  String substr1;
  String substr2;
  String toPrint;
  for (int i = 0; i < 40; i++) {
    Boolean done = false;
    toPrint = oldBandComparison() + ", " + previousEffort() + " " + firstHalf() + " " + secondHalf() + "\n";
    // replaces a with an in relevant cases
    while (!done) {
      done = true;
      firstA = toPrint.indexOf(" a ");
      if ((toPrint.charAt(firstA+3) == 'a') || (toPrint.charAt(firstA+3) == 'e') || (toPrint.charAt(firstA+3) == 'i') || (toPrint.charAt(firstA+3) == 'o') || (toPrint.charAt(firstA+3) == 'u')) {
        println("in if statement");
        substr1 = toPrint.substring(0, firstA);
        substr2 = toPrint.substring(firstA+3, toPrint.length());
        toPrint = substr1 + " an " + substr2;
        done = false;
      }
    }
    // prints to text area
    println("The Bailey critic says: " + toPrint);
    countwords = CountWords(toPrint);
    println("Holy7Ball says " + answers[int (random(5))]);
  }
  //return countwords;
}

int CountWords (String in) {
   String trim = in.trim();
   if (trim.isEmpty()) return 0;
   return trim.split("\\s+").length; //separate string around spaces
}
//Ben/////////////////////////////////////////////////////////////////////////////////////////////////////

//The goal for Bryan's program was to automate the painting to make it appear as though the program was still doing what it had been designed to do: paint. However, after a long debate I decided to scrap the idea in favor of trying to maintain the orginal functionality of being able to paint with the program. This back-fired as the painting would affect the entire screen and the rest of the programs. Pressed for time and sick of it all, I confined the program to a smaller version of itself and scrapped the automation. The code is still mostly Bryan's, I just edited the size of the window

//Bryan//////////////////////////////////////////////////////////////////////////////////////////////////
void BryanDraw()
{
  //"color change" button
  fill(255);
  rect(width-120, height-120, 120, 120);
  fill (random(255), random(255), random(255));
  rect(width-120, height-20, 33, 20);
  if (xPosition>width) {
    xSpeed *= -1;
  }

  // checks to see if ball position is smaller than 0 (left wall)
  if (xPosition<width-120) {
    xSpeed *= -1;
  }
  if (yPosition<height-120) {
    ySpeed *= -1;
  }
  if (yPosition>height) {
    ySpeed *= -1;
  }

  //ellipse(xPosition, yPosition , A, A);  //circle drawn at mouse location. Since A=20, size default is (20, 20)
  xPosition += random(xSpeed);
  yPosition += random(ySpeed);
}
//Bryan/////////////////////////////////////////////////////////////////////////////////////////////////
//Gabrielle///////////////////////////////////////////////////////////////////////////////////////////
Boolean isLetter (char c) {
  return ((key >= 'A' && key <= 'Z') || (key >= 'a' && key <= 'z'));
}
//////////////////////////////////////////////////////////////////////////////////////////////////////

//Ok. Ok. I know what you're thinking. GK's program used a database to find close rhymes! This just prints out rhymes from an array! True.
//This is my biggest disappointment. That I could not make GK's program work in its entirity along with everything else. I setteled for this, which uses all of GK's code except I've populated the array with rhymes of my own.

//GK//////////////////////////////////////////////////////////////////////////////////////////////////
void GKDraw()
{
  String[] rhymes = { 
    "cat! " + "sat! " + "mat! " + "pat! " + "animal fat! "
  };
  for (String s : rhymes)
  {
    println("Rhyming Helper says: Sounds like bat... There is a string named " + s);
  }
} 
//GK//////////////////////////////////////////////////////////////////////////////////////////////////

//Howard makes a spinner that spins. All I did was make it spin forever and orbit my sphere.
//However, when this program is called to return a value, Howards spinner increases in number expenentionally and I am not sure why. A strange turn of events that destroyed the program many times and taught me to save my work after every semi-colon

//Howard//////////////////////////////////////////////////////////////////////////////////////////////
float HowardDraw()
{
  image (arrow, 0, 0);
  y = y+random(180)/x; 

  translate(300, 200);
  rotate(y); 
  image(img, -img.width/2, -img.height/2);

  x = 2000; 
  return y;
//  if (x > 100) {
//  }
}
//Howard//////////////////////////////////////////////////////////////////////////////////////////

//Kwasi's program looks great and is neat to run. Clean and easy to integrate. Except when asked to return a value, the program crashes java since there can be no more than 8 lights at a time. I could not figure this out and moved on.

//Kwasi///////////////////////////////////////////////////////////////////////////////////////////
float KwasiDraw()
{
  directionalLight(102, 102, 102, 0, 0, -1);
  lightSpecular(204, 204, 204);
  directionalLight(102, 102, 102, 0, 1, -1);
  lightSpecular(102, 102, 102);
  translate(20, 50, 0);
  specular(51, 51, 51);
  translate(60, 0, 0);
  specular(102, 102, 102);
  translate(275, 275, 100);
  sphere(120);
  //println(answers[int (random(5))]);
  if (mousePressed)
  {
    //println(answers[int (random(5))]);
  }
  return (random(102, 202));
}
//Kwasi///////////////////////////////////////////////////////////////////////////////////////////

//FLOW. Interesting concept, but not the most interesting presentation. I've made it have an interesting presentation, but conceptually irrelevant 

//Loren///////////////////////////////////////////////////////////////////////////////////////////
void LorenDraw()
{
  //background(248);
  stroke(128);
  line(0, height/2, width, height/2);
  stroke(196);
  line(0, (height/2)-((range + 1) * 25), width, (height/2)-((range + 1) * 25));
  line(0, (height/2)+((range + 1) * 25), width, (height/2)+((range + 1) * 25));
  random_line();
  flow_line();
  center = 0;
}

void flow_line()
{
  float ypos = height/2;
  float ynext = ypos+(flow()*25);
  stroke(0, 128, 255);
  for (int i = 0; i < width/25; i++)
  {
    line((i*25), ypos, (i+1)*25, ynext);
    ypos = ynext;
    ynext += flow()*25;
  }
}

void random_line()
{
  float ypos = height/2;
  float ynext = ypos+(rand()*25);
  stroke(255, 0, 128);
  for (int i = 0; i < width/25; i++)
  {
    line((i*25), ypos, (i+1)*25, ynext);
    ypos = ynext;
    ynext += rand()*25;
  }
}

int rand()
{
  switch(int(random(3)))
  {
  case 0:
    return 0;
  case 1:
    return 1;
  case 2:
    return -1;
  default:
    return 0;
  }
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
  if (int(randomGaussian()) <=1)
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
    if (rand <= abs(center) && center > 0)
    {
      center--;
      return -1;
    } else if (rand <= abs(center) && center < 0)
    {
      center++;
      return 1;
    } else
    {
      if (int(random(2)) == 0)
      {
        center++;
        return 1;
      } else
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
//Loren///////////////////////////////////////////////////////////////////////////////////////////////////////

//Meghan's text editor had to be changed to output to a differnt location on the screen and I chnaged the location of the text rect that she created. Otherwise intact

//Meghan///////////////////////////////////////////////////////////////////////////////////////////////////////////
void textln(String text_to_print) {
  println(text_to_print);
  fill(0);
  textAlign(CENTER);
  text(text_to_print, width/2+20, height-30);
}
//I used Lee's simple sentence code from here down, editing it
//to fit my needs. Added another string for punctuation.

//Returns a random string from an array of strings.
String MegRandom_string (String[] string_array) {
  return string_array[int(random(string_array.length))];
}
//Returns a random article from an array of articles (Capitalized)
String ARTICLE () {
  String[] ARTICLES = { 
    "A", "The", "Your", "One"
  };
  return MegRandom_string(ARTICLES);
}
//Returns a string containing a random article (Uncapitalized)
String article () {
  String[] articles = { 
    "a", "the", "your", "one", "another"
  };
  return MegRandom_string(articles);
}

//Returns a string containing a random noun
String noun () {
  String[] nouns = { 
    "farm", "kingdom", "king", "queen", "knight", "lady", "lord", "horse", "squire", "dragon", "prince", "princess", "serf"
  };
  return MegRandom_string(nouns);
}

//Returns a string containing a random verb
String verb () {
  String[] verbs = { 
    "fought", "ran", "liked", "carried", "heard", "loved", "soothed", "hated", "flew", "ran", "hit"
  };
  return MegRandom_string(verbs);
}
//Returns a string containing a random sentence
String sentence () {
  return ARTICLE() + " " + noun() + " " + verb() + " " + article() + " " + noun() + ".";
}
void MeghanDraw() {  
  //Creates the background rectangles.
  //  stroke(204, 150, 0);
  //  strokeWeight(3);
  //  fill(255);
  //  rect(50, 20, 540, 300);

  fill(255);
  rect(width/2 -100, height-50, 250, 30); 

  if (drawSentence) {
    fill(200);
    textAlign(CENTER);
    text("Press Spacebar to generate another sentence", 320, 380);
    drawSentence = false;
  }
  fill(0);
  textln(sentence());
}

//Meghan/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//I tried everything with this one and sank a long time into getting something out of it. I still don't know what is going wrong. It outputs sentences, but they are Meghan's instead of the programs. Pressed for time, I had to move on. Untangling this mystery was too much 

//Shepardson/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
void SHtextln(String SHtext_to_print) {
  println(SHtext_to_print);
  fill(0);
  textAlign(LEFT);
  text(SHtext_to_print, 0, height-30);
}

String random_string (String[] string_array) {
  return string_array[int(random(string_array.length))];
}

String setting () {
  String settings [] = {
    "in another bar", "in a spooky cave", "discreetly, in a public place", "at a birthday party", "in dreams, in the privacy of unvoiced longing", "in a timeless expanse", "at the bottom of a hole"
  };
  return random_string(settings);
}

void cast(Character x) {
  x.update();
  x.introduce();
}

void askc(Character x, Character y, Character z) {
  int askc = int(random(3));
  switch (askc) {
  case 0: 
    x.ask();
    break;
  case 1: 
    y.ask();
    break;
  case 2: 
    z.ask();
    break;
  }
}

void scene() {
  int who = int(random(4));
  switch (who) {
  case 0: 
    scene = 1;
    cast(cowman);
    cast(gendarme);
    cast(tradesman);
    cowman.converse(gendarme);
    gendarme.converse(tradesman);
    askc(cowman, gendarme, tradesman); 
    break;
  case 1:
    scene = 2;
    cast(cowman);
    cast(gendarme);
    cast(indian);
    cowman.converse(indian);
    indian.converse(gendarme);
    askc(cowman, gendarme, indian);
    break;
  case 2:
    scene = 3;
    cast(cowman);
    cast(tradesman);
    cast(indian);
    cowman.converse(tradesman);
    tradesman.converse(indian);
    askc(cowman, tradesman, indian);
    break;
  case 3:
    scene = 4;
    cast(gendarme);
    cast(tradesman);
    cast(indian);
    gendarme.converse(tradesman);
    tradesman.converse(indian);
    askc(gendarme, tradesman, indian);
    break;
  }
}

void ShepDraw() {
  fill(255);
  rect(0, height-50, 250, 200);
  SHtextln(sentence());
  //  textln ("~~THREE MEN walked into a bar...~~");
  //  textln ("  ");
  //  scene();
  //  textln ("press ENTER to continue");
  //  textln (" ");
  //  textln (" ");
}

//void keyPressed () {
//  if ((key == ENTER) || (key == RETURN)) {
//    textln ("~~THREE MEN gathered " + setting() + "~~");
//    textln (" ");
//    scene();
//    textln ("press ENTER to continue");
//    textln (" ");
//    textln (" ");
//    print (a[1]);
//  }
//}
//Shepardson/////////////////////////////////////////////////////////////////////////////////////////////////////

//Got rid of the jpg and mask as it was slowing the program down catastrophically as well as strokeWeight, which cuased everything to run at a partly 10 frames a second. Made it into something of a web generator for Annleigh's spider 

//Valentina///////////////////////////////////////////////////////////////////////////////////////////////////////
float ValentinaDraw() {
  //background(0);
  //  PImage butterfly = loadImage("cat.jpg"); //loads image
  //  imageMode(CENTER); // Centers Image
  //  butterfly.resize(45, 150); // resize photograph
  //  image(butterfly, height/2, width/2); // Centers resized item
  //filter(THRESHOLD); //Threshold effect on photograph
  //filter(INVERT) //uncomment if image is on a light background 
  for (int i=0; i< countDot; i++) { //draw random circles
    dots[i].display();
  }
  drawlines = mouseY;

  stroke(255); //lines
  //strokeWeight(5);

  for (int i=0; i< countDot; i++) { //find other circles
    for (int x=i+1; x< countDot; x++) {
      if (dist(dots[i].x, dots[i].y, dots[x].x, dots[x].y) <drawlines) { // draw lines using dot coordinates 
        line(dots[i].x, dots[i].y, dots[x].x, dots[x].y);                // in relation to drawlines(mouseY)
        //      } else if (mousePressed) {
        //        saveFrame(); //save image on screen
      }
    }
  }
  return drawlines;
}
class Dot { // classify dot
  float x, y, d;

  Dot(float x, float y, float d) { //define dot values
    this.x =x;
    this.y =y;
    this.d = d;
  }
  void display() { // dot appearance 
    noStroke();
    fill(255);
    ellipse(x, y, d, d);
  }
}
//Valentina////////////////////////////////////////////////////////////////////////////////////////////////////

//Moved where the keys showed up on screen

//Zane//////////////////////////////////////////////////////////////////////////////////////////////////////////////
void ZaneDraw() {
  //just draws the array as a bar graph for easy visualization
  for (int i = 0; i < Intro.length; i ++) {
    fill(random(255));
    rect(i*15+(width*.30), height/2+90, 10, (Intro[i]*10));
  }
}

void GenerateIntro() {
  int Note = int(random(NatMinorScale.length));
  for (int i = 0; i < (Intro.length/4); i=i+2) { //Generates and writes both A parts
    Note = NewNote(Note );  //Generates new note based of current note
    Intro[i]=NatMinorScale[Note]; //writes note to Intro array
    Intro[i+(Intro.length/2)]=NatMinorScale[Note];
    if (int(randomGaussian())>0) Note = NewNote(Note );  //Decides if beat is going to be subdivided
    Intro[i+1]=NatMinorScale[Note];
    Intro[i+1+(Intro.length/2)]=NatMinorScale[Note];
  }

  for (int i = (Intro.length/4); i < (Intro.length/2); i=i+2) { //Writes B part
    Note = NewNote(Note );
    Intro[i] = NatMinorScale[Note];
    if (int(randomGaussian())>0) Note = NewNote(Note );
    Intro[i+1] = NatMinorScale[Note];
  }
  for (int i = (Intro.length/4*3); i < (Intro.length); i=i+2) { //Writes C parts
    Note = NewNote(Note );
    Intro[i] = NatMinorScale[Note];
    if (int(randomGaussian())>0) Note = NewNote(Note );
    Intro[i+1] = NatMinorScale[Note];
  }
}

int NewNote(int Note) {
  int rand = int(round(randomGaussian())); //generates random number on a normal distribution curve
  //keeps it from zeroing out too often
  if (rand == 0) { //if the number is zero, half the time keep it as zero
    if (random(1 ) > .5) {
      if (random(1) > .5) {
        rand = 0;
      }
    } else { //the other half it's either 1 or -1
      if (random(1 ) > .5) {
        rand = 1;
      } else {
        rand = -1;
      }
    }
  }
  //if the new note increments outside the range of the array, decrements it
  if (Note + rand >= NatMinorScale.length) {
    rand = rand * -1;
  }
  //constrain shouldn't be nessissary but it doens't hurt
  return constrain(Note + rand, 0, NatMinorScale.length);
}
//Zane//////////////////////////////////////////////////////////////////////////////////////////

//Outputs to println. Everything had to be renamed as there were already many other conflicting sentence generators running all at once

//Quinn//////////////////////////////////////////////////////////////////////////////////////////////
String Qrandom_string(String[] Qstring_array) {
  return Qstring_array[int(random(Qstring_array.length))];
}

// return a string containing a random article
// modified from Lee Spector's text_area_sentence program
String Qarticle() {
  return Qrandom_string(Qarticles);
}

// return a string containing a random noun
// modified from Lee Spector's text_area_sentence program
String Qnoun() {
  return Qrandom_string(Qnouns);
}

// return a string containing a random verb
// modified from Lee Spector's text_area_sentence program
String Qverb() {
  return Qrandom_string(Qverbs);
}

// return a string containing a random adjective
// modified from Lee Spector's text_area_sentence program
String Qadjectives() {
  return Qrandom_string(Qadjectives);
}

// return a string containing a random adverb
// modified from Lee Spector's text_area_sentence program
String Qadverb() {
  return Qrandom_string(Qadverbs);
}

// return a string containing a random pronoun
// modified from Lee Spector's text_area_sentence program
String Qpronoun() {
  return Qrandom_string(Qpronouns);
}

// return a string containing a random preposition
// modified from Lee Spector's text_area_sentence program
String Qpreposition() {
  return Qrandom_string(Qprepositions);
}

// return a string containing a random conjuction
// modified from Lee Spector's text_area_sentence program
String Qconjuction() {
  return Qrandom_string(Qconjuctions);
}

// return a string containing a random interjection
// modified from Lee Spector's text_area_sentence program
String Qinterjection() {
  return Qrandom_string(Qinterjections);
}

// return an string array containing a specified number of random sentences
// modified from Lee Spector's text_area_sentence program
void QgenerateSentences(int number) {
  String[] temp = new String[number];
  for (int i = 0; i<number; i++) {
    String s = Qarticle() + " " +Qnoun() + " " + Qverb() + " " + Qarticle() + " " + Qnoun();
    temp[i] = s;
  }
  Qsentences = temp;
}

//Creates a text file from the input name and given string array in the same folder as the program
void saveSentences(String fileName, String[] export) {
  saveStrings(fileName, export);
}


//int buttonListener(int[] buttonDimensions){
//  
//}

void QuinnDraw() {
  print("Quinn sentences say: ");
  printArray(Qsentences);
}
//Quinn////////////////////////////////////////////////////////////////////////////////////////////////////

//the turtle method. SuperTurtle is the class that contains all the variables

//TRTL////////////////////////////////////////////////////////////////////////////////////////////
void TurtleDraw()  
{ 
  pendown();
  
  // a square made of simple logo-style commands
  //forward(50);
  //right (90);
  //forward(50);
  //right (90);
  //forward(50);
  //right (90);
  //forward(50);
  
  // calls to higher-level procedures
  //tree(80);
  fern(500);
  //color_frond(100, 12);
 
}   
//TURTLES?//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
void mousePressed()
{
  //Matthew///////////////////////////////////////
  translate(width/2.5, (mousePosX*1.25)%height, 0);  //Press the mouse and you can see the guts of the program, namely everyone's tools, running all at the same time. It's kinda overwhelming at first
  box(boxSize, mousePosX, mousePosY);
  fill(value1, value2, mouseY%255);
  println(mouseY%255);
  background(random(255));
  value1 = random(255);
  ///////////////////////////////////////////////
  //Alexi///////////////////////////////////////
  if (go) {   
    go = false;
  } else {
    go = true;
  }
  ///////////////////////////////////////////////
}

void mouseDragged()
{

  value2 = mouseX%255;
  if (value2 > 255)
  {
    value2 = 0;
  }
}

void mouseClicked()
{
  ortho();
}

void keyPressed()  //Draws some random spheres that randomly fly around for the sake of randomness
{
  translate(posX, posY, posZ);
  rotateX(100 * 0.07);
  rotateY(100 * 0.07);
  fill(mouseX * 2, mouseY%255, 160);
  sphereDetail(45);
  sphere(20);
  translate(posX+random(100), posY+random(50), posZ+50);
  sphere(40);
  translate(posX+50, posY+50, posZ+50);
  sphere(40);
  translate(posX+50, posY+50, posZ+50);
  sphere(40);
  translate(posX+50, posY+50, posZ+50);
  sphere(40);
  translate(posX+50, posY+50, posZ+50);
  sphere(40);
  if ( posX > width || posX < 0)
  {
    dirX = -1 * dirX;
  }
  if (posY > height || posY <0)
  {
    dirY = -1 * dirY;
  }
  if (posZ > height || posZ < 0)
  {
    dirZ = -1 * dirZ;
  }
  posX = posX + random(dirX);
  posY = posY + random(dirY);
  posZ = posZ + random(dirZ);
  if (key == ' ')
  {
    redraw();
  } else {
  }
}

