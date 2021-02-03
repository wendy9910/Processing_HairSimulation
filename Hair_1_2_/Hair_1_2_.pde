ArrayList<PVector> list;
void setup(){
  size(500,500);
  list = new ArrayList<PVector>();
  smooth();
}
void drawLine(PVector p1,PVector p2,PVector p3){
  PVector v0 = PVector.sub(p2,p1);
  PVector v2 = new PVector(v0.y,-v0.x);
  PVector v3 = new PVector(-v0.y,v0.x);  
  PVector[] L1 = new PVector[2];
  PVector[] L2 = new PVector[2];
  L1[0] = new PVector(p1.x+v2.x,p1.y+v2.y);
  L2[0] = new PVector(p1.x+v3.x,p1.y+v3.y);
  L1[1] = new PVector(p2.x+v2.x,p2.y+v2.y);
  L2[1] = new PVector(p2.x+v3.x,p2.y+v3.y);
  
  line(p1.x,p1.y,L1[0].x,L1[0].y);
  line(p1.x,p1.y,L2[0].x,L2[0].y);
  line(L1[0].x,L1[0].y,p2.x,p2.y);
  line(L2[0].x,L2[0].y,p2.x,p2.y);
  

    
  float len1=L1[0].dist(L1[1]);
  float len2=dist(L2[0].x,L2[0].y,L2[1].x,L2[1].y);
  println(len1,len2);
  
  line(L1[0].x,L1[0].y,L1[1].x,L1[1].y);
  line(L2[0].x,L2[0].y,L2[1].x,L2[1].y);
  line(p3.x,p3.y,L1[0].x,L1[0].y);
  line(p3.x,p3.y,L2[0].x,L2[0].y);
  
     
}

void draw(){
  background(255);
  for(int i=0;i<list.size()-1;i++){
    PVector p1=list.get(i);
    PVector p2=list.get(i+1);
    if(i>0){
      PVector p3=list.get(i-1);
      drawLine(p1,p2,p3);
    }
    line(p1.x,p1.y,p2.x,p2.y);
    

    
  }
  /*for(PVector pt : list){
    point(pt.x,pt.y);
  }*/
  
}
PVector last=null;
void mousePressed(){
  last = new PVector(mouseX,mouseY);
}
void mouseDragged(){
  PVector pt = new PVector(mouseX,mouseY);
  while(dist(mouseX,mouseY,last.x,last.y)>=20){
    PVector v = PVector.sub(pt,last);
    v.normalize();
    v.mult(20);
    v.add(last);
    list.add(v);
    last=pt;
  }
}
