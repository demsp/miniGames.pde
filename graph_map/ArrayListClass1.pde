ArrayList<Ball> balls;
ArrayList<Float> ballxs; 
int ballWidth = 48;

void setup() {
  size(640, 360);
  balls = new ArrayList<Ball>();
  ballxs = new ArrayList<Float>();
 // balls.add(new Ball(0, 0, ballWidth));
}
void draw() {
  background(255);
  for (int i = balls.size()-1; i >= 0; i--) { 
    Ball ball = balls.get(i);
    ball.move();
    ball.display();
    if (ball.finished()) {
       balls.remove(i);
    }  }  
  for(Ball ball:balls){//println(ball.x);
  ballxs.add(new Float(ball.x));
  }
  for(Float ballx:ballxs){println(ballx); }
  println();
  println();
}

void mousePressed() {
  balls.add(new Ball(mouseX, mouseY, ballWidth));
}

class Ball {
  float x;
  float y;
  float w;
  float life = 255;
  
  Ball(float tempX, float tempY, float tempW) {
    x = tempX;
    y = tempY;
    w = tempW;
  }
    void move() {
   // x = mouseX;
    y = mouseY;
    }
  
  boolean finished() {
    // Balls fade out
    life--;
    if (life < 0) {
      return true;
    } else {
      return false;
    }
  }
  
  void display() {
      fill(0,life);
      ellipse(x,y,w,w);
  }
}  
