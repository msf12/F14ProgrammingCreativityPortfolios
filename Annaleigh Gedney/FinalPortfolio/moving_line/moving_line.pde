//Annaleigh Gedney
//December 2014


int y = 250;    //where the line moves in the y direction
int x = 0;      //where the line moves in the x direction
int movingDown = 0;   
int movingUp = 0;
int Left = 0;
int Right = 0;

void setup() {
  size(500, 500);  
  stroke(0);   
  strokeWeight(1.5);  
  background(255);
  colorMode(HSB, 100, 100, 100);
}

void draw() { 

  //background(255);
  line(x, y, x+500, y);

  // fill(359, 89, 62);




  if (keyPressed && (key == CODED)) {
    if (keyCode == LEFT) {
      
    } else if (keyCode == RIGHT) {
      background(255);
    } else if (keyCode == UP) {
      background(255);
      movingDown = 0;
      movingUp = 1;    
      line(x, y, x+500, y);
    } else if (keyCode == DOWN) {
      background(255);
      movingDown = 1;
      movingUp = 0;
      line(x, y, x+500, y);
    }
  }


  if (Left == 1) {
    x--;
  }
  if (Right == 1) {
    x++;
  }
  if (movingDown == 1) {
    y++;
  }
  if (movingUp == 1) {
    y--;
  }
}




