import processing.video.*;
import gab.opencv.*;
import java.awt.Rectangle;

OpenCV opencv;
Capture cam;
Rectangle[] faces;

PImage hat;

void setup() {
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

void captureEvent(Capture cam) {
  cam.read();
}

void fedora(float x, float y, float w, float h) {
  image(hat, x, y, w, h);
  //image(hat, mouseX, mouseY);
}

void draw() {
  background(0);
  opencv.loadImage(cam);
  faces = opencv.detect();
  image(cam, 0, 0);
  noFill();
  stroke(0, 255, 0);
  strokeWeight(3);
  for (int i = 0; i < faces.length; i++) {
    //rect(faces[i].x, faces[i].y, faces[i].width, faces[i].height);
    fedora(faces[i].x-10, faces[i].y-faces[i].height/1.3, faces[i].width+10, faces[i].height);
  }
}

