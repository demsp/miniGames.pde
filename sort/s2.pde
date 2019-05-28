int unit = 40;
int count;
Module[] mods;

void setup() {
  size(640, 360);
  noStroke();
 // int wideCount = width / unit;
  int wideCount = 10;
//  int highCount = height / unit;
//  count = wideCount * highCount;
  count = wideCount ;
  mods = new Module[10];

  int index = 0;
//  int x=0;
 // for (int y = 0; y < highCount; y++) {
    for (int x = 0; x < 10; x++) {
    //  mods[index++] = new Module(x*unit, y*unit, unit/2, unit/2, random(0.05, 0.8), unit);
      
       // mods[index++] = new Module(x*unit,  40/2,  random(0.05, 0.8), 40);
          mods[index++] = new Module(x*unit,  20,  random(0.05, 0.8));
         // mods[1] = new Module(x*unit,  unit/2,  random(0.05, 0.8), unit);
         // mods[2] = new Module(x*20*unit,  unit/2,  random(0.05, 0.8), unit);
         // mods[3] = new Module(x*30*unit,  unit/2,  random(0.05, 0.8), unit);          
    }
  //}
}

void draw() {
  background(0);
  for (Module mod : mods) {
    mod.update();
    mod.display();
  }
}


class Module {
  int xOffset;
 // int yOffset;
  float x, y;
//  int unit;
  int xDirection = 1;
 // int yDirection = 1;
  float speed; 
  
  // Contructor
 // Module(int xOffsetTemp, int yOffsetTemp, int xTemp, int yTemp, float speedTemp, int tempUnit) {
 //Module(int xOffsetTemp, int xTemp, float speedTemp, int tempUnit) {
   Module(int xOffsetTemp, int xTemp, float speedTemp) {
    xOffset = xOffsetTemp;
    //yOffset = yOffsetTemp;
    x = xTemp;
    //y = yTemp;
    speed = speedTemp;
    //unit = tempUnit;
  }
  
  // Custom method for updating the variables
  void update() {
    x = x + (speed * xDirection);
    if (x >= 40 || x <= 0) {
      xDirection *= -1;
      x = x + (1 * xDirection);
      //y = y + (1 * yDirection);
    }
    /*
    if (y >= unit || y <= 0) {
      yDirection *= -1;
      y = y + (1 * yDirection);
    }
    */
  }
  
  // Custom method for drawing the object
  void display() {
    fill(255);
    // ellipse(xOffset + x, yOffset + y, 6, 6);
     //ellipse(xOffset + x, 100, 6, 6);
      rect(xOffset + x, 100, 6, 6);
  }
}
