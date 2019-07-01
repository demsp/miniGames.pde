int[] listL;
int[] listR;

int halfTemp;
boolean trigger;
int triggerTempL;
int triggerTempR;

int moduleSize = 8;
int limiterL = 1;
int limiterR = moduleSize;
int incPaddle=1;

 int vTemp;
//button
int buttonX=25, buttonY=325; 
int buttonSize = 50;     
boolean boolButton = false;

int counter;
Module[] mods;

void setup() {
	 size(400, 400);
 listL = new int[0];
 listR = new int[0]; 
   listL = append(listL,1);
   listR = append(listR,5);
 mods = new Module[moduleSize];
 
 mods[0] = new Module(1*30,  80);
 mods[1] = new Module(2*30,  20);
 mods[2] = new Module(3*30,  30);
 mods[3] = new Module(4*30,  50);
 mods[4] = new Module(5*30,  40);
 mods[5] = new Module(6*30,  60);
 mods[6] = new Module(7*30,  70);
 mods[7] = new Module(8*30,  10);
}




void draw() 
{
	background(50);
   buttonUpdate();
	   for (Module mod : mods) {  mod.display();  }
// paddles	
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
//	println(trigger);
}
// #######################
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
//###############################
 void mousePressed() { 
  if(boolButton) {  
  counter++;  		
  //sort1(limiterL, 34, 200, 10);		
   sort(limiterL,limiterR);		
  }
}
void sort(int L,int R){
 if(!trigger) {
 triggerTempL=L;
 triggerTempR=R;
 //halfTemp = round(triggerTempL+triggerTempR)/2;
	 halfTemp =  round( (triggerTempL+triggerTempR)/2 )-1;
  trigger=true;
  }
	if(mods[L-1].rectHight > mods[R-1].rectHight )  
    {     
     vTemp= mods[L-1].rectHight;
     mods[L-1].rectHight=mods[R-1].rectHight;
     mods[R-1].rectHight=vTemp;    
    }
	
	if(mods[L-1].rectHight<mods[halfTemp-1].rectHight && L<=halfTemp ) L++; 
          limiterL=L;
 if(mods[halfTemp-1].rectHight<mods[R-1].rectHight && R>=halfTemp ) R--; 
          limiterR=R;  
/*
if(listL.length>1){  listL=shorten(listL);    listR=shorten(listR);  } */
	
	if(L==R){
  //***//if(listL.size()!=0) {limiterL=listL.pop(); limiterR=listR.pop(); }
	//if(listL.length>2) { limiterL=shorten(listL); limiterR=shorten(listR); } 

  // if(listL!=null) { limiterL=shorten(listL); limiterR=shorten(listR); } 		
		if(listL.length>1) { limiterL=shorten(listL); limiterR=shorten(listR); } 		
	
//	trigger=false;  
//	listL=append(listL,triggerTempL);
//  listR=append(listR,halfTemp);
		
 // listL=append(listL,halfTemp+1);
 // listR=append(listR,triggerTempR);
 }

} // sort end	


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
