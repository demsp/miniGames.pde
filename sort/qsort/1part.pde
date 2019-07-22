boolean flag;

int counter;
int moduleSize = 10;
int limiterL = 1;
int limiterR = 8;
int incPaddle=1;

 int vTemp;
//button
int buttonX=25, buttonY=325; 
int buttonSize = 50;     
boolean boolButton = false;

int count;
Module[] mods;

void setup() {
  size(400, 400);
 mods = new Module[moduleSize];
 mods[0] = new Module(1*30,  60);
 mods[1] = new Module(2*30,  50);
 mods[2] = new Module(3*30,  20);
 mods[3] = new Module(4*30,  100);
 mods[4] = new Module(5*30,  80);
 mods[5] = new Module(6*30,  30);
 mods[6] = new Module(7*30,  70);
 mods[7] = new Module(8*30,  10);
 mods[8] = new Module(9*30,  90);
 mods[9] = new Module(10*30, 40);  
}

void draw() { 
  background(50);
   buttonUpdate();  
   for (Module mod : mods) {  mod.display();  }
  
   // paddle
  rect (incPaddle*30, 85, 20, 5);
  rect (limiterR*30, 75, 20, 5);
  rect (limiterL*30, 65, 20, 5);
  
  textSize(25);
  text(counter,300,350);
  // draw button
  fill(150);
  rect(buttonX,buttonY,buttonSize,buttonSize);
   if(boolButton && mousePressed)  
  { 
    fill(200);
    rect(buttonX,buttonY,buttonSize,buttonSize);
   }
 println(flag);
}

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
   rect(xOffset , 100, 20, rectHight);
   }
}

// button
void mouseReleased() {
 if(boolButton)
  {
   if(!flag) incPaddle++;
   if(flag) 
   { 
     limiterR=incPaddle;
  if(incPaddle<moduleSize+1) //////////////    
    if(mods[incPaddle-1].rectHight > mods[limiterL-1].rectHight) incPaddle++;
 if(incPaddle<moduleSize+1)  ////////////
    if(mods[incPaddle-1].rectHight < mods[limiterL-1].rectHight)
    {
     vTemp= mods[incPaddle-1].rectHight;
     mods[incPaddle-1].rectHight=mods[incPaddle-2].rectHight;
     mods[incPaddle-2].rectHight=vTemp; 
     if(incPaddle>limiterL)incPaddle--;
     if(incPaddle==limiterL)
       {
         limiterL++;
         incPaddle=limiterR;
       }  
    }
   
   } 
 }   
} //end
 
 void mousePressed() { 
 if(boolButton)
 {  
 counter++; 
  if(limiterR==limiterL) flag=false;
 if(incPaddle<moduleSize+1) //////////////
 if(mods[incPaddle-1].rectHight > mods[limiterL-1].rectHight) {flag=true;}
 /*
  if(mods[incPaddle].rectHight < mods[incPaddle-1].rectHight)  
    {     
     vTemp= mods[incPaddle-1].rectHight;
     mods[incPaddle-1].rectHight=mods[incPaddle].rectHight;
     mods[incPaddle].rectHight=vTemp;
    }
    */
  
   if(incPaddle<moduleSize+1) //////////////
  if(mods[incPaddle-1].rectHight < mods[limiterL-1].rectHight && !flag  ){
    vTemp= mods[incPaddle-1].rectHight;
     mods[incPaddle-1].rectHight=mods[limiterL-1].rectHight;
     mods[limiterL-1].rectHight=vTemp; 
     limiterL++;
     }
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
