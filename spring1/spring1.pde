PVector [] p=new PVector[3];
void setup(){
  size(500,500);
  p[0] = new PVector(100,250);
  p[1] = new PVector(400,250);
 
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
  float len = PVector.dist(p[0], p[1]);
  PVector v1 = PVector.sub(p[0], p[1]);
  v1.normalize();
  v1.mult((len-150)/100);
  p[1].add(v1);
  p[0].sub(v1);
  
}

void mousePressed(){
  p[0].x=mouseX;
  p[0].y=mouseY;
}
