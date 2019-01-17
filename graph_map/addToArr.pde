ArrayList<Ball> balls;
int ballWidth = 40;
int f=0;
void setup() {
  size(640, 360);
  balls = new ArrayList<Ball>();
}

void draw() {
  background(255);
  for (int i = balls.size()-1; i >= 0; i--) { 
    // An ArrayList doesn't know what it is storing so we have to cast the object coming out
    Ball ball = balls.get(i);
   //ball.move();
    ball.display();
   // ball.mouseClick();
    if (mouseX >= ball.x && mouseX <= ball.x+40 && 
      mouseY >= ball.y && mouseY <= ball.y+40) {f=200;println("***********");}
   }  
}

void mousePressed() {
   
  // A new ball object is added to the ArrayList (by default to the end)
  balls.add(new Ball(mouseX, mouseY, ballWidth));
}

class Ball {
  float x;
  float y;
  float speed;
  float gravity;
  float w;
  float life = 255;
 // int k=0;
  
  Ball(float tempX, float tempY, float tempW) {
    x = tempX;
    y = tempY;
    w = tempW;
   // speed = 0;
  //  gravity = 0.1;
  }
  
    void move() {
    // Add gravity to speed
    speed = speed + gravity;
    // Add speed to y location
    y = y + speed;
    // If square reaches the bottom
    // Reverse speed
    if (y > height) {
      // Dampening
      speed = speed * -0.8;
      y = height;
    }
  }
/*  
   void mouseClick() {
    
   if (mouseX >= x && mouseX <= x+40 && 
      mouseY >= y && mouseY <= y+40) {
   if (mousePressed && (mouseButton == LEFT)) {
    k=k+10; if(k>255) k=255;  } 
          }
  }
  */
 void newFill(){
 fill(100,100,100);
 }
  void display() {
    // Display the circle
    fill(0,life);
    //stroke(0,life);
   // ellipse(x,y,w,w);
   fill(f);
   rect(x,y,w,w);
   println("x=",x);
   println("y=",y);
   println();
    
  }
}  

