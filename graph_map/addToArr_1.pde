ArrayList<Ball> balls;
int ballWidth = 40;
void setup() {
  size(640, 360);
  balls = new ArrayList<Ball>();
}

void draw() {
  background(255);
  frameRate(3);
  for (int i = balls.size()-1; i >= 0; i--) { 
    // An ArrayList doesn't know what it is storing so we have to cast the object coming out
    Ball ball = balls.get(i);
   //ball.move();
    ball.display();   }
   for (Ball ball : balls) {
    ball.mouseClick();
 // ball.update();
  }
}

void mousePressed() {
 // A new ball object is added to the ArrayList (by default to the end)
  balls.add(new Ball(mouseX, mouseY, ballWidth));
}

class Ball {
  float x;
  float y;
  float w;
 
 float speed, gravity;
 
  int colorCounter=0;
  int[] whiteArr={255,255,255};
  int[] redArr={255,0,0};
  int[] greenArr={0,255,0};
  int[] blueArr={0,0,255};
  int[] colorArr=whiteArr;
  
  Ball(float tempX, float tempY, float tempW) {
    x = tempX;
    y = tempY;
    w = tempW; 
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
  
void mouseClick() {
   if (mouseX >= x && mouseX <= x+40 && 
      mouseY >= y && mouseY <= y+40) {
   //if (mousePressed && (mouseButton == LEFT)) { }
  colorCounter+=1;
 if (colorCounter==4) colorCounter=0;
 if (colorCounter==0) colorArr=whiteArr;
 if (colorCounter==1) colorArr=redArr;
 if (colorCounter==2) colorArr=greenArr;
 if (colorCounter==3) colorArr=blueArr;
          }
  }
 
void display() {
   fill(colorArr[0],colorArr[1],colorArr[2]);
   rect(x,y,w,w);
  }
}  

