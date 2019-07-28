// if(pivot==limiterR){ meetingFlag=true; }
// if(keyPressed) jumpFlag=true;
// if(!jumpFlag) limiterR jumps to moduleSize
// if(!jumpFlag) limiterR jumps to tempR
IntList listL;
IntList listR;
ArrayList listRand;
int pivotTemp;
int tempR;
boolean trigger;
//int max;
int newRand;

boolean stepFlag,meetingFlag,jumpFlag,IversonFlag=true;
boolean callFlag; // for call Foo()
boolean switcher,switcher1;

int counter;
int moduleSize = 10;
int pivot = 1;
int limiterR=moduleSize;
int slider=2;

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
 listRand = new ArrayList(10);
 listL= new IntList();
 listR= new IntList();
 listL.append(1);
//* 
 mods[0] = new Module(1*30,  randFoo()*10 );
 //mods[0] = new Module(1*30,  10 );
 mods[1] = new Module(2*30,  randFoo()*10 );
 mods[2] = new Module(3*30,  randFoo()*10 );
 mods[3] = new Module(4*30,  randFoo()*10 );
 mods[4] = new Module(5*30,  randFoo()*10 );
 mods[5] = new Module(6*30,  randFoo()*10 );
 mods[6] = new Module(7*30,  randFoo()*10 );
 mods[7] = new Module(8*30,  randFoo()*10 );
 mods[8] = new Module(9*30,  randFoo()*10 );
 mods[9] = new Module(10*30,  randFoo()*10 );
// mods[9] = new Module(10*30,  100 );
 //*/
 /*
 mods[0] = new Module(1*30,  10);
 mods[1] = new Module(2*30,  20);
 mods[2] = new Module(3*30,  30);
 mods[3] = new Module(4*30,  40);
 mods[4] = new Module(5*30,  50);
 mods[5] = new Module(6*30,  100);
 mods[6] = new Module(7*30,  70);
 mods[7] = new Module(8*30,  80);
 mods[8] = new Module(9*30,  90 );
 mods[9] = new Module(10*30, 60 );
 //*/
 
 /*
 mods[0] = new Module(1*30,  40);
 mods[1] = new Module(2*30,  60);
 mods[2] = new Module(3*30,  30);
 mods[3] = new Module(4*30,  20);
 mods[4] = new Module(5*30,  70);
 mods[5] = new Module(6*30,  50);
 mods[6] = new Module(7*30,  80);
 mods[7] = new Module(8*30,  10);
 //*/
 
 /*
 mods[0] = new Module(1*30,  50);
 mods[1] = new Module(2*30,  40);
 mods[2] = new Module(3*30,  100);
 mods[3] = new Module(4*30,  30);
 mods[4] = new Module(5*30,  90);
 mods[5] = new Module(6*30,  60);
 mods[6] = new Module(7*30,  80);
 mods[7] = new Module(8*30,  10);
 mods[8] = new Module(9*30,  70);
 mods[9] = new Module(10*30, 20);  
// */
 /*
 mods[0] = new Module(1*30,  20);
 mods[1] = new Module(2*30,  30);
 mods[2] = new Module(3*30,  10);
 mods[3] = new Module(4*30,  50);
 mods[4] = new Module(5*30,  90);
 mods[5] = new Module(6*30,  60);
 mods[6] = new Module(7*30,  80);
 mods[7] = new Module(8*30,  40);
 mods[8] = new Module(9*30,  70);
 mods[9] = new Module(10*30, 100);  
 //*/
}

void draw() { 
  background(50);
   buttonUpdate();  
   for (Module mod : mods) {  mod.display();  }
  
   // paddle
  rect (pivot*30, 85, 20, 5);
  rect ( (pivot+1)*30, 85, 20, 5);
   rect (limiterR*30, 65, 20, 5);
  
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
// println(stepFlag);
//println(tempR);
//println(listL);
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
// button
void mouseReleased() {
 if(boolButton)
 {
 if(callFlag){  callFlag=false; Foo(); return;} 
 
   if(meetingFlag){
   pivot++;
   if(!jumpFlag)limiterR=moduleSize;
   else if(jumpFlag) limiterR=tempR;
   meetingFlag=false;
   }
  else if(!meetingFlag){ 
   if(!stepFlag) limiterR--;
   if(stepFlag)  {  
   pivot++;
   stepFlag=false;
    } 
  }//end else  
 
   if(jumpFlag && limiterR>pivot &&     
     mods[limiterR-2].rectHight>mods[limiterR-1].rectHight) 
   { IversonFlag=false; }
   
 println(IversonFlag);
 println(tempR);
 println(listL);
  }///  
}///
 
 void mousePressed() {
  if(boolButton)
 {
  if(limiterR<pivot) {limiterR=pivot;pivot=1;if(listL.size()!=0)listL.pop();}  
   
 counter++;
  if(pivot==moduleSize || (pivot==limiterR && IversonFlag && jumpFlag) ){ callFlag=true; return; } 
  //the End
  // if(pivot==1 && limiterR==1){pivot=1; limiterR=1; return;}
 
 if(mods[pivot-1].rectHight<mods[pivot].rectHight 
   && mods[pivot].rectHight<mods[limiterR-1].rectHight) return;
else{
if(mods[pivot].rectHight > mods[pivot-1].rectHight)
  {
    vTemp= mods[pivot].rectHight;
    mods[pivot].rectHight=mods[limiterR-1].rectHight;
    mods[limiterR-1].rectHight=vTemp;
 //   if(jumpFlag) IversonFlag=false; ///
  }
 if(mods[pivot].rectHight < mods[pivot-1].rectHight)
  {
    vTemp= mods[pivot].rectHight;
    mods[pivot].rectHight=mods[pivot-1].rectHight;
    mods[pivot-1].rectHight=vTemp;
    stepFlag=true;
   if(jumpFlag) IversonFlag=false; ///
    }
 } // end else
 
 if(pivot==limiterR){
 listL.append(pivot);
 meetingFlag=true;
 IversonFlag=true;
 }
 println(IversonFlag);
 println(tempR);
 println(listL);
 } ///
} ///

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

int randFoo(){
 newRand = int(random(1,11)); 
 //newRand = int(random(2,10));
  if(!listRand.contains(newRand) )  listRand.add(newRand );
    else newRand=randFoo();
    return newRand;
 }

//void keyPressed() {
  void Foo(){  
  IversonFlag=true;
 //if(pivot==moduleSize && listL.size()==1 && listL.get(listL.size()-1)==1) 
 if(pivot==moduleSize)
   listL.append(moduleSize-1);
  
if(listL.size()!=0){ // for Edge
 tempR= listL.get(listL.size()-1); 

  // limiterR=listL.pop();
  limiterR=tempR; 
  listL.pop();    
  } // end if
 if(listL.size()>1)   pivot= listL.get(listL.size()-1);
 else{
    limiterR=tempR;
   if(listL.size()==1) pivot= listL.get(listL.size()-1);
   if(listL.size()==0) return;
    }
 jumpFlag=true;
 println(tempR);
}


/*
 //min
 if(mods[pivot-1].rectHight<mods[0].rectHight)
 {
  vTemp= mods[pivot-1].rectHight;
    mods[pivot-1].rectHight=mods[0].rectHight;
    mods[0].rectHight=vTemp;
 }   
*/
