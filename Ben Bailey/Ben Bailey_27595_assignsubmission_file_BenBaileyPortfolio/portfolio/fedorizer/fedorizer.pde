import gab.opencv.*;
import java.awt.Rectangle;

OpenCV opencv;
Rectangle[] faces;

PImage hat;

void setup() {
  //selectInput("Select a file to process:", "fileSelected");
  hat = loadImage("fedora.png");
  opencv = new OpenCV(this, "nmh.jpg");
  size(opencv.width, opencv.height);

  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);  
  faces = opencv.detect();
}

void fedora(float x, float y, float w, float h) {
  image(hat, x, y, w, h);
  //image(hat, mouseX, mouseY);
}

void draw() {
  image(opencv.getInput(), 0, 0);
  noFill();
  stroke(0, 255, 0);
  strokeWeight(3);
  for (int i = 0; i < faces.length; i++) {
    //rect(faces[i].x, faces[i].y, faces[i].width, faces[i].height);
    fedora(faces[i].x-10, faces[i].y-faces[i].height/1.3, faces[i].width+10, faces[i].height);
  }
}

