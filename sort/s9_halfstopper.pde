// float stoper
int stoper=9;
// paddle
int paddleX= 30;
int incPaddle=1;

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
  mods = new Module[10];
//  mods = new Module[5];


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
 // frameRate(300);
  background(10);
     buttonUpdate();  
  for (Module mod : mods) {
 //   mod.update();
    mod.display();
   // if (mod.rectHight>50){    println(mod.rectHight);  }    
  }
  
   // paddle
  rect (paddleX, 85, 20, 5);
  paddleX = incPaddle*30;
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
  //void update() {  }  
  // Custom method for drawing the object
  void display() {
    fill(255);
    // ellipse(xOffset + x, 100, 6, 6);
      //rect(xOffset + x, 100, 6, rectHight);
      rect(xOffset , 100, 20, rectHight);
  }
}

// button
void mousePressed() { 
//bool_mouseReleased=false;
 if(boolButton)
 {
   if(inc>stoper) 
   { 
    inc=1;
    stoper--;
    if (stoper<5) stoper=0;
   }
  if(incPaddle>stoper) incPaddle=1;
   incPaddle++;
 }
   print(inc);
   println();
   print(mods[inc-1].rectHight);
     println();
     print(mods[inc].rectHight);
     println();
     println();
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
