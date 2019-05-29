 int vTemp;
// inc
int inc=1;
//button
int buttonX=25, buttonY=525; 
int buttonSize = 50;     
boolean boolButton = false;

int unit = 40;
int count;
Module[] mods;

void setup() {
  size(500, 600);
  noStroke(); 
  mods = new Module[5];

//  int index = 0;
  /*
    for (int x = 0; x < 5; x++) {
     mods[index++] = new Module(x*unit,  20,  random(0.05, 0.8));
    }
    */
    
  //mods[0] = new Module(x*40,  20,  random(0.05, 0.8));
  mods[0] = new Module(0, 20,  10);
  mods[1] = new Module(40, 20,  20);
  mods[2] = new Module(80, 20,  60);
  mods[3] = new Module(120, 20, 30);
  mods[4] = new Module(160, 20,  40);
  }

void draw() {
  frameRate(5);
  background(30);
     buttonUpdate();
  
  for (Module mod : mods) {
    mod.update();
    mod.display();
   // if (mod.rectHight>50){    println(mod.rectHight);  }
    
  }
 
  //for (int i = 1; i < 5; i = i+1) 
  //{
  /*
  if(inc>4){inc=4;} 
  if(mods[inc].rectHight < mods[inc-1].rectHight)  
    {
     vTemp= mods[inc-1].xOffset;
     mods[inc-1].xOffset=mods[inc].xOffset;
     mods[inc].xOffset=vTemp;
    }
 */   
  //}
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
 int x;
  int rectHight;
  int xDirection = 1;
 // float speed;
// int speed;
  
// Contructor
 // Module(int xOffsetTemp, int yOffsetTemp, int xTemp, int yTemp, float speedTemp, int tempUnit) {
 //Module(int xOffsetTemp, int xTemp, float speedTemp, int tempUnit) {
   Module(int xOffsetTemp, int xTemp, int rectHightTemp) {
    xOffset = xOffsetTemp;
     x = xTemp;   
    //speed = speedTemp;
    //unit = tempUnit;
    rectHight=rectHightTemp;
  }  
  // Custom method for updating the variables
  void update() {
    /*
    x = x + (speed * xDirection);
    if (x >= 40 || x <= 0) {
      xDirection *= -1;
      x = x + (1 * xDirection);      
    }
    */
  }  
  // Custom method for drawing the object
  void display() {
    fill(255);
    // ellipse(xOffset + x, 100, 6, 6);
      //rect(xOffset + x, 100, 6, rectHight);
      rect(xOffset , 100, 6, rectHight);
  }
}

// button
void mousePressed() { 
//bool_mouseReleased=false;
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
  
  if(mods[inc].rectHight > mods[inc-1].rectHight)  
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
