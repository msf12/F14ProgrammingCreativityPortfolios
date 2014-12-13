// Lee Spector, lspector@hampshire.edu
// 2006090

void setup()  
{ 
  size(400, 400);            // set the window size
  background(255);           // set the background color
  //noLoop();                  // execute the draw procedure only once
} 

void dot (float x, float y, float diameter, float r, float g, float b, float a) {
  fill(r, g, b, a);
  ellipse(x, y, diameter, diameter);
}

void randomDot () {
  dot(random(400), random(400), random(200), random(255), random(255), random(255), random(255));
}

void draw()  
{if(mousePressed){   //when mouse pressed the image pauses
  //noLoop();
} else{  
 noStroke();
  
 
 randomDot();
 randomDot();
 randomDot();
 randomDot();
 randomDot();
 randomDot();
 randomDot();
 randomDot();
 randomDot();
 randomDot();
 randomDot();
 randomDot();
 randomDot();
 randomDot();
 randomDot();
 randomDot();


}
}

