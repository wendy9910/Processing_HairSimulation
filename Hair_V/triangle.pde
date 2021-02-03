float a=20,b=40;
float x1=300,y1=300,x2=x1-20,y2=y1+40,x3=x1+20,y3=y1+40;
int shape;

void SH(){
  frameRate(10);
  if(mouseX>x3 && mousePressed){
    x2=x3;
    y2=y3;
    x3+=a;
    y3-=b;
    triangle(x1,y1,x2,y2,x3,y3);
  }
  if(mouseX>x3 && mousePressed){
    x1=x3;
    y1=y3;
    x3+=a;
    y3+=b;
    triangle(x1,y1,x2,y2,x3,y3);
  }
  if(mouseX<x3 && mousePressed){
    x3=x2;
    y3=y2;
    x2-=a;
    y2-=b;
    fill(#2E2C2C);
    triangle(x1,y1,x2,y2,x3,y3);
  } 
  if(mouseX<x3 && mousePressed){
    x1=x2;
    y1=y2;
    x2-=a;
    y2+=b;
    fill(#2E2C2C);
    triangle(x1,y1,x2,y2,x3,y3);
  }  
  if(mouseY>y1+b && mousePressed){
    x1=x3;
    y1=y3;
    x3-=a;
    y3+=b;
    fill(#2E2C2C);
    triangle(x1,y1,x2,y2,x3,y3);
  }
  if(mouseY<y1-b && mousePressed){
    x2=x3;
    y2=y3;
    x3-=a;
    y3-=b;
    fill(#2E2C2C);
    triangle(x1,y1,x2,y2,x3,y3);
  }

  
}

void triangle(){
  fill(#2E2C2C);
  triangle(x1, y1, x2, y2, x3, y3);
  SH();
}
