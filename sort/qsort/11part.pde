IntList listL;
IntList listR;
ArrayList listRand;
int pivotTemp;
int tempR;
boolean trigger;
//int max;
int newRand;

boolean flag,flag1;
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
 //*/
 /*
 mods[0] = new Module(1*30,  30);
 mods[1] = new Module(2*30,  70);
 mods[2] = new Module(3*30,  80);
 mods[3] = new Module(4*30,  20);
 mods[4] = new Module(5*30,  40);
 mods[5] = new Module(6*30,  60);
 mods[6] = new Module(7*30,  50);
 mods[7] = new Module(8*30,  10);
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
// button
void mouseReleased() {
 if(boolButton)
 {
   if(!flag) limiterR--;
   if(flag)  {
  // pivot=slider;  
  // slider=pivot+1;
  pivot++;
   flag=false;
    } 
   
  }
}
 
 void mousePressed() { 
 if(boolButton)
 {
 counter++; 
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
    flag=true;
    }
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
  newRand = int(random(1,11));
  if(!listRand.contains(newRand) )  listRand.add(newRand );
    else newRand=randFoo();
    return newRand;
}
