int counter;
int moduleSize = 10;
// floatingStoper
int floatingStoper = moduleSize;

// paddle
//int paddleX= 30;
int incPaddle=1;

 int vTemp;

//button
int buttonX=25, buttonY=325; 
int buttonSize = 50;     
boolean boolButton = false;

//int unit = 40;
int count;
Module[] mods;

void setup() {
  size(400, 400);
  mods = new Module[moduleSize];
  mods[0] = new Module(1*30,  100);
 mods[1] = new Module(2*30,  50);
 mods[2] = new Module(3*30,  30);
 mods[3] = new Module(4*30,  60);
 mods[4] = new Module(5*30,  20);
 mods[5] = new Module(6*30,  40);
 mods[6] = new Module(7*30,  80);
 mods[7] = new Module(8*30,  70);
 mods[8] = new Module(9*30,  90);
 mods[9] = new Module(10*30, 10);  
  }

void draw() { 
  background(50);
     buttonUpdate();  
  for (Module mod : mods) {  mod.display();  }
  
   // paddle
  rect (incPaddle*30, 85, 20, 5);
  //paddleX = incPaddle*30;
  //floatingStoper
  rect (floatingStoper*30, 75, 20, 5);
  
  textSize(25);
  text(counter,300,300);
  // draw button
  fill(150);
  rect(buttonX,buttonY,buttonSize,buttonSize);
   if(boolButton && mousePressed)  
  { 
    fill(200);
    rect(buttonX,buttonY,buttonSize,buttonSize);
   } 
//println(boolButton); 
//println(inc);
}


class Module {
 int xOffset; 
  int rectHight;
  
// Contructor
   Module(int xOffsetTemp, int rectHightTemp) {
    xOffset = xOffsetTemp;  
    rectHight=rectHightTemp;
  }  
  
  //void update() {  }  
 
  // Custom method for drawing the object
  void display() {
    fill(255);
     rect(xOffset , 100, 20, rectHight);
   }
}

// button
void mouseReleased() {
//void mousePressed() { 
 if(boolButton)
  {
   incPaddle++;
   if(incPaddle>=floatingStoper) 
   { 
    incPaddle=1;
    floatingStoper--;
    if(floatingStoper<1) floatingStoper=1; 
    // в правой половине получаем отсортированный массив
    //if(floatingStoper<moduleSize/2+1) floatingStoper=1; 
}
  }   
 }
 
 void mousePressed() {
 //void mouseReleased() {
 if(boolButton)
 {  
 counter++; 
  if(mods[incPaddle].rectHight < mods[incPaddle-1].rectHight)  
    {     
     vTemp= mods[incPaddle-1].rectHight;
     mods[incPaddle-1].rectHight=mods[incPaddle].rectHight;
     mods[incPaddle].rectHight=vTemp;
    }
  }
  print(incPaddle-1);
   print(" ");
   print(incPaddle);
   println();
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
