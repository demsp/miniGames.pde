//  if(limiterR<=limiterL+1) limiterR=limiterL+1;
//   if(limiterL>=limiterR-1) limiterL=limiterR-1;
boolean flag;

int index;
int counter;
int moduleSize = 10;
int limiterL = 1;
int limiterR = moduleSize;
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
 /*
 mods[0] = new Module(1*30,  20);
 mods[1] = new Module(2*30,  30);
 mods[2] = new Module(3*30,  40);
 mods[3] = new Module(4*30,  10);
 mods[4] = new Module(5*30,  50);
 mods[5] = new Module(6*30,  60);
 mods[6] = new Module(7*30,  70);
 mods[7] = new Module(8*30,  80);
 mods[8] = new Module(9*30,  90);
 mods[9] = new Module(10*30, 100);  
 */
 mods[0] = new Module(1*30,  40);
 mods[1] = new Module(2*30,  10);
 mods[2] = new Module(3*30,  20);
 mods[3] = new Module(4*30,  30);
 mods[4] = new Module(5*30,  50);
 mods[5] = new Module(6*30,  60);
 mods[6] = new Module(7*30,  70);
 mods[7] = new Module(8*30,  80);
 mods[8] = new Module(9*30,  100);
 mods[9] = new Module(10*30, 90);
}

void draw() { 
  background(50);
   buttonUpdate();  
   for (Module mod : mods) {  mod.display();  }
  
   // paddle
 // rect (incPaddle*30, 85, 20, 5);
  rect (limiterR*30, 65, 20, 5);
  rect (limiterL*30, 75, 20, 5);
  
  textSize(25);
  text(counter,300,350);
  text(index,30,30);
  // draw button
  fill(150);
  rect(buttonX,buttonY,buttonSize,buttonSize);
   if(boolButton && mousePressed)  
  { 
    fill(200);
    rect(buttonX,buttonY,buttonSize,buttonSize);
   }
 //println(flag);
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
//void mouseReleased() {
// if(boolButton)  {  }   
// }
 
 
 /*
 void mousePressed() { 
 if(boolButton)
 {  
 counter++;
 // if flag
 if(flag)
   {
   if(mods[incPaddle-1].rectHight > mods[limiterR-1].rectHight)  
    {     
     vTemp= mods[limiterL-1].rectHight;
     mods[limiterL-1].rectHight=mods[limiterR-1].rectHight;
     mods[limiterR-1].rectHight=vTemp;
    flag=false;
    }
   if(limiterR>1) limiterR--;
   }
 // if !flag
 if(!flag)limiterL++;
   if(mods[incPaddle-1].rectHight < mods[limiterL-1].rectHight) flag=true; 
   // change limiterR - incPaddle
    if(limiterR<limiterL && limiterR>1)
    //if(limiterR<limiterL)
    {     
     vTemp= mods[incPaddle-1].rectHight;
     mods[incPaddle-1].rectHight=mods[limiterR-1].rectHight;
     mods[limiterR-1].rectHight=vTemp;
      incPaddle=limiterR;
      index=limiterR;
     // limiterR--;
     // limiterL=1;
    }     
    
  }
}
*/


void mousePressed() { 
 if(boolButton)
 {  
 counter++;
 // if flag
 if(flag) {
   if(limiterR>1) limiterR--;
   }
 // if !flag
 if(!flag)limiterL++;
   if(mods[incPaddle-1].rectHight < mods[limiterL-1].rectHight) flag=true; 
   // change limiterR - incPaddle
sorted(limiterL,limiterR);    
    
  }
}

void sorted(int first, int last){
  println(first);
  println(last);
 if(last<first) {println("hIGER");
   vTemp= mods[0].rectHight;
     mods[0].rectHight=mods[last-1].rectHight;
     mods[last-1].rectHight=vTemp;
     
     limiterL=1;
     flag=false;
     index=last;
     //limiterR=1;
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
