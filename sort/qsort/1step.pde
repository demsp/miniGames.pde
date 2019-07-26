IntList listL, listR;
ArrayList listRand;
int newRand;
//   boolean flag;
boolean _flag;
boolean trigger;
int tempL;
int tempR;

boolean flag;

int counter,counter1;
int moduleSize = 8;
int pivot = 1;
int limiterR = moduleSize;
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
 listRand = new ArrayList(10); 
 listL= new IntList();
 listR= new IntList();
  
 mods = new Module[moduleSize];
  mods[0] = new Module(1*30,  randFoo()*10 );
 mods[1] = new Module(2*30,  randFoo()*10 );
 mods[2] = new Module(3*30,  randFoo()*10 );
 mods[3] = new Module(4*30,  randFoo()*10 );
 mods[4] = new Module(5*30,  randFoo()*10 );
 mods[5] = new Module(6*30,  randFoo()*10 );
 mods[6] = new Module(7*30,  randFoo()*10 );
 mods[7] = new Module(8*30,  randFoo()*10 );
 
 
 /*
 mods[0] = new Module(1*30,  40);
 mods[1] = new Module(2*30,  10);
 mods[2] = new Module(3*30,  30);
 mods[3] = new Module(4*30,  50);
 mods[4] = new Module(5*30,  20);
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
*/
}

void draw() { 
  background(50);
   buttonUpdate();  
   for (Module mod : mods) {  mod.display();  }
  
   // paddle
  rect ( (pivot+1)*30, 85, 20, 5);
  rect (pivot*30, 85, 20, 5);
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

void mouseReleased() {
 if(boolButton)
 {
   if(pivot<limiterR)
  { 
   if(!flag) limiterR--;
   if(flag)  {
  // pivot=slider;  
  // slider=pivot+1;
  pivot++;
   flag=false;
    } 
  }//end if
  }
  
  if(_flag) {sort(pivot,tempR); trigger=false;_flag=false; }
println(listL);
println(listR);  
  
}  //end
 
 void mousePressed() { 
 if(boolButton)
 {  
 counter++;  
 if(!_flag) 
  sort(pivot,limiterR);

//sort();

  }
}

//void sort(){
void sort(int L,int R){
   pivot=L;
  limiterR=R;
  
 if(!trigger) {
 tempL=L;
//tempR=R-counter1;
 tempR=R;
 counter1++;
  println("*");
 println("trigger ",trigger);
 trigger=true;}
  
 //              //              //
// if(L<moduleSize)
if(mods[pivot-1].rectHight<mods[pivot].rectHight 
   && mods[pivot].rectHight<mods[limiterR-1].rectHight) return;
//if(L==R) {
else{
 if(mods[L].rectHight > mods[L-1].rectHight )
  {
    vTemp= mods[L].rectHight;
    mods[L].rectHight=mods[R-1].rectHight;
    mods[R-1].rectHight=vTemp;
  
    }
 if(mods[L].rectHight < mods[L-1].rectHight)
  {
    vTemp= mods[L].rectHight;
    mods[L].rectHight=mods[L-1].rectHight;
    mods[L-1].rectHight=vTemp;
    flag=true;
    }
} //end else   
//} //end if   
  L=pivot;
  R=limiterR;
  println(tempL);
  println(tempR);
  
  if(L==R-1)
  {
  listL.append(tempL);  
  listR.append(L);
 // _flag=true;
  
  }
  if(L==R) _flag=true;
} //end


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


//\\\\\
//\\\\\\\
/////////
////////
///////
//////
/////
////
///
//
void keyPressed() {
  println("**");
  println(listL);
  println(listR);
 
 if(listL.size()==0){return;} 
 if(listL.get(listL.size()-1)>=listR.get(listR.size()-1)) 
 {
 listL.pop();
 listR.pop();
 }
 else{
 pivot=listL.pop();
 limiterR=listR.pop();
 //limiterR--;
 println(listL);
 println(listR);
 println("***");
 sort(pivot,limiterR);
 }
 
}
