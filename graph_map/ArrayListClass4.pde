int rectX=20, rectY=20;      
int rectSize = 30; 
boolean rectOver = false;

ArrayList<Ball> balls;
int ballWidth = 40;
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
  update(mouseX, mouseY);
  rect(rectX, rectY, rectSize, rectSize);
}

void mousePressed() {
  //if(mouseButton == RIGHT){ }
   if(rectOver){
  balls.add(new Ball(100, 40, ballWidth)); } 
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
Ball(float tempX, float tempY, float tempW) {
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
          counter--;
      if (counter==0) counter=255;
       }
      fill(counter);
      ellipse(x,y,w,w);
  }
}  
