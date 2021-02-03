float angle = -45;
float angle1 = 0;
void setup(){
  size(600,600);

}
void draw(){
  frameRate(10);
  background(51);
  float r = 100;
  float x = 300;
  float y = 300;
  
  stroke(255);
  strokeWeight(2);
  noFill();
  ellipse(x,y,r*2,r*2);
  
  float r2 = r * 0.5;
  
  float rsum = r;
  float x2 = x + rsum * cos(angle);
  float y2 = y + rsum * sin(angle);
  float x3 = x + rsum * cos(angle1);
  float y3 = y + rsum * sin(angle1);
  line(x,y,x2,y2);
  line(x,y,x3,y3);
  ellipse(x2,y2,r2*2,r2*2);
  if(angle<45){
    //angle -= 0.1;
    println(angle);
  }

}
