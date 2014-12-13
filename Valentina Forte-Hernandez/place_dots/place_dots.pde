///Valentina Forte-Hernandez
///Programming Creativity
///9.12.14
//code used from https://www.processing.org/reference/libraries/video/Capture.html
import java.util.LinkedList;
import processing.video.*;
Capture cam;
Dot[] dots;
int countDot = 0; ///initial number of dots
int drawlines;
LinkedList<Dot> dotList = new LinkedList<Dot>(); ///creates linked list array for dot placement
void setup() {
  size(640, 480); // canvas size
  String[] cameras = Capture.list();
    if (cameras.length == 0) {
    println("There are no cameras available for capture."); /// checks for internal camera
    exit();
  } else {
    println("Available cameras:");
    for (int i = 0; i < cameras.length; i++) {
      println(cameras[i]);
    }
    
    // The camera can be initialized directly using an 
    // element from the array returned by list():
    cam = new Capture(this, cameras[0]); ///begins camera stream if availalble
    cam.start();     
  }      
  dots = new Dot[countDot]; //add dots to canvas
  }
void draw() {
  background(0);
    if (cam.available() == true) { ///if camera available
    cam.read();                    ///display camera feed
  }
  image(cam, 0, 0);
  drawlines = mouseY; //draws lines connecting dots
  for (int i=0; i< countDot; i++) { 
    dotList.get(i).display(); ///places dot
  }
  stroke(255); //lines00
  strokeWeight(5);

  for (int i=0; i< countDot; i++) { //find other circles
    for (int x=i+1; x< countDot; x++) {
      if (dist(dotList.get(i).x, dotList.get(i).y, dotList.get(x).x, dotList.get(x).y) <drawlines) { // draw lines using dot coordinates 
        line(dotList.get(i).x, dotList.get(i).y, dotList.get(x).x, dotList.get(x).y);                // in relation to drawlines(mouseY)
      }
    }
  }
}
void mouseClicked() { ///places dots when clicked
  dotList.add(new Dot((float)mouseX, (float)mouseY, 5.0));
  countDot++;
}
class Dot { // classify dot
  float x, y, d;

  Dot(float x, float y, float d) { //define dot constructers
    this.x =x;
    this.y =y;
    this.d = d;
  }
  void display() { // dot appearance 
    noStroke();
    fill(255);
    ellipse(x, y, 5, 5);
  }
}

