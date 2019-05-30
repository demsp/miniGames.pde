// paddle
int paddleX= 180;
int incPaddle=6;

 int vTemp;
// inc
int inc=5;
//button
int buttonX=25, buttonY=525; 
int buttonSize = 50;     
boolean boolButton = false;

//int unit = 40;
int count;
Module[] mods;

void setup() {
  size(500, 600);
 // noStroke(); 
  mods = new Module[6];
//  mods = new Module[5];


  mods[0] = new Module(30,  10);
  mods[1] = new Module(60,   50);
  mods[2] = new Module(90,   20);
  mods[3] = new Module(120, 60);
  mods[4] = new Module(150, 30);
  mods[5] = new Module(180,  40);
  }

void draw() {
  frameRate(500);
  background(20);
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
   //  x = xTemp;   
    //speed = speedTemp;
    //unit = tempUnit;
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
  if(inc<1) inc=5;
  if(incPaddle<=1) incPaddle=6;
   incPaddle--;
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
    inc--;
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
