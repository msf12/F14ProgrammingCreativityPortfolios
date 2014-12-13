class Ball
{
  float x, y, vx, vy, size, mass;
  int id;
  Ball [] others
  
  Ball(float xpos, float ypos, float x_speed, float y_speed, float diameter, float mass, int identity, Ball [] other_identity)
  {
    x = xpos;
    y = ypos;
    size = diameter;
    mass = mass;
    id = identity;
    others = other_identity;
  }
  
  void display()
  {
    ellipse(x, y, size, size);
  }
  
  void move()
  {
    vy += gravity;
    x += vx;
    y += vy;
    if (x > (width - size))
    {
      x = (width - size);
    }
    else if (x < size)
    {
      x = size;
    }
    if (y > (height - size))
    {
      y = height - size;
    } 
    else if (y < size)
    {
      y = size;
    }
  }
  
  void collide()
  {
    float dx = other[i].x - x;
    float dy = other[i].y - y;
    float distance = sqrt(sq(dx)+sq(dy));
    float collide_distance = other[i].size + size;
    if (distance < collide_distance)
    {
      float momenta_per_mass = ((sqrt(sq(vx)+sq(vy))*mass+(sqrt(sq(other.vx)+sq(other.vy))*other.mass)))/(mass+other[i].mass);
      float theta = atan2(dy, dx);
      
