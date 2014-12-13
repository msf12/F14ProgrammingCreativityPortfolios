import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import processing.video.*; 
import gab.opencv.*; 
import java.awt.Rectangle; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class live_fedorizer extends PApplet {





OpenCV opencv;
Capture cam;
Rectangle[] faces;

PImage hat;

public void setup() {
  hat = loadImage("fedora.png");
  size(640, 480, P2D);

  // Start capturing
  cam = new Capture(this, 640, 480);
  cam.start();

  // Create the OpenCV object
  opencv = new OpenCV(this, cam.width, cam.height);

  // Which "cascade" are we going to use?
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);  
}

public void captureEvent(Capture cam) {
  cam.read();
}

public void fedora(float x, float y, float w, float h) {
  image(hat, x, y, w, h);
  //image(hat, mouseX, mouseY);
}

public void draw() {
  background(0);
  opencv.loadImage(cam);
  faces = opencv.detect();
  image(cam, 0, 0);
  noFill();
  stroke(0, 255, 0);
  strokeWeight(3);
  for (int i = 0; i < faces.length; i++) {
    //rect(faces[i].x, faces[i].y, faces[i].width, faces[i].height);
    fedora(faces[i].x-10, faces[i].y-faces[i].height/1.3f, faces[i].width+10, faces[i].height);
  }
}

  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "live_fedorizer" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
