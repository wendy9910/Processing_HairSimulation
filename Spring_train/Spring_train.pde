PVector origin;
Mover bob;
float restLength;

void setup(){
  size(800,400);
  restLength = 200;
  origin = new PVector(width/2,0);
  bob = new Mover(width/2,200);
  
}

void draw(){
  background(255);
  line(origin.x,origin.y,bob.location.x,bob.location.y);
  
  PVector spring = PVector.sub(bob.location,origin);
  float currentLength = spring.mag();
  spring.normalize();
  float k = 0.05;
  float stretch = currentLength - restLength;
  spring.mult(-k*stretch);
  
  bob.applyForce(spring);
  
  PVector wind = new PVector(0.1,0);
  if(mousePressed){
    bob.applyForce(wind);
  }
  
  PVector gravity = new PVector(0.1,0);
  bob.applyForce(gravity);
  
  bob.update();
  bob.display();
  
}

class Mover{
  
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass = 1;

  Mover(float x,float y){
    location = new PVector(x,y);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
    mass =1;
    
  }
  
  void applyForce(PVector force){
    PVector f = PVector.div(force,mass);
    acceleration.add(f);
  }
  
   void update() { 
    velocity.add(acceleration);
    
    location.add(velocity);
    acceleration.mult(0);
  }
  
  void display() { 
    stroke(0);
    strokeWeight(2);
    fill(175,120);
    ellipse(location.x,location.y,50,50);
  } 
}
