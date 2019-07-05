// 23415
// 32415
// 1,2,3,6,4,5
// 1,2,3,6,4,5
IntList listL;
IntList listR;

int halfTemp;
//   boolean flag;
boolean mouse_flag;
boolean trigger;
int triggerTempL;
int triggerTempR;

boolean shift;

int counter;
int moduleSize = 5;
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
 listL = new IntList(); 
 listR = new IntList(); 
 mods = new Module[moduleSize];
 /*
 mods[0] = new Module(1*30,  60);
 mods[1] = new Module(2*30,  50);
 mods[2] = new Module(3*30,  40);
 mods[3] = new Module(4*30,  30);
 mods[4] = new Module(5*30,  20);
 mods[5] = new Module(6*30,  10);
 */
 //123645
 mods[0] = new Module(1*30,  30);
 mods[1] = new Module(2*30,  20);
 mods[2] = new Module(3*30,  40);
 mods[3] = new Module(4*30,  10);
  mods[4] = new Module(5*30, 50);
//  mods[5] = new Module(6*30,  50);
 //mods[6] = new Module(7*30,  70);
 //mods[7] = new Module(8*30,  80);
 
// */
 /*
 mods[0] = new Module(1*30,  80);
 mods[1] = new Module(2*30,  10);
 mods[2] = new Module(3*30,  20);
 
 mods[3] = new Module(4*30,  30);
 mods[4] = new Module(5*30,  40);
 
 mods[5] = new Module(6*30,  50);
 mods[6] = new Module(7*30,  60);
 mods[7] = new Module(8*30,  70);
*/
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
  // draw button
  fill(150);
  rect(buttonX,buttonY,buttonSize,buttonSize);
   if(boolButton && mousePressed)  
  { 
    fill(200);
    rect(buttonX,buttonY,buttonSize,buttonSize);
   }
// println(flag);
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
/*
void mouseReleased() {
 if(boolButton)  {  }   
 }
 */
 void mousePressed() { 
 if(boolButton)
 {  
 counter++;  
 println(listL);
 println(listR);
 println("halfTemp ",halfTemp);
 if(halfTemp!=0) println("mods[halfTemp-1] ",mods[halfTemp-1].rectHight);
 println("trigger ",trigger);
 
 sort(limiterL,limiterR);
  }
}

void sort(int L,int R){
  
 if(!trigger) {
 triggerTempL=L;
 triggerTempR=R;
 halfTemp = round(triggerTempL+triggerTempR)/2;
// halfTemp = floor(triggerTempL+triggerTempR)/2;

 // println("halfTemp ",halfTemp);
 // println("mods[halfTemp-1] ",mods[halfTemp-1].rectHight);
 //println("trigger ",trigger);
 trigger=true;}
 //              //              //
 if(mods[L-1].rectHight >mods[halfTemp-1].rectHight && 
      mods[R-1].rectHight<mods[halfTemp-1].rectHight )  
    {     
     vTemp= mods[L-1].rectHight;
     mods[L-1].rectHight=mods[R-1].rectHight;
     mods[R-1].rectHight=vTemp;    
    }
   // condition for 1,2,4,3,5,6
      
   if(L==R-1 && mods[L-1].rectHight > mods[R-1].rectHight)
    {
    vTemp= mods[L-1].rectHight;
     mods[L-1].rectHight=mods[R-1].rectHight;
     mods[R-1].rectHight=vTemp;
    }
    
    //              //     
 if(mods[L-1].rectHight<mods[halfTemp-1].rectHight && L<=halfTemp ) L++; 
          limiterL=L;
 if(mods[halfTemp-1].rectHight<mods[R-1].rectHight && R>=halfTemp ) R--; 
          limiterR=R;    
 
 // println(triggerTempL-1);
  if(L==R){  
  //if(listL.size()!=0) {limiterL=listL.pop(); limiterR=listR.pop(); }
  trigger=false;
  listL.append(triggerTempL);
  listR.append(halfTemp);
  listL.append(halfTemp+1);
  listR.append(triggerTempR);         
  }
 // for 1,2,3,4,6,5 
 if(listL.size()>2)
 {
  if(listL.get( listL.size()-2 )==listR.get( listR.size()-2 )) {
     listL.pop(); listR.pop();   
      listL.pop(); listR.pop();
       limiterL=listL.pop(); limiterR=listR.pop();
   /*    
   triggerTempL=L;
    triggerTempR=R;
     halfTemp = round(triggerTempL+triggerTempR)/2;
     */
    }
 } 
 
} //end sort

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
