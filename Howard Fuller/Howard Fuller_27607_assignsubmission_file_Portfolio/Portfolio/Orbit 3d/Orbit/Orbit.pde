float xPos=200;
float yPos=200;
float spin;
float speed;
int Step=0;


void setup(){
 size(1000, 1000,P3D);
 smooth();
 speed =100;
 
}

void draw(){
 background(255);
 lights();
 //noStroke();
  
  xPos=500+300*(sin (Step/35.0));
  yPos=500+300*(cos (Step/35.0));
 
 translate(xPos,yPos,0);
  xPos=xPos+1;
  yPos=yPos-1;
  Step = Step+1;
fill(255, 0, 0);
spin = spin + 5/speed; 
   rotateX(spin);
   sphere(50);



 
}
