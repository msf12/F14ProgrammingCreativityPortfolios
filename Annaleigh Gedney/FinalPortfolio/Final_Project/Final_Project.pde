//Final Project
//Annaleigh Gedney
//December 9, 2014



int n = 2;                //initial rows and columns of squares
float speed = 2.5;        //initial speed of flow
float time;        
int a;
int b;
float sat;                 //setting float variables
float add;
float add2;
float add3;
float noiseScale = 0.2;
float r1 = random(1);        //adding more random sqaures
float r2 = random(1);        //adding more random squares
int Y_AXIS = 1;              //setting color constants
int X_AXIS = 2;


void setup() {
  size(500, 500);
  colorMode(HSB, 100);      //setting colorMode to HSB
  background(0);            //black background
}

void draw() {
  //noLoop();
  time = millis() * 0.01;                        //brings in color gradient
  for (a = 0; a < width; a = a + width/n) {      //the rate the gradient flows through the squares
    for (b = 0; b < height; b = b + height/n) {
      sat = 1000*noise((sin(a))*r1*a*noiseScale + (sin(b))*r2*b*noiseScale);
      setGradient(a, b, width/n, width/n, X_AXIS);
      //fill(#A01010);
    }
  }
}



void keyPressed() {
  if (keyCode == UP) {                //zooms out of the code to show more squares
    n = constrain(n + 1, 1, 10);
  }
  if (keyCode == DOWN) {              //constrains the code to only see smaller squares
    n = constrain(n - 1, 1, 10);
  }
  if (keyCode == LEFT) {              //brings the colorMode back to HSB
    colorMode(HSB, 100);
  }
  if (keyCode == RIGHT) {            //changes colorMode to RGB (red and black)
    colorMode(RGB, 255, 0, 0);
  }
  if (keyCode == ALT) {              //changes colorMode to RGB (green and peach colors)
    colorMode(RGB, 100, 200, 255);
  }
}


void setGradient(int x, int y, float w, float h, int axis ) {
  //setting where the difference gradient's are on the screen
  for (int i = x; i <= x+w; i++) {
    float inter = map(i, x, x+w, 0, 1);       //map creates a range of number
    add = (sat + speed*time);
    add2 = (sat + speed*time - 10);
    add3 = (lerp(add, add2, inter))%100;     //lerp allows the gradient to flow on the straight path
    color c = color(add3, 75, 75);           //determines how the colors change
    stroke(c);
    line(i, y, i, y+h);
  }
}







//Credit to Tim Curtis (tapesty flow) code

