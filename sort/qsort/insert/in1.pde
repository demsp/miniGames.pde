ArrayList listRand;
int newRand;


int tempStor;
boolean trigger;
IntList _list;

boolean flagIverson=true;
boolean flag=false;


int counter;
int moduleSize = 15;
int limR=moduleSize, limL=1;

int pivot = 1;
int slider=1;

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
 listRand=new ArrayList();
 
 //*
//mods[0] = new Module(1*30,  10);
 mods[0] = new Module(1*30,  randFoo()*10);
 mods[1] = new Module(2*30,  randFoo()*10);
 mods[2] = new Module(3*30,  randFoo()*10);
 mods[3] = new Module(4*30,  randFoo()*10);
 mods[4] = new Module(5*30,  randFoo()*10);
 mods[5] = new Module(6*30,  randFoo()*10);
 mods[6] = new Module(7*30,  randFoo()*10);
 mods[7] = new Module(8*30,  randFoo()*10);
 mods[8] = new Module(9*30,  randFoo()*10);
 mods[9] = new Module(10*30, randFoo()*10);
 mods[10] = new Module(11*30,  randFoo()*10);
 mods[11] = new Module(12*30,  randFoo()*10);
 mods[12] = new Module(13*30,  randFoo()*10);
 mods[13] = new Module(14*30,  randFoo()*10);
 mods[14] = new Module(15*30, randFoo()*10);
 
 
 //*/
 /*
 mods[0] = new Module(1*30,  50);
 mods[1] = new Module(2*30,  70);
 mods[2] = new Module(3*30,  10);
 mods[3] = new Module(4*30,  20);
 mods[4] = new Module(5*30,  30);
 mods[5] = new Module(6*30,  60);
 mods[6] = new Module(7*30,  80);
 mods[7] = new Module(8*30,  100);
 mods[8] = new Module(9*30,  90);
 mods[9] = new Module(10*30, 40);
 //*/
}

void draw() { 
  background(50);
   buttonUpdate();  
   for (Module mod : mods) {  mod.display();  }
  
   // paddle
  rect (limL*30, 55, 20, 5);  
  rect (limR*30, 65, 20, 5);
  rect (pivot*30, 75, 20, 5);
  rect (slider*30, 85, 20, 5);
  
  
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
void mouseReleased() {
 if(boolButton)
 {
 // the End
 if(pivot==1 && limR==1){pivot=1; limR=1;slider=1; return;}
   
   if(limR<pivot)  // without flagIverson
    {
    limR=pivot;
    pivot=1;
    slider=1;
    }
   //****************
 if(!flag) if(slider<limR) slider++; 
          
  if(flag){ 
           slider--;
           if(slider<pivot){ 
                           flag=false; 
                           pivot++; 
                           slider=pivot;
                           }
           }
  
 if(slider==pivot-1 &&
     mods[slider-1].rectHight<mods[pivot-1].rectHight){
   flag=false;            
   slider=pivot;
   } 
 if(slider<moduleSize)if(mods[slider-1].rectHight > mods[slider].rectHight)
       { flagIverson=false;
        vTemp= mods[slider-1].rectHight;
        mods[slider-1].rectHight=mods[slider].rectHight;
        mods[slider].rectHight=vTemp;  }   
   //println(flagIverson);
   println(flag);
   } /// 
}///
 
 void mousePressed() { 
 if(boolButton)
 {  
 counter++; 
 // the End
 if(pivot==1 && limR==1){pivot=1; limR=1;slider=1; return;}
 //**************
   if(slider<limR)
    if(mods[slider-1].rectHight < mods[pivot-1].rectHight)
       { flag=true;
        vTemp= mods[slider-1].rectHight;
        mods[slider-1].rectHight=mods[slider-2].rectHight;
        mods[slider-2].rectHight=vTemp;  }
 // if()
   if(slider==limR) 
   {
    if(!flag) pivot++; 
    if(flagIverson){ limR=pivot; pivot=1;slider=pivot; }  
    else if(!flagIverson){  slider=pivot;limR--; flagIverson=true;} 
  
    }     
  }///
}///

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



//**************
int randFoo(){
  newRand = int(random(1,16)); //
  if(!listRand.contains(newRand) )  listRand.add(newRand );
    else newRand=randFoo();
    return newRand;
}
