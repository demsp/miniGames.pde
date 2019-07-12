// 245136
boolean boo1;
boolean boo;
IntList listRand;
IntList listL;
IntList listR;
// 25314678
// 35214678
// 85214673

int halfTemp;
//   boolean flag;
boolean mouse_flag;
boolean trigger;
int tempL;
int tempR;

boolean shift;

int counter;
int moduleSize = 8;
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
  listL=new IntList();
  listR=new IntList();
  listRand=new IntList();
  listRand.append(0);
 mods = new Module[moduleSize];
/* 
 mods[0] = new Module(1*30,  10);
 mods[1] = new Module(2*30,  30);
 mods[2] = new Module(3*30,  50);
 mods[3] = new Module(4*30,  60);
 mods[4] = new Module(5*30,  40);
 mods[5] = new Module(6*30,  80);
 mods[6] = new Module(7*30,  70);
 mods[7] = new Module(8*30,  20);
 //*/
 /*
 mods[0] = new Module(1*30,  30);
 mods[1] = new Module(2*30,  50);
 mods[2] = new Module(3*30,  20);
 mods[3] = new Module(4*30,  10);
 mods[4] = new Module(5*30,  40);
 mods[5] = new Module(6*30,  60);
 mods[6] = new Module(7*30,  70);
 mods[7] = new Module(8*30,  80);
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
// */
//*
mods[0] = new Module(1*30,   randm(1,15) );
 mods[1] = new Module(2*30,  randm(1,15) );
 mods[2] = new Module(3*30,  randm(1,15) ); 
 mods[3] = new Module(4*30,  randm(1,15) );
 mods[4] = new Module(5*30,  randm(1,15) );
 mods[5] = new Module(6*30,  randm(1,15) );
 mods[6] = new Module(7*30,  randm(1,15) );
 mods[7] = new Module(8*30,  randm(1,15) );
 //*/
/* 
 mods[0] = new Module(1*30,  50);
 mods[1] = new Module(2*30,  30);
 mods[2] = new Module(3*30,  10); 
 mods[3] = new Module(4*30,  60);
 mods[4] = new Module(5*30,  80);
 mods[5] = new Module(6*30,  20);
 mods[6] = new Module(7*30,  70);
 mods[7] = new Module(8*30,  40);
 //*/
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
 sort(limiterL,limiterR);
  }
}

void sort(int L,int R){
  if(L==moduleSize+1 ) return;
 if(!trigger) {
 tempL=L;
 tempR=R;
 
 trigger=true;}
 println(trigger);

 //              //              //
       // R--;
     // if(!boo){ L++;}
    //  if(boo){boo=false; R--;}    
   
   
 if(mods[L-1].rectHight > mods[R-1].rectHight 
   && mods[R-2].rectHight < mods[R-1].rectHight)  
    {
    vTemp= mods[L-1].rectHight;
     mods[L-1].rectHight=mods[R-1].rectHight;
     mods[R-1].rectHight=vTemp;
    //if(mods[R-2].rectHight > mods[R-1].rectHight  )  L++; 
    } 
 if(mods[L-1].rectHight > mods[R-1].rectHight 
   && mods[R-2].rectHight > mods[R-1].rectHight)  
    {
    vTemp= mods[L-1].rectHight;
     mods[L-1].rectHight=mods[R-1].rectHight;
     mods[R-1].rectHight=vTemp;
     L++; 
    } 
    
    if(mods[L-1].rectHight < mods[R-1].rectHight )  
    {R--;}       
    /////////////////////     
  
  if(L==R){if(boo1){L=1;R=8;boo1=false;} if(!boo1){boo1=true;}       }
 
   
   
 //              //              //     
 /*
 if(mods[L-1].rectHight<mods[halfTemp-1].rectHight && L<=halfTemp ) L++; 
          limiterL=L;
 if(mods[halfTemp-1].rectHight<mods[R-1].rectHight && R>=halfTemp ) R--; 
          limiterR=R;    
 */
   
   println(listL);
   println(listR);
    
   println(trigger); 
   limiterL=L;
   limiterR=R;
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

int randm(int a,int b){
int y;  
int x=int( random(a,b) )*10;
 if (listRand.hasValue(x) == false) 
 {
  listRand.append(x); 
  y=x; 
 }
 else y=randm(a,b);
 return y;
}
