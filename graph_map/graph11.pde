int rectX1=20, rectX2=60, rectY=20;      
int rectSize = 30; 
boolean rectOver1 = false;
boolean rectOver2 = false;
boolean mpress;

ArrayList<Ball> balls;
ArrayList<Line> lines;
int ballWidth = 60;

void setup() {
  size(500, 500);
  balls = new ArrayList<Ball>();
  lines=new ArrayList<Line>();
}
void draw() {
background(240);
for(Ball ball:balls){
  ball.display(); 
  ball.mousePressed();
  ball.mouseDragged();
  }
  update();
  rect(rectX1, rectY, rectSize, rectSize);
  rect(rectX2, rectY, rectSize, rectSize); 
}
void mousePressed() {
  mpress=true;
  if(rectOver1){
  balls.add(new Ball(50, 200, ballWidth)); } 
  if(rectOver2){
  lines.add(new Line(50, 100, 200,100)); }
}
void mouseReleased() {mpress=false; }
 void update() {
  if ( overRect(rectX1, rectY, rectSize, rectSize) ) {
    rectOver1 = true;
 } else {
   rectOver1 = false;
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

//############//
//            //  
//############//

class Ball {
  float x;
  float y;
  float w;
  float xOffset = 0.0; 
  float yOffset = 0.0; 
  int counter=255;
  float newx=100, newy=100;
  boolean locked;
 
Ball(float tempX, float tempY, float tempW) {
    x = tempX;
    y = tempY;
    w = tempW;
   
  }

boolean overBall(){
 if (mouseX >= x-30 && mouseX <= x+30 && 
   mouseY >= y-30 && mouseY <= y+30) {println("overBall"); return true;}
      else{return false;}
}

void mousePressed() { 
if(mpress)
  if (overBall()) { locked = true;
  xOffset = mouseX-x; 
  yOffset = mouseY-y;
  if(mouseButton==LEFT) {newx=x;newy=y;}  
  }  
  if(!mpress)locked= false;
   println("xOffset= ",xOffset);
}
//void mouseReleased() {if(mouseButton==LEFT) {newx=x;newy=y;}}
void mouseDragged() {  
   if(locked) 
   if(mouseButton == LEFT) { 
    x = mouseX-xOffset;  
    y = mouseY-yOffset;   
    }
}
void display() {
   // if (overBall()) {
   //   counter--;
   //   if (counter==0) counter=255;
   //    }
   //   fill(counter);
      ellipse(x,y,w,w);
      
      for(Line line:lines){
      line.mouseDragged();  
      line.display();
      }
 println("locled= ",locked);
 println("newx= ",newx);
 println("x= ",x);
 
  }
}  
//##########//
//          //  
//##########//
class Line {
   float x1;
   float y1;
   float x2;
   float y2;
Line(float tempX1, float tempY1,float tempX2, float tempY2){
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
