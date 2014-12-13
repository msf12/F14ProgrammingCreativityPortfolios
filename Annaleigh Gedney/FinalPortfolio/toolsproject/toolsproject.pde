//Annaleigh Gedney
//October 2014
//Tools Project

int[] fillVal = {255, 255, 255};

  
void setup() {
  size(1100, 500);
  stroke(0);
  strokeWeight(1.5);
  background(#8D41A5);
  smooth();
  frameRate(3);
  //loop();
}

void draw() {
 
  
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
  if(fillVal[0] == 255){
    fill(#A5430A);
  }
  else {
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
  line(800, 0, 800, 100);          //thread
  ellipse(800, 125, 50, 50);        //body
  
  //right legs
  line(819, 105, 840, 80);
  line(840, 80, 850, 90);
  line(823, 113, 850, 100);
  line(850, 100, 860, 110);
  line(825, 125, 860, 120);
  line(860, 120, 870, 130);
  line(821, 138, 858, 137);
  line(858, 137, 870, 150);
  
  //left legs
  line(782, 105, 755, 87);
  line(755, 87, 745, 95);
  line(776, 120, 746, 103);
  line(746, 103, 735, 112);
  line(775, 129, 743, 120);
  line(742, 120, 732, 132);
  line(780, 139, 747, 135);
  line(747, 135, 737, 145);

 
}

void mousePressed() {
  //stroke(0);
  fillVal[0] = int(random(255));
  fillVal[1] = int(random(255));
  fillVal[2] = int(random(255));
}
