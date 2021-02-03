ArrayList<PVector> list= new ArrayList<PVector>();
int i=0;
void setup(){
  size(500,500);
}
void draw(){
  background(255);
  for(int i=0;i<list.size();i++){
    if(i>0){
      line(list.get(i-1).x,list.get(i-1).y,list.get(i).x,list.get(i).y);
    }
    PVector now = list.get(i);
    ellipse(now.x,now.y,10,10);
    println(now.x,now.y);
     
  }
}
void mousePressed(){
  PVector now = new PVector(mouseX,mouseY);
  list.add(now);
  
}

void mouseDragged(){
  PVector last = list.get(list.size()-1);
  if(dist(mouseX,mouseY,last.x,last.y)>30){
    //line(list.get(i).x,list.get(i).y,mouseX,mouseY);
    PVector now = new PVector(mouseX,mouseY);
    list.add(now);
    
   
  }
}
