int numBalls = 7;
float spring = 0.3;
float gravity = 0.5;
float friction = -0.98;
Ball[] balls = new Ball[numBalls];

void setup() {
  size(640, 360);
  if (frame != null)
  {
    frame.setResizable(true);
  }
  for (int i = 0; i < numBalls; i++)
  {
    balls[i] = new Ball(random(width), random(height), 50, i, balls, false);
  }
  noStroke();
  fill(255, 204);
}

void mousePressed()
{
  for(int i = 0; i < numBalls; i++)
  {
    if(mouseX >= balls[i].x-balls[i].diameter/2 && mouseX <= balls[i].x+balls[i].diameter/2 && mouseY >= balls[i].y-balls[i].diameter/2 && mouseY <= balls[i].y+balls[i].diameter/2)
    {
      balls[i].selected = true;
      balls[i] = new Ball(mouseX, mouseY, 50, i, balls, true);
    }
  }
}

/*void create()
{
  numBalls++;
  balls = expand(balls, numBalls);
}*/

void draw() {
  background(0);
  for (int i = 0; i < numBalls; i++)
  {
    if (balls[i].selected == true)
    {
    balls[i].collide();
    balls[i].mouse_move();
    balls[i].display(); 
    }
   else
   {
    balls[i].collide();
    balls[i].move();
    balls[i].display(); 
   }
  }
}

class Ball {
  
  float x, y;
  float diameter;
  float vx = 0;
  float vy = 0;
  int id;
  Ball[] others;
  boolean selected = false;
 
  Ball(float xin, float yin, float din, int idin, Ball[] oin, boolean selected) {
    x = xin;
    y = yin;
    diameter = din;
    id = idin;
    others = oin;
    selected = selected;
  } 
  
  void collide() {
    for (int i = id + 1; i < numBalls; i++) {
      float dx = others[i].x - x;
      float dy = others[i].y - y;
      float distance = sqrt(dx*dx + dy*dy);
      float minDist = others[i].diameter/2 + diameter/2;
      if (distance < minDist) {
        float angle = atan2(dy, dx);
        float targetX = x + cos(angle) * minDist;
        float targetY = y + sin(angle) * minDist;
        float ax = (targetX - others[i].x) * (spring/2);
        float ay = (targetY - others[i].y) * (spring/2);
        vx -= ax;
        vy -= ay;
        others[i].vx += ax;
        others[i].vy += ay;
      }
    }   
  }
  
  void mouse_move()
  {
    x = mouseX;
    y = mouseY;
    if (x + diameter/2 > width) {
      x = width - diameter/2;
    }
    else if (x - diameter/2 < 0) {
      x = diameter/2;
    }
    if (y + diameter/2 > height) {
      y = height - diameter/2;
      vy *= (5 * friction / 6); 
    } 
    else if (y - diameter/2 < 0) {
      y = diameter/2;
    }
  }
  
  void move() {
    vy += gravity;
    x += vx;
    y += vy;
    if (x + diameter/2 > width) {
      x = width - diameter/2;
      vx *= friction; 
    }
    else if (x - diameter/2 < 0) {
      x = diameter/2;
      vx *= friction;
    }
    if (y + diameter/2 > height) {
      y = height - diameter/2;
      vy *= (5 * friction / 6); 
      vx *= -friction;
    } 
    else if (y - diameter/2 < 0) {
      y = diameter/2;
      vy *= friction;
    }
  }
  
  void display() {
    ellipse(x, y, diameter, diameter);
  }
}
