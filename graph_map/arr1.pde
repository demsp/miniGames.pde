ArrayList<Ball> balls;
int ballWidth = 40;
int f=0;
int vertX=100;
int vertY=200;

int counter;
int moduleSize = 10;
//int floatingStoper = moduleSize;

// paddle
int incPaddle=1;

int vTemp;

//button
int buttonX=25, buttonY=325; 
int buttonSize = 50;     
boolean boolButton = false;

int count;
Module[] mods;

void setup() {
  size(700, 700);
 balls = new ArrayList<Ball>();
 
 mods = new Module[moduleSize];
 mods[0] = new Module(1*30,  30);
 mods[1] = new Module(2*30,  50);
 mods[2] = new Module(3*30,  10);
 mods[3] = new Module(4*30,  60);
 mods[4] = new Module(5*30,  20);
 mods[5] = new Module(6*30,  100);
 mods[6] = new Module(7*30,  80);
 mods[7] = new Module(8*30,  70);
 mods[8] = new Module(9*30,  90);
 mods[9] = new Module(10*30, 40);  
  }

void draw() { 
  background(50);
   for (int i = balls.size()-1; i >= 0; i--) 
   { Ball ball = balls.get(i);  
     ball.display();   
     if (mouseX >= ball.x && mouseX <= ball.x+40 && 
      mouseY >= ball.y && mouseY <= ball.y+40) {f=200;println("***********");}
   }  
     buttonUpdate();  
  for (Module mod : mods) {  mod.display();  }
  
   // paddle
  rect (incPaddle*30, 10, 20, 5);
 // rect (floatingStoper*30, 75, 20, 5);
  
 //    textSize(25);
 //    text(counter,300,350);
  // draw button
  fill(150);
  rect(buttonX,buttonY,buttonSize,buttonSize);
   if(boolButton && mousePressed)  
  { 
    fill(200);
    rect(buttonX,buttonY,buttonSize,buttonSize);
   } 
}
//void mousePressed() {   
//  // A new ball object is added to the ArrayList (by default to the end)
//  balls.add(new Ball(mouseX, mouseY, ballWidth));}


class Module {
 int xOffset; 
 int rectHight;
  
// Contructor
   Module(int xOffsetTemp, int rectHightTemp) {
    xOffset = xOffsetTemp;  
    rectHight=rectHightTemp;
  }  
  // Custom method for drawing the object
  void display() {
    fill(255);
     rect(xOffset , 20, 20, rectHight);
   }
}

// кнопка
// нажатие 
 void mousePressed() {
 
 if(boolButton) 
 {
 vertX=vertX+50;  
 balls.add(new Ball(vertX, vertY,  mods[incPaddle-1].rectHight ));
  counter++; 
  } 
}
//отжатие 
void mouseReleased() {
 if(boolButton)
  {    
   incPaddle++;
   if(incPaddle>=moduleSize) 
   { 
    incPaddle=1;     
   }
  }   
 }
//###################################
 void buttonUpdate() {
  if ( overButton(buttonX, buttonY, buttonSize, buttonSize)  ) {
    boolButton = true;
  } else {
   boolButton = false;
  }
}
boolean overButton(int x, int y, int width, int height)  {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
 } else {
  return false;
  }
} 
//#####################################
//#####################################

 class Ball {
  float x;
  float y;
  int num;
  
  Ball(float tempX, float tempY, int tempNum) {
    x = tempX;
    y = tempY;
    num = tempNum;
  }  
  
  void display() {
    // Display the circle  
   fill(100);
   rect(x,y,50,50);
   fill(20);
   textSize(25);
   // mods[incPaddle-1].rectHight
   text(num,x+5,y+30);
   
   println("x=",x);
   println("y=",y);
   println();    
  }
} 
