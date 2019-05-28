int unit = 40;
int count;
Module[] mods;

void setup() {
  size(640, 360);
  noStroke(); 
  mods = new Module[5];

//  int index = 0;
  /*
    for (int x = 0; x < 5; x++) {
     mods[index++] = new Module(x*unit,  20,  random(0.05, 0.8));
    }
    */
    
  //mods[0] = new Module(x*40,  20,  random(0.05, 0.8));
  mods[0] = new Module(0,  20,  int(random(0, 5)), 10);
  mods[1] = new Module(40,  20,  int(random(0, 5)), 20);
  mods[2] = new Module(80,  20,  int(random(0, 5)), 70);
  mods[3] = new Module(120,  20,  int(random(0, 5)), 40);
  mods[4] = new Module(160,  20,  int(random(0, 5)), 50);
  }

void draw() {
  frameRate(1);
  background(50);
  for (Module mod : mods) {
    mod.update();
    mod.display();
   // if (mod.rectHight>50){    println(mod.rectHight);  }
    
  }
  int vTemp;
  for (int i = 1; i < 5; i = i+1) 
  {
  if(mods[i].rectHight > mods[i-1].rectHight)
  println(i);
   {
   vTemp= mods[i-1].xOffset;
   mods[i-1].xOffset=mods[i].xOffset;
   mods[i].xOffset=vTemp;
   }
   // { 
  //println(mods[i].x); 
    // }
  }
  
}


class Module {
  int xOffset;
 // float x;
 int x;
  int rectHight;
  int xDirection = 1;
 // float speed;
 int speed;
  
// Contructor
 // Module(int xOffsetTemp, int yOffsetTemp, int xTemp, int yTemp, float speedTemp, int tempUnit) {
 //Module(int xOffsetTemp, int xTemp, float speedTemp, int tempUnit) {
   Module(int xOffsetTemp, int xTemp, int speedTemp, int rectHightTemp) {
    xOffset = xOffsetTemp;
     x = xTemp;   
    speed = speedTemp;
    //unit = tempUnit;
    rectHight=rectHightTemp;
  }  
  // Custom method for updating the variables
  void update() {
    x = x + (speed * xDirection);
    if (x >= 40 || x <= 0) {
      xDirection *= -1;
      x = x + (1 * xDirection);      
    }   
  }  
  // Custom method for drawing the object
  void display() {
    fill(255);
    // ellipse(xOffset + x, 100, 6, 6);
      //rect(xOffset + x, 100, 6, rectHight);
      rect(xOffset , 100, 6, rectHight);
  }
}
