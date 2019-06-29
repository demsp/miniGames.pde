int iGlob,jGlob;
boolean Gflag;
boolean flag;

int index;
int counter;
//int moduleSize = 8;
int moduleSize = 6;
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
 //mods[8] = new Module(9*30,  90);
 //mods[9] = new Module(10*30, 100);
 /*
 mods[0] = new Module(1*30,  30); //40
 mods[1] = new Module(2*30,  10);
 mods[2] = new Module(3*30,  20);
 mods[3] = new Module(4*30,  40); //30
 mods[4] = new Module(5*30,  50);
 mods[5] = new Module(6*30,  60);
 */
 
 mods[0] = new Module(1*30,  20); //40
 mods[1] = new Module(2*30,  30);
 mods[2] = new Module(3*30,  40);
 mods[3] = new Module(4*30,  50); //30
 mods[4] = new Module(5*30,  60);
 mods[5] = new Module(6*30,  10);
 
 /*
 mods[0] = new Module(1*30,  40); //40
 mods[1] = new Module(2*30,  10);
 mods[2] = new Module(3*30,  30);
 mods[3] = new Module(4*30,  20);
 mods[4] = new Module(5*30,  50);
 mods[5] = new Module(6*30,  60);
 */
 /*
 mods[0] = new Module(1*30,  10);
 mods[1] = new Module(2*30,  20);
 mods[2] = new Module(3*30,  30);
 mods[3] = new Module(4*30,  50);
 mods[4] = new Module(5*30,  40);
 mods[5] = new Module(6*30,  60);
 mods[6] = new Module(7*30,  70);
 mods[7] = new Module(8*30,  80);
 */
 /*
 mods[0] = new Module(1*30,  10);
 mods[1] = new Module(2*30,  80);
 mods[2] = new Module(3*30,  30);
 mods[3] = new Module(4*30,  50);
 mods[4] = new Module(5*30,  40);
 mods[5] = new Module(6*30,  60);
 mods[6] = new Module(7*30,  70);
 mods[7] = new Module(8*30,  20);
 */
  /*
 mods[0] = new Module(1*30,  80);
 mods[1] = new Module(2*30,  20);
 mods[2] = new Module(3*30,  30);
 mods[3] = new Module(4*30,  40);
 mods[4] = new Module(5*30,  50);
 mods[5] = new Module(6*30,  60);
 mods[6] = new Module(7*30,  70);
 mods[7] = new Module(8*30,  10);
 */
 /*
 mods[0] = new Module(1*30,  10);
 mods[1] = new Module(2*30,  80);
 mods[2] = new Module(3*30,  30);
 mods[3] = new Module(4*30,  40);
 mods[4] = new Module(5*30,  50);
 mods[5] = new Module(6*30,  60);
 mods[6] = new Module(7*30,  70);
 mods[7] = new Module(8*30,  20);
   */
 /* 
 mods[0] = new Module(1*30,  70);
 mods[1] = new Module(2*30,  20);
 mods[2] = new Module(3*30,  30);
 mods[3] = new Module(4*30,  40);
 mods[4] = new Module(5*30,  50);
 mods[5] = new Module(6*30,  60);
 mods[6] = new Module(7*30,  10);
 mods[7] = new Module(8*30,  80);
 */
/* 
 mods[0] = new Module(1*30,  80);
 mods[1] = new Module(2*30,  60);
 mods[2] = new Module(3*30,  30);
 mods[3] = new Module(4*30,  40);
 mods[4] = new Module(5*30,  50);
 mods[5] = new Module(6*30,  20);
 mods[6] = new Module(7*30,  70);
 mods[7] = new Module(8*30,  10);
 */
}

void draw() { 
//  frameRate(10); 
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

void mouseReleased() { println("released");
 if(boolButton)  { if(flag)flag=false; }   
 }
void mousePressed() { 
 if(boolButton)
 {  
 counter++;
 // int tempL, tempR;
 // tempL=limiterL;
 // tempR=limiterR;
sorted(limiterL,limiterR);

  }
}

void sorted(int l, int r){
  int i,j;
  int vTemp, vHalf;
  println("call l=",l);
  println("call r=",r);
  i=l-1;j=r-1;
  if(!Gflag){iGlob=l;jGlob=r; Gflag=true;}
  
  vHalf=mods[round( (iGlob+jGlob)/2 )-1].rectHight;
  println(vHalf);
 
 // // // while(i<j){
 if(mods[i].rectHight<vHalf && vHalf<mods[j].rectHight ) 
{ println("i1=",l); l++;  
   if(!flag){ r--; println("r1=",r);flag=true;}
}  
else if(mods[i].rectHight<vHalf && vHalf>mods[j].rectHight) 
 { println("l1=",l); l++;  }      
else if(mods[i].rectHight>vHalf && vHalf<mods[j].rectHight)
{if(!flag) { r--; println("r1=",r);flag=true;} }

 //else if (mods[i].rectHight>vHalf && vHalf>mods[j].rectHight)
 else if (mods[i].rectHight>vHalf && vHalf>mods[j].rectHight
 || mods[round( (iGlob+jGlob)/2 )-1].rectHight > mods[j].rectHight) 
 {
// // if(l <= r)
 // // {    
  vTemp=mods[i].rectHight; println("mods[i] = ", mods[i].rectHight); 
  println("mods[j] = ", mods[j].rectHight);  
  mods[i].rectHight=mods[j].rectHight; mods[j].rectHight=vTemp;
  for (int z=0;z<=moduleSize-1;z++) 
    {print(mods[z].rectHight); print(" "); }
     
   // if(mousePressed)  i++; println ("i2=",i);
   //   j--; println("j2=",j);   
   // //}
 }  
// // // }

limiterL=l;  // l
limiterR=r;  // r
println();
println("iGlob=",iGlob);
println("jGlob=",jGlob);

if(l==round( (iGlob+jGlob)/2 )   ) {  // if(pflag) 
 sorted(iGlob,round( (iGlob+jGlob)/2 )); 
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
