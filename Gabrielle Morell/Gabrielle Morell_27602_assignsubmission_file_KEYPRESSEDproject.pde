int rectWidth;
   
void setup() {
  size(640, 360);
  noStroke();
  background(0);
}

void draw() { 
  // keep draw() here to continue looping while waiting for keys
}

Boolean isLetter (char c) {
  return ((key >= 'A' && key <= 'Z') || (key >= 'a' && key <= 'z'));
}   

void mousePressed() {
  if(mousePressed) {
    stroke(255);
  } else { 
    keyPressed;
  }
  ellipse(mouseX,mouseY,mouseX,mouseY);
}
    
void keyPressed() {
  if (!(isLetter(key))) {
    // If it's not a letter key, clear the screen
    background(0);
  } else {
    if (key== 'a'){
    background(0,0,255);}
    else if (key== 'b'){
    background(22,106,217);}
    else if (key== 'c'){
    background(22,197,217);}
    else if (key=='d'){
    background(22,217,171);}
    else if (key== 'e'){
    background(22,217,96);}
    else if (key== 'f'){
    background(22,217,22);}
    else if (key=='g'){
    background(142,217,22);}
    else if (key== 'h'){
    background(217,217,22);}
    else if (key== 'i'){
    background(217,187,22);}
    else if (key=='j'){
    background(217,148,22);}
    else if (key== 'k'){
    background(217,119,22);}
    else if (key== 'l'){
    background(217,77,22);}
    else if (key=='m'){
    background(217,22,22);}
    else if (key== 'n'){
    background(217,22,80);}
    else if (key== 'o'){
    background(217,22,142);}
    else if (key=='p'){
    background(197,22,217);}
     else if (key== 'q'){
    background(145,22,217);}
    else if (key== 'r'){
    background(116,22,217);}
    else if (key=='s'){
    background(74,22,217);}
    else if (key== 't'){
    background(22,38,217);}
    else if (key== 'u'){
    background(22,83,217);}
    else if (key=='v'){
    background(22,126,217);}
     else if (key== 'w'){
    background(22,171,217);}
    else if (key== 'x'){
    background(22,207,217);}
    else if (key=='y'){
    background(22,217,184);}
    else if (key== 'z'){
    background(22,217,161);}
  }
}


