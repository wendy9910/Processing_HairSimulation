PVector [] p=new PVector[3];
PVector position;//位置
PVector velocity;//速度
PVector acceleration;//加速度
float damping = 0.95;//阻力
float gravity = 9.8;
  
void setup(){
  size(500,500);
  position = new PVector(200,150);
  velocity = new PVector();
  acceleration = new PVector();

  p[0] = new PVector(position.x,position.y);
  p[1] = new PVector(position.x+100,position.y);
 
}
void draw(){
  background(255);
  line(p[0].x,p[0].y,p[1].x,p[1].y);
  for(int i=0;i<2;i++){
    if(i==0) fill(255,0,0);
    else if(i==1) fill(0,255,0);
    ellipse(p[i].x,p[i].y,10,10);
  }
  
  updateSpring();
}

void updateSpring(){
  acceleration.y+=gravity;
  velocity.add(acceleration);
  p[1].add(velocity);
  
  float len = PVector.dist(p[0], p[1]);
  PVector v1 = PVector.sub(p[0], p[1]);
  print(v1);
  
  v1.normalize();
  
  
  v1.mult((len-50)/100);
  p[1].add(v1);
  //p[0].sub(v1);
  //print(len,"\n");
  
  velocity.mult(0);
  acceleration.mult(0);
}

void mousePressed(){
  p[0].x=mouseX;
  p[0].y=mouseY;
}
