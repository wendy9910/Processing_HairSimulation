ArrayList<PVector> list= new ArrayList<PVector>();
int i=0;
float angle = 90;
//float angle = 90;
void setup(){
  size(500,500);
}
void draw(){
  background(255);
  
  for(int i=0;i<list.size();i++){
    if(i>0){
      float len = dist(list.get(i-1).x,list.get(i-1).y,list.get(i).x,list.get(i).y);
      
      float n=list.get(i-1).x-list.get(i).x;
      float a = atan2(list.get(i).y, list.get(i).x);//旋轉角度
      float rad = radians(a);
      println("角度:",a,"弧度",rad);
      
      float x3 = list.get(i-1).x + len * cos(angle);
      float y3 = list.get(i-1).y + len * sin(angle);
      line(list.get(i-1).x,list.get(i-1).y,list.get(i).x,list.get(i).y);
      triangle(list.get(i-1).x,list.get(i-1).y,list.get(i).x,list.get(i).y,x3,y3); 

    }
    

    
    PVector now = list.get(i);
    ellipse(now.x,now.y,10,10);
     
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
