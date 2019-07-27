// if(pivot==limiterR){ meetingFlag=true; }

// if(keyPressed) edgeFlag=true;
// if(!edgeFlag) limiterR jumps to moduleSize
// if(edgeFlag) limiterR jumps to tempR

//   if(pivot==moduleSize){ callFlag=true; return; }
// if(callFlag){ Foo(); callFlag=false; return;} 

//  if(pivot==moduleSize && listL.size()==1 && listL.get(listL.size()-1)==1) listL.append(9);

IntList listL;
IntList listR;
ArrayList listRand;
int pivotTemp;
int tempR;
boolean trigger;
//int max;
int newRand;

boolean stepFlag,meetingFlag,edgeFlag,stopFlag,IversonFlag=true,callFlag;
boolean switcher,switcher1;

int counter;
int moduleSize = 15;
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
  size(500, 400);
 mods = new Module[moduleSize];
// listRand = new ArrayList(10);
 listRand = new ArrayList(15);
 listL= new IntList();
 listR= new IntList();
 listL.append(1);
//* 
 mods[0] = new Module(1*30,  randFoo()*10 );
 mods[1] = new Module(2*30,  randFoo()*10 );
 mods[2] = new Module(3*30,  randFoo()*10 );
 mods[3] = new Module(4*30,  randFoo()*10 );
 mods[4] = new Module(5*30,  randFoo()*10 );
 mods[5] = new Module(6*30,  randFoo()*10 );
 mods[6] = new Module(7*30,  randFoo()*10 );
 mods[7] = new Module(8*30,  randFoo()*10 );
 mods[8] = new Module(9*30,  randFoo()*10 );
 mods[9] = new Module(10*30,  randFoo()*10 );
 //*
 mods[10] = new Module(11*30,  randFoo()*10 );
 mods[11] = new Module(12*30,  randFoo()*10 );
 mods[12] = new Module(13*30,  randFoo()*10 );
 mods[13] = new Module(14*30,  randFoo()*10 );
 mods[14] = new Module(15*30,  randFoo()*10 );
 //*/
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
//println(listL);
//println(tempR);

  if(edgeFlag && limiterR>pivot && 
     (mods[limiterR-2].rectHight>mods[limiterR-1].rectHight || 
       mods[pivot-1].rectHight>mods[pivot].rectHight )  ) 
   { IversonFlag=false; }
println(listL);   
println(IversonFlag);
 println(limiterR-2);
 println(limiterR-1);
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
  if(limiterR<pivot){pivot=1;limiterR++;return;}
   
   if(pivot==limiterR){IversonFlag=true;}
    if(callFlag){  callFlag=false; Foo(); return;} 
   //the End 
    
   if(meetingFlag){
   pivot++;
   if(!edgeFlag)limiterR=moduleSize;
   else if(edgeFlag) limiterR=tempR;
   meetingFlag=false;
   }
  else if(!meetingFlag){ 
   if(!stepFlag) limiterR--;
   if(stepFlag)  {  
   pivot++;
   stepFlag=false;
    } 
  }//end else 
  
  
  } 
}
 
 void mousePressed() {
  if(boolButton)
 {
  if(limiterR<pivot){pivot=1;limiterR++;return;}
  
 if(pivot==moduleSize || (pivot==limiterR && IversonFlag && edgeFlag) ){ callFlag=true; return; } 
 
  
 counter++;   
 
 if(mods[pivot-1].rectHight<mods[pivot].rectHight 
   && mods[pivot].rectHight<mods[limiterR-1].rectHight) return;
else{
if(mods[pivot].rectHight > mods[pivot-1].rectHight)
  {
    vTemp= mods[pivot].rectHight;
    mods[pivot].rectHight=mods[limiterR-1].rectHight;
    mods[limiterR-1].rectHight=vTemp;
  }
 if(mods[pivot].rectHight < mods[pivot-1].rectHight)
  {
    vTemp= mods[pivot].rectHight;
    mods[pivot].rectHight=mods[pivot-1].rectHight;
    mods[pivot-1].rectHight=vTemp;
    stepFlag=true;
    }
 } // end else
 
 if(pivot==limiterR){
 listL.append(pivot);
 meetingFlag=true;
 }
 
  //Iverson  
 
 println(listL);
 println(IversonFlag);
 println(limiterR-2);
 println(limiterR-1);
 } //boolButton
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

int randFoo(){
  newRand = int(random(1,16));
  if(!listRand.contains(newRand) )  listRand.add(newRand );
    else newRand=randFoo();
    return newRand;
}

void keyPressed() {
 if(pivot==moduleSize && listL.size()==1 && listL.get(listL.size()-1)==1) listL.append(9);
  if(listL.size()==0) return;
  
   tempR= listL.get(listL.size()-1); 
   limiterR=listL.pop();
 if(listL.size()>1)   pivot= listL.get(listL.size()-1);
 else{
    limiterR=tempR;
   if(listL.size()==1) pivot= listL.get(listL.size()-1);
   if(listL.size()==0) return;
    } 
edgeFlag=true;
}


void Foo() {
   if(pivot==moduleSize && listL.size()==1 && listL.get(listL.size()-1)==1) listL.append(9);
  if(listL.size()==0) return;
   tempR= listL.get(listL.size()-1); 
   limiterR=listL.pop();
 if(listL.size()>1)   pivot= listL.get(listL.size()-1);
 else{
    limiterR=tempR;
   if(listL.size()==1) pivot= listL.get(listL.size()-1);
   if(listL.size()==0) return;
    } 
edgeFlag=true;
}
