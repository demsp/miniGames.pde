ArrayList<Ball> balls;
ArrayList<Line> lines;

int x1;
int y1;

int ballWidth = 40;
int e;
int rectX=20, rectY=20;      
int rectSize = 30; 
boolean rectOver = false; //for "update","overRect"
void setup() {
size(640, 360);
 balls = new ArrayList<Ball>();
}
void draw() {
 background(255);
 for(Ball ball:balls){
  //ball.move();
  ball.display(); 
  ball.mouseDragged();
  }
 update(mouseX, mouseY); //button
   rect(rectX, rectY, rectSize, rectSize);
}

void mousePressed() {
 // if(mouseButton == RIGHT){ }
 //if(mouseButton == RIGHT){ }
 if(mouseButton == LEFT){ 
 x1=mouseX;
 y1=mouseY;
 }
  if(mouseButton == RIGHT){
  lines.add(new Line(x1, y1,mouseX, mouseY));}
  
 if(rectOver){
  balls.add(new Ball(100, 40, ballWidth)); } 
}
void mouseWheel(MouseEvent event) {
  e = event.getCount();
}
// button
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
 void display() {
   line(x1,y1,x2,y2);
  } 
  
}
