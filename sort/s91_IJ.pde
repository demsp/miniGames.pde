// paddle
int IpaddleX= 30;
int incIPaddle=1;
int JpaddleX= 30;
int incJPaddle=1;

int classSize=10;
 int vTemp;
// inc
int inc=1;
//button
int buttonX=25, buttonY=325; 
int buttonSize = 50;     
boolean boolButton = false;

//int unit = 40;
int count;
Module[] mods;

void setup() {
  size(400, 400);
 // noStroke(); 
  mods = new Module[classSize];
 mods[0] = new Module(1*30,  100);
 mods[1] = new Module(2*30,  50);
 mods[2] = new Module(3*30,  30);
 mods[3] = new Module(4*30,  60);
 mods[4] = new Module(5*30,  20);
 mods[5] = new Module(6*30,  40);
 mods[6] = new Module(7*30,  80);
 mods[7] = new Module(8*30,  70);
 mods[8] = new Module(9*30,  90);
 mods[9] = new Module(10*30, 10);  
 }

void draw() { 
  background(10);
     buttonUpdate();  
  for (Module mod : mods) {
 //   mod.update();
    mod.display();       
  }
  
   // paddles
  rect (IpaddleX, 85, 20, 5);
  IpaddleX = incIPaddle*30;
  rect (JpaddleX, 75, 20, 5);
  JpaddleX = incJPaddle*30;
  
  // draw button
  fill(50);
  rect(buttonX,buttonY,buttonSize,buttonSize);
   if(boolButton && mousePressed)  
  { 
    fill(200);
    rect(buttonX,buttonY,buttonSize,buttonSize);
   }
 
//println(boolButton); 
//println(inc);
}


class Module {
 int xOffset;
 // int x;
  int rectHight;
  
// Contructor
   Module(int xOffsetTemp, int rectHightTemp) {
    xOffset = xOffsetTemp;   
    rectHight=rectHightTemp;
  }  
  // Custom method for updating the variables
  void update() {
    /*
    x = x + (speed * xDirection);
    if (x >= 40 || x <= 0) {
      xDirection *= -1;
      x = x + (1 * xDirection);      
    }
    */
  }  
  // Custom method for drawing the object
  void display() {
    fill(255);    
      rect(xOffset , 100, 20, rectHight);
  }
}

// button
void mousePressed() {
 if(boolButton)
 {
  if(inc>classSize-1) inc=1;
  
  if(incJPaddle>classSize-1) incJPaddle=incIPaddle;
   incJPaddle++;
     
  //if(incIPaddle>classSize-1) incIPaddle=classSize-1;
  if(incJPaddle>classSize-1) incIPaddle++;
  if(incIPaddle>classSize-1) incIPaddle=classSize-1;
 } 
}
 void mouseReleased() {
 if(boolButton)
 { 
  if(mods[inc].rectHight < mods[inc-1].rectHight)  
    {     
     vTemp= mods[inc-1].rectHight;
     mods[inc-1].rectHight=mods[inc].rectHight;
     mods[inc].rectHight=vTemp;
    }
    inc++;
   // paddleX=paddleX+40;
 }   
}

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
