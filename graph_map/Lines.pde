ArrayList<Ball> balls;
int ballWidth = 100;

int x1;
int y1;

void setup() {
  size(640, 360);
  //noStroke();

  // Create an empty ArrayList (will store Ball objects)
  balls = new ArrayList<Ball>();
  
  // Start by adding one element
  balls.add(new Ball(width/4, width/4, width/2, width/2));
}

void draw() {
  background(255);

  for (int i = balls.size()-1; i >= 0; i--) { 
    // An ArrayList doesn't know what it is storing so we have to cast the object coming out
    Ball ball = balls.get(i);
    ball.move();
    ball.display();
    if (ball.finished()) {
      // Items can be deleted with remove()
      balls.remove(i);
    }
    
  }  
  
}

void mousePressed() {
  if(mouseButton == LEFT){
  x1=mouseX;
  y1=mouseY;
  }
  if(mouseButton == RIGHT){
  balls.add(new Ball(x1, y1,mouseX, mouseY));
 }
}


class Ball {
  
  float x1;
  float y1;
  float x2;
  float y2;
  float speed1;
  float speed2;
  float gravity;
  float w;
  float life = 550;
  
  Ball(float tempX1, float tempY1, float tempX2, float tempY2) {
    x1 = tempX1;
    y1 = tempY1;
    x2 = tempX2;
    y2 = tempY2;
    speed1 = 0;
    speed2 = 0;
    gravity = 0.1;
  }
  
    void move() {
    // Add gravity to speed
    speed1 = speed1 + gravity;
    speed2 = speed2 + gravity;
    // Add speed to y location
    y1 = y1 + speed1;
    y2 = y2 + speed2;
    // If square reaches the bottom
    // Reverse speed
    if (y1 > height) {
      // Dampening
      speed1 = speed1 * -0.8;
      y1 = height;
    }
     if (y2 > height) {
      // Dampening
      speed2 = speed2 * -0.8;
      y2 = height;
    }
    /////////
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
    // Display the circle
    fill(0,life);
    //stroke(0,life);
    line(x1,y1,x2,y2);
  }
}  

