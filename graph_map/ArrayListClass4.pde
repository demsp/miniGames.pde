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
}

void mousePressed() {
   if(mouseButton == RIGHT){
  balls.add(new Ball(mouseX, mouseY, ballWidth)); } 
}

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
