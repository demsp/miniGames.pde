int rectX=20, rectY=20;      
int rectSize = 30; 
boolean rectOver = false;
boolean mpress;
float newx, newy;

ArrayList<Ball> balls;
int ballWidth = 60;
void setup() {
  size(640, 360);
  balls = new ArrayList<Ball>();
}
void draw() {
background(255);
for(Ball ball:balls){
  ball.display(); 
  ball.mousePressed();
  ball.mouseReleased();
  ball.mouseDragged();
  }
  //update(mouseX, mouseY);
  update();
  rect(rectX, rectY, rectSize, rectSize);
}
void mousePressed() {
  mpress=true;
   if(rectOver){
  balls.add(new Ball(100, 40, ballWidth)); } 
}
void mouseReleased() {mpress=false; }
//void update(int x, int y) {
  void update() {
  if ( overRect(rectX, rectY, rectSize, rectSize) ) {
    rectOver = true;
 } else {
   rectOver = false;
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
  boolean locked;
  ArrayList<Line> lines;
Ball(float tempX, float tempY, float tempW) {
    x = tempX;
    y = tempY;
    w = tempW;
    lines=new ArrayList<Line>();
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
  if(mouseButton==RIGHT)
   lines.add(new Line(newx, newy, x,y));
  }  
  if(!mpress)locked= false;
   println(xOffset);
}
void mouseReleased() {if(mouseButton==LEFT) {newx=x;newy=y;}}
void mouseDragged() {  
   if(locked) 
   if(mouseButton == LEFT) { 
    x = mouseX-xOffset;  
    y = mouseY-yOffset;   
    }
}
void display() {
    if (overBall()) {
      counter--;
      if (counter==0) counter=255;
       }
      fill(counter);
      ellipse(x,y,w,w);
      
      for(Line line:lines){
      line.mouseDragged();  
      line.display();
      }
 println(locked);    
  }
}  

//##########
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
   if (mouseX >= x2-30 && mouseX <= x2+30 && 
      mouseY >= y2-30 && mouseY <= y2+30) { 
    x2 = mouseX;  
    y2 = mouseY;
    }
      if(mouseButton == LEFT)  
   if (mouseX >= x1-30 && mouseX <= x1+30 && 
       mouseY >= y1-30 && mouseY <= y1+30) { 
       x1 = mouseX;  
       y1 = mouseY;
       }
 }
 void display() {
    line(x1,y1,x2,y2); 
   }
}
