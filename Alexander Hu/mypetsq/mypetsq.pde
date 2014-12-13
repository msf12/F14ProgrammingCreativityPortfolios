//Pet Square
//Alexi Hu
//Programming Creativity
//CS-0109
//Fall 2014

//Pet Square (Rect)
float rectx = 200; 
float recty = 200;
float rectwidth = 50;
float rectheight = 50;
float rectradius = 0;
int r = 0;
int b = 0;
int g = 0;
float a = 255;

//Food (Ellipse)
float cirx = 1000; //So food doesn't appear on screen when first drawn
float ciry = 1000; // So food doesn't appear on screen when first drawn
float cirw = 15;
float cirh = 15;

//Booleans
boolean MakeFood = true; //iterates food.
boolean Too_Much_Timer = false; //Stores time for too much food action when true. 
boolean IdleTimer = false; //Stores time for idle function when true.

//Misc.
int directionx = 1; // bounce feature's horizontal movement.
int directiony = -1; //bounce features vertical movement. 
int IdleStart = 0; // starting value for idleness. 
int exp = 0; //starting value for exp.
int too_much_food = 0; // starting value for too_much_food. Too much food results in pet having too much energy and bouncing around.

//Time components
int cir_time = 10000;
int i_time = 6000;
int time = 1000;
int CurrentTime = millis();

//canvas size
int canvas = 500;

//setting parameters for pet square
void pet_square(float xcor, float ycor, float recwidth, float recheight, float rectradius, int r, int g, int b, float a) {
  noStroke();
  fill(r, b, g, a);
  rect(rectx, recty, rectwidth, rectheight, rectradius);
}

//setting parameters for food
void food (float cirx, float ciry, float cirw, float cirh) {
  noStroke();
  fill(0);
  ellipse (cirx, ciry, cirw, cirh);
}

void setup() {
  size(canvas, canvas);
  IdleTimer = false; //idletimer is "off".
}

void keyReleased() {
  exp += 1; //increase exp by 1 when key is released.
  IdleTimer = true; //idle timer starts when key is released.
  IdleStart = CurrentTime; //idle start time is set to current time 
}


void draw() {
  
  CurrentTime = millis();
  
  //If current time is larger then time int alpha decreases by .25, lowering opacity of pet sqaure. 
  //If alpha is less than 100 than rounded rectangle edges disappear and too_much_food meter resets to 0.
  if (CurrentTime > time) { 
    a -= .25;
    if (a < 100) {
      rectradius = 0;
      too_much_food = 0;
      
  }
  }
  
  //if idletimer is on and current time minus the idle time is more than the predetermined "i_time", then:
  //color is randomly changing, and pet is bouncing off all four sides of the canvas making a mess, leaving a trail of color. 
  //boredom.
  if (IdleTimer == true && CurrentTime - IdleStart > i_time) {
    r = int(random(255));
    b = int(random(255));
    g = int(random(255));
    rectx = rectx - 20 * directionx;
    recty = recty - 20 * directiony;
    if (rectx + rectwidth >= canvas || rectx <= 0) {
      directionx *= -1;
    }
    if (recty + rectheight >= canvas || recty <= 0) {
      directiony *= -1;
    }
    pet_square(rectx, recty, rectwidth, rectheight, rectradius, r, b, g, a);
  } 
  else {
    background(255);
    pet_square(rectx, recty, rectwidth, rectheight, rectradius, r, b, g, a);
  }


  //if key is pressed, idletimer turns off because idleness is gone. 
  //rbg are reset to 0.
  //if arrow keys are pressed, pet moves in corresponding direction at .25 speed. 
  //the pet is naturally slow, but moves more efficiently after a certain amount of key presses. 
  if (keyPressed) {
    IdleTimer = false;
    r = 0;
    g = 0;
    b = 0;
    if (keyCode == UP) {
      recty = recty - .25;
    }
    if (keyCode == DOWN) {
      recty = recty + .25;
    }
    if (keyCode == LEFT) {
      rectx = rectx - .25;
    }
    if (keyCode == RIGHT) {
      rectx = rectx + .25;
    }
  }

  //after a certain amount of exp is accumulated, the pet is able to mvove more efficiently. 
  if (exp > 15) { //if experience > 15 --> directional movement +2
    if (keyPressed) {
      if (keyCode == UP) {
        recty = recty - 2;
      }
      if (keyCode == DOWN) {
        recty = recty + 2;
      }
      if (keyCode == LEFT) {
        rectx = rectx - 2;
      }
      if (keyCode == RIGHT) {
        rectx = rectx + 2;
      }
    }
  }

  if (mousePressed) { // if mouse pressed, makeFood becomes true
    if (MakeFood == true) { // lock that prevents food from looping over and over
      MakeFood = false; // if makeFood becomes true, set it to false and give food cirx, ciry coordinates.
      IdleTimer = false; 

      cirx = random(5, 495); // food will appear within x values 5 and 495.
      ciry = random(5, 495); // food will appear within y values 5 and 495.
      r = 0;
      b = 0;
      g = 0;
    }
   } 
   else {
    MakeFood = true;  //when mouse not pressed, makeFood is true.
  }

  food(cirx, ciry, 15, 15);

  //if distance between the pet and the food is a certain length, then opacity is restored, pet gets fuller and healthier. 
  float distance = dist(rectx + rectwidth/2, recty + rectheight/2, cirx, ciry);
  if (distance < cirw + rectwidth/2 - 8) {
    a = 255 +10;
    cirx = 1000;
    ciry = 1000;
    food (cirx, ciry, cirw, cirh);
    too_much_food += 1;
  }
  //if the pet eats too much food then it gradually gets rounder, much like the food. 
  //if more than 6 bits of food are eaten within a certain amount of time, then the pet goes crazy
  //too much energy. 
  if (too_much_food > 1) {
    rectradius = too_much_food + 2;
  }
  
  if (too_much_food > 2) {
    rectradius = too_much_food +4;
  }
  
  if (too_much_food > 3) {
    rectradius = too_much_food +16;
  }
  if (too_much_food > 4) {
    rectradius = too_much_food +32;
  }
  if (too_much_food > 5) {
    rectradius = too_much_food +74;
    r = int(random(255));
    b = int(random(255));
    g = int(random(255));
  
    //if too much food is making pet go crazy (randomly changing color, bouncing off edges of canvas)... 
    if (!Too_Much_Timer) {
      cir_time = cir_time + CurrentTime;
      Too_Much_Timer = true;
    }
    
    if (CurrentTime > cir_time) {
      rectradius = 0;
      too_much_food = 0; 
      Too_Much_Timer = false; 
      r = 0;
      b = 0; 
      g = 0;
    }
  }
  //if too much food was eaten, pet has too much energy, randomly changes color and bounces off the edge of the canvas. 
  if (Too_Much_Timer) {
    rectx = rectx - 20 * directionx;
    recty = recty - 20 * directiony;
    if (rectx + rectwidth >= canvas || rectx <= 0) {
      directionx *= -1;
    }
    if (recty + rectheight >= canvas || recty <= 0) {
      directiony *= -1;
    }
  }
  //If alpha reaches 0 (opacity at 0%), program ends. Pet dies. 
  if (a == 0) {
    exit();
  }
}
