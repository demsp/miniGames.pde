int moduleSize=5;
 int vTemp;
// inc
int inc=1;

//button
int buttonX=25, buttonY=325; 
int buttonSize = 50;     
boolean boolButton = false;

int unit = 40;
int count;
Module[] mods;

void setup() {
 size(400, 400);
//  noStroke(); 
 mods = new Module[moduleSize];

 mods[0] = new Module(1*30,  100);
 mods[1] = new Module(2*30,  50);
 mods[2] = new Module(3*30,  30);
 mods[3] = new Module(4*30,  60);
 mods[4] = new Module(5*30,  20);
  }

void draw() {
//  frameRate(5);
  background(30);
     buttonUpdate();
  
  for (Module mod : mods){ mod.display();  }
 
  // draw button
  fill(50);
  rect(buttonX,buttonY,buttonSize,buttonSize);
   if(boolButton && mousePressed)
  // if(boolButton && bool_mouseReleased)
  { 
    fill(200);
    rect(buttonX,buttonY,buttonSize,buttonSize);
   }
//println(boolButton); 
//println(inc);
}


class Module {
  int xOffset;
 // float x;
 //int x;
  int rectHight;
  int xDirection = 1;
  
// Contructor 
   Module(int xOffsetTemp, int rectHightTemp) {  
    xOffset = xOffsetTemp;  
    rectHight=rectHightTemp;
  }  
  
 // void update() {  }  
  
  // Custom method for drawing the object
  void display() {
    fill(255);
   rect(xOffset , 100, 20, rectHight);
  }
}

// button
void mousePressed() { 
if(inc>4){inc=1;} 
   print(inc);
   println();
   print(mods[inc-1].rectHight);
   println();
   print(mods[inc].rectHight);
   println();
   println();
 }
 void mouseReleased() {
 if(mods[inc].rectHight < mods[inc-1].rectHight)  
    {     
     vTemp= mods[inc-1].rectHight;
     mods[inc-1].rectHight=mods[inc].rectHight;
     mods[inc].rectHight=vTemp;
    }
    inc++;
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
