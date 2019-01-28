ArrayList<Ball> balls;
ArrayList<Line> lines;

int x1;
int y1;

int ballWidth = 40;
int e;
int rectX=20, rectX2=60, rectY=20;      
int rectSize = 30; 
boolean rectOver = false, rectOver2=false; 
void setup() {
size(640, 360);
 balls = new ArrayList<Ball>();
 lines = new ArrayList<Line>();
}
void draw() {
 background(255);
 for(Ball ball:balls){
  ball.display(); 
  ball.mouseDragged();
  }
  for(Line line:lines){line.display();
   line.mouseDragged();}
 update(); 
   rect(rectX, rectY, rectSize, rectSize);
   rect(rectX2, rectY, rectSize, rectSize); 
}

void mousePressed() {
 if(rectOver){
  balls.add(new Ball(100, 100, ballWidth)); }
 if(rectOver2){
  lines.add(new Line(50, 100,200, 100));}
}
void mouseWheel(MouseEvent event) {
  e = event.getCount();
}
// button
void update() {
  if ( overRect(rectX, rectY, rectSize, rectSize) ) {
    rectOver = true;
 } else {
   rectOver = false;
  }
   if ( overRect(rectX2, rectY, rectSize, rectSize) ) {
    rectOver2 = true;
 } else {
   rectOver2 = false;
  }
}
boolean overRect(int x, int y, int width, int height)  {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}
class Ball {
  float x;
  float y;
  float w;
  int counter=0;
  int[] whiteArr={255,255,255};
  int[] redArr={255,0,0};
  int[] greenArr={0,255,0};
  int[] blueArr={0,0,255};
  int[] yellowArr={255,255,100};
  int[] colorArr=whiteArr;
  
Ball(float tempX, float tempY, float tempW ) {
    x = tempX;
    y = tempY;
    w = tempW;
      }
//void move() {  }
void mouseDragged() {  
    if(mouseButton == LEFT)  
   if (mouseX >= x-20 && mouseX <= x+20 && 
      mouseY >= y-20 && mouseY <= y+20) { 
    x = mouseX;  
    y = mouseY;
    }
}

 void display() {
  if (mouseX >= x-20 && mouseX <= x+20 && 
      mouseY >= y-20 && mouseY <= y+20) {
     if (e==1) counter+=e;
     if (e==-1) counter+=0;
     if (counter>500) counter=0;
     if (counter>=0 && counter<=100) colorArr=whiteArr;
     if (counter>100 && counter<=200) colorArr=redArr;
     if (counter>200 && counter<=300) colorArr=greenArr;
     if (counter>300 && counter<=400) colorArr=blueArr;
     if (counter>400 && counter<=500) colorArr=yellowArr;
     }
  fill(colorArr[0],colorArr[1],colorArr[2]);
  ellipse(x,y,w,w);
  }
}  

class Line {
  float x1;
  float y1;
  float x2;
  float y2;
  Line(float tempX1, float tempY1, float tempX2, float tempY2) { 
   x1 = tempX1;
   y1 = tempY1;
   x2 = tempX2;
   y2 = tempY2;
  }
   void mouseDragged() {  
    if(mouseButton == LEFT)  
   if (mouseX >= x2-5 && mouseX <= x2+5 && 
      mouseY >= y2-5 && mouseY <= y2+5) { 
    x2 = mouseX;  
    y2 = mouseY;
    }
      if(mouseButton == LEFT)  
   if (mouseX >= x1-10 && mouseX <= x1+10 && 
       mouseY >= y1-10 && mouseY <= y1+10) { 
       x1 = mouseX;  
       y1 = mouseY;
       }
 }
 void display() {
   line(x1,y1,x2,y2);
  } 
}
