int rectX=20, rectY=20;      
int rectSize = 30; 
boolean rectOver = false;
float globX,globY;

ArrayList<Ball> balls;
ArrayList<Line> lines;

int ballWidth = 40;
void setup() {
  size(640, 360);
  balls = new ArrayList<Ball>();
  lines = new ArrayList<Line>();
}

void draw() {
background(255);
for(Ball ball:balls){
  //ball.move();
  ball.display(); 
  ball.mouseDragged();
   // if(mouseButton == RIGHT){ lines.add(new Line(1234);}
  }
for(Line line:lines){
 line.display();
 line.mouseDragged();
 } 
  
  update(mouseX, mouseY);
  rect(rectX, rectY, rectSize, rectSize);
}

void mousePressed() {
 if(mouseButton == LEFT){ 
   if(rectOver){
  balls.add(new Ball(100, 40, ballWidth)); } }
 
  if(mouseButton == RIGHT){ 
    lines.add(new Line(30,30,globX,globY)); 
     }
   }
//############//
void update(int x, int y) {
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

class Ball {
  float x;
  float y;
  float w;
  int counter=255;
  PVector v1;
Ball(float tempX, float tempY, float tempW) {
    x = tempX;
    y = tempY;
    //globX=tempX;
    //globY=tempY;
    w = tempW;
    v1 = new PVector(tempX, tempY);
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
          counter--;
      if (counter==0) counter=255;
       }
      fill(counter);
      ellipse(x,y,w,w);
    //  line(30,30,x,y);
   globX=x;
   globY=y;
      
  }
}

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
   if (mouseX >= x2-20 && mouseX <= x2+20 && 
      mouseY >= y2-20 && mouseY <= y2+20) { 
    x2 = mouseX;  
    y2 = mouseY;
    }
  
}
  
    void display() {
   line(x1,y1,x2,y2); 
    }
}
