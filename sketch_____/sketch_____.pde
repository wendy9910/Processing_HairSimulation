PVector p1,p2,n;
float d = 0;

void setup()
{
  size(600,600);
  
  p1 = new PVector(150,30);//線段第一個端點
  p2 = new PVector(-25,-100);//線段第二個端點
  
  PVector vec = PVector.sub(p1,p2);
  vec.normalize();
  n = new PVector(-vec.y,vec.x);//與線段垂直的向量
  d = n.dot(p1);
}
 
 void draw()
{
   background(#CCCCCC);
   translate(300,300);//重置坐標原點
   strokeWeight(1);
   stroke(#000000);
   line(-300,0, 300,0);//畫橫縱軸
   line(0,-300, 0,300);
   
   drawLine(p1,p2);
   drawVector(n);
   
   PVector q = new PVector(mouseX-300,mouseY-300);
   strokeWeight(8);
   stroke(#EEEE00);//yellow
   point(q.x,q.y);
   
   float temp = d - q.dot(n);
   PVector nearestPnt = new PVector(n.x,n.y);
   nearestPnt.mult(temp);
   nearestPnt.add(q);
   
   PVector delV1,delV2;//線段上的 最近點 到兩端點的向量
   delV1 = PVector.sub(nearestPnt,p1);
   delV2 = PVector.sub(nearestPnt,p2);
   if(PVector.dot(delV1,delV2)>0)//如果兩個向量的點積大於0，則最近點在線段外
   {
     nearestPnt = module(delV1)<module(delV2)?p1:p2;//則重置最近點到最近的端點
   }
   
   drawLine(q,nearestPnt);
 }

 //求向量的模
 float module(PVector v)
 {
   return sqrt(pow(v.x,2)+pow(v.y,2));
 }

 //畫一條綠色的線段，端點加粗
 void drawLine(PVector p1,PVector p2)
 {
   strokeWeight(1);
   stroke(0,155,0);
   line(p1.x,p1.y, p2.x,p2.y);
   strokeWeight(5);
   point(p1.x,p1.y);
   point(p2.x,p2.y);
 }
 
 //畫一個紅色向量，原點開始
 void drawVector(PVector v)
 {
   int k = 50;
   strokeWeight(1);
   stroke(255,0,0);
   line(0,0, v.x*k,v.y*k);
   strokeWeight(5);
   point(0,0);
 }
