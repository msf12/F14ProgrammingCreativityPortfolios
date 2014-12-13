int center = 0;    //This is required to use flow()!! Change at your own risk! (Don't risk it...)
int range  = 2;    //This is required to use flow()!! Change at will! (See what happens!)

void setup()
{
  size(800, 600);
  smooth();
  noLoop();
  strokeWeight(3);
}

void draw()
{
  background(248);
  stroke(128);
  line(0, height/2, width, height/2);
  stroke(196);
  line(0, (height/2)-((range + 1) * 25), width, (height/2)-((range + 1) * 25));
  line(0, (height/2)+((range + 1) * 25), width, (height/2)+((range + 1) * 25));
  random_line();
  flow_line();
  center = 0;
}

void flow_line()
{
  float ypos = height/2;
  float ynext = ypos+(flow()*25);
  stroke(0, 128, 255);
  for(int i = 0; i < width/25; i++)
  {
    line((i*25), ypos, (i+1)*25, ynext);
    ypos = ynext;
    ynext += flow()*25;
  }  
}

void random_line()
{
  float ypos = height/2;
  float ynext = ypos+(rand()*25);
  stroke(255, 0, 128);
  for(int i = 0; i < width/25; i++)
  {
    line((i*25), ypos, (i+1)*25, ynext);
    ypos = ynext;
    ynext += rand()*25;
  }  
}

int rand()
{
  switch(int(random(3)))
  {
    case 0:
      return 0;
    case 1:
      return 1;
    case 2:
      return -1;
    default:
      return 0;
  }
}

void keyPressed()
{
  if(key == ' ')
  {
    redraw();
  }
  else {}
}

/*
flow() either returns 1 (up), -1 (down), and on rare occasions, 0 (flat).
It is designed to return values such that each up will eventually have a
down to compliment it, and the more successfull ups generated, the more
likely it is to generate a down (and vice versa). As such, succesive values
of flow() create an oscillating pattern of ups and downs that flow together,
hence the name.*/

int flow()
{
  //This number detirmines if the next value will continue or change direction
  int rand = (int(abs(randomGaussian())) + range);
  //This code runs ~95% of the time due to Gaussian distribution
  if(int(randomGaussian()) <=1)
  {
    /*
    The rules of flow are simple:
    -If rand is larger than the current distance from the center,
    the value returned is random. This ensures that when close
    to zero, flow returns relatively random numbers (which evens
    out by the nature of probability).
    -If rand is smaller than the current distance from the center, 
    the value returned is in the opposite direction. This ensures that
    the values returned keep the flow within a certain range. 
    */
    if(rand <= abs(center) && center > 0)
    {
      center--;
      return -1;
    }
    else if(rand <= abs(center) && center < 0)
    {
      center++;
      return 1;
    }
    else
    {
      if(int(random(2)) == 0)
      {
        center++;
        return 1;
      }
      else
      {
        center --;
        return -1;
      }
    }
  }
  //This code runs ~5% of the time due to Gaussian distribution
  else
  {
    return 0;
  }
}


