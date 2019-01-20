ArrayList<Ball> balls;
ArrayList<Float> ballxs; 
int ballWidth = 40;
boolean overBox=false;

int fillColor=0;

void setup() {
  size(640, 360);
  balls = new ArrayList<Ball>();
  ballxs = new ArrayList<Float>();
}
void draw() {
background(255);
for(Ball ball:balls){
  ball.move();
    ball.display();     
  ballxs.add(new Float(ball.x));
  }
 for(Float ballx:ballxs){ 
 if(mouseX>=ballx-20 && mouseX<=ballx+20) overBox=true;
  if(mouseX<ballx-20)overBox=false;
 }
println(overBox);
}

void mousePressed() {
  balls.add(new Ball(mouseX, mouseY, ballWidth));
}

class Ball {
  float x;
  float y;
  float w;
  int counter;
Ball(float tempX, float tempY, float tempW) {
    x = tempX;
    y = tempY;
    w = tempW;
  }
    void move() {
   // x = mouseX;
    y = mouseY;
    }
   void display() {
      if(overBox){
        counter++;
      if (counter==255) counter=0;
       }
      fill(counter);
      ellipse(x,y,w,w);
  }
}  
