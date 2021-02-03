PVector boxPos;
ArrayList<PVector> list;

void setup(){
  size(500,500,P3D);
  list = new ArrayList<PVector>();
  boxPos = new PVector(width/2,height/2,-20);
}

void drawLine(PVector p1,PVector p2,PVector p3){
  PVector v0 = PVector.sub(p2,p1);
  PVector v2 = new PVector(v0.y,-v0.x,v0.z);
  PVector v3 = new PVector(-v0.y,v0.x,v0.z);  
  PVector[] L1 = new PVector[2];
  PVector[] L2 = new PVector[2];
  L1[0] = new PVector(p1.x+v2.x,p1.y+v2.y,p1.z);
  L2[0] = new PVector(p1.x+v3.x,p1.y+v3.y,p1.z);
  L1[1] = new PVector(p2.x+v2.x,p2.y+v2.y,p2.z);
  L2[1] = new PVector(p2.x+v3.x,p2.y+v3.y,p2.z);
  
  line(p1.x,p1.y,p1.z,L1[0].x,L1[0].y,L1[0].z);
  line(p1.x,p1.y,p1.z,L2[0].x,L2[0].y,L2[0].z);
  //line(L1[0].x,L1[0].y,L1[0].z,p2.x,p2.y,p2.z);
  //line(L2[0].x,L2[0].y,L2[0].z,p2.x,p2.y,p2.z);
   
  //line(L1[0].x,L1[0].y,L1[0].z,L1[1].x,L1[1].y,L1[0].z);
  //line(L2[0].x,L2[0].y,L2[0].z,L2[1].x,L2[1].y,L2[1].z);
  //line(p3.x,p3.y,p3.z,L1[0].x,L1[0].y,L1[0].z);
  //line(p3.x,p3.y,p3.z,L2[0].x,L2[0].y,L2[0].z);
}

void draw(){
  background(255);
  camera(mouseX, mouseY, (height/2) / tan(PI/6), width/2, height/2, 0, 0, 1, 0);

  lights();
  for(int i=0;i<list.size()-1;i++){
    PVector p1=list.get(i);
    PVector p2=list.get(i+1); 
    if(i>0){
      PVector p3=list.get(i-1);
      drawLine(p1,p2,p3);
    }
    
    line(p1.x,p1.y,p1.z,p2.x,p2.y,p2.z);
  }

}
PVector last=null;
void mousePressed(){
  last = new PVector(mouseX, mouseY, (height/2) / tan(PI/6));
}
void mouseDragged(){
  PVector pt = new PVector(mouseX,mouseY,(mouseY/2) / tan(PI/6));
  while(dist(mouseX,(mouseY/2) / tan(PI/6),last.x,last.z)>=20){
    PVector v = PVector.sub(pt,last);
    v.normalize();
    v.mult(20);
    v.add(last);
    list.add(v);
    last=pt;
  }
}
