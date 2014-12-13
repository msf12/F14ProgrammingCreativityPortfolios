// turtle.pde
// Simple Logo-style turtle graphics in Processing, with fractal examples
// Lee Spector (lspector@hampshire.edu), 2006
// Derived code by Tom Fuerstner, but little of Tom's code remains.

// The code in this file is in split into three sections:
// 1. Variables and procedures that implement simple turtle graphics commands
//    (forward, back, right, left, penup, pendown, setxy, setpc).
// 2. Higher-level procedures to draw fractal ferns, etc. 
//    (Add your own higher-level procedures to this section.)
// 3. Top level procedures "setup" (which defines the window size, the initial
//    turtle placement, etc.) and "draw". Add your own calls to turtle graphics
//    commands and/or to your own higher-level procedures in this section. 

////////////////////////////////////////////////////////////////////////////////
// Variables and procedures that implement simple turtle graphics commands

float xcor; 
float ycor; 
float angle; 
boolean penStateUp; 

void forward(float distance) { 
  float initial_xcor, initial_ycor; 
  initial_xcor = xcor; 
  initial_ycor = ycor; 
  xcor += distance*cos(radians(angle)); 
  ycor += distance*sin(radians(angle)); 
  if (penStateUp == false) { 
    line (initial_xcor, initial_ycor, xcor, ycor); 
  } 
} 

void back(float distance) { 
  float initial_xcor, initial_ycor; 
  initial_xcor = xcor; 
  initial_ycor = ycor; 
  xcor -= distance*cos(radians(angle)); 
  ycor -= distance*sin(radians(angle)); 
  if (penStateUp == false) { 
    line (initial_xcor, initial_ycor, xcor, ycor); 
  } 
} 

void right(float degree) { 
  angle += degree; 
  if (angle >= 360) { 
    angle -= 360; 
  } 
} 

void left(float degree) { 
  angle -= degree; 
  if (angle <= 0) { 
    angle += 360; 
  } 
} 

void penup() { 
  penStateUp = true; 
} 

void pendown() { 
  penStateUp = false; 
} 

void setxy(float x, float y) { 
  xcor = x; 
  ycor = y; 
} 

void setpc(float r, float g, float b) {
  stroke(r, g, b);
}

////////////////////////////////////////////////////////////////////////////////
// Higher-level procedures to draw fractal ferns, etc. 

void tree(float distance) {
  if (distance < 5) {
  } 
  else {
    forward(distance);
    right(30);
    tree(distance * random(.75)+ random(HappyHalloween()-2*.25));
    //println(distance *.75 + " 1");
    left(60);
    tree(distance * random(0.75) + flow()*.33);
    //println(distance *.75 + " 2");
    right(30);
    back(distance);
  }
}
//Big things were dreamed in the fractal program. Nearly all failed.
//The fractal program actually came as an idea later into the project when everything seemed to be running alright in order to give a sense of creation to the project. However, methods that were repurposed to send out floats and ints that were originally void tended to break and thus only a few could actually be used in the final project. A partly two in fact. This is actually something I would like to return to and get running better

void fern(float size) {
  if (size < 5) {
  } else {
    forward(size/25);
    left(80);
    fern(size * random(0.3) + (random(-112)* -1 *.1));
    //println(size *.3 + " 1");
    right(82);
    forward(size/25);
    right(80);
    String yay = "yay yay yay";
    fern(size * random(0.3) + CountWords(yay) * .4);
    //println(size *.3 + " 2");
    left(78);
    fern(size * random(0.9) + flow()/2 * .03);
    //println(size *.9 + " 3");
    left(2);
    back(size/25);
    left(2);
    back(size/25);
  }
}

void color_frond(float sz, float level) {
  if (level< 1) {
  } else {
    setpc(random(255), random(255), random(255));
    forward(sz);
    right(75);
    color_frond(sz/1.5, level - 1);
    left(90); 
    color_frond(sz/1.5, level - 1);
    right(15);
    back(sz);
  }
}
////////////////////////////////////////////////////////////////////////////////
// Top level procedures

//void setup()  
//{ 
//  size(400, 400);            // set the window size
//  background(255);           // set the background color
//  setxy(width/2,height-50);  // move to near the bottom of the window
//  angle = -90.0;             // the turtle starts facing up
//  penStateUp = true;         // the pen is initially up
//  setpc(0,0,0);              // pen color is initially black
//  noLoop();                  // execute the draw procedure only once
//} 

//void draw()  
//{ 
//  pendown();
//  
//  // a square made of simple logo-style commands
//  //forward(50);
//  //right (90);
//  //forward(50);
//  //right (90);
//  //forward(50);
//  //right (90);
//  //forward(50);
//  
//  // calls to higher-level procedures
//  //tree(80);
//  fern(500);
//  //color_frond(100, 12);
// 
//}   
