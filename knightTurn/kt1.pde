float bx;
float by;
int boxSize = 100;
boolean overBox = false;
boolean locked = false;
float xOffset = 0.0; 
float yOffset = 0.0; 
int unit = 100; // -> width / unit;
int unitSize=100; 
int count;
         
Module[] mods;

void setup() {
size(500, 500);
 bx = width/2.0;
  by = height/2.0;
  rectMode(CORNER);
  //rectMode(CORNERS);
   // rectMode(CENTER);
    //  rectMode(RADIUS);  
 stroke(100);
 
 int wideCount = width / unit;
  int highCount = height / unit;
  count = wideCount * highCount;
  mods = new Module[count];
  int index = 0;
  for (int y = 0; y < highCount; y++) {
    for (int x = 0; x < wideCount; x++) {
      mods[index++] = new Module(x*unit, y*unit);
    }
  }
}
void draw() {
  background(0);
//       //       //
  for (Module mod : mods) {
    mod.mouseClick();
     mod.update();
  }
 //      //       //
 // Test if the cursor is over the box 
  if (mouseX > bx-boxSize && mouseX < bx+boxSize && 
      mouseY > by-boxSize && mouseY < by+boxSize) {
    overBox = true;  
  } else {    overBox = false;  }
  // Draw the box
  rect(bx, by, boxSize, boxSize);
}
//  //  //  //  //
//     Class    //
//  //  //  //  //
class Module {
  int xO;
  int yO;
 int modColor=0;
  // Contructor
  Module(int xOT, int yOT){
    xO = xOT;
    yO = yOT;
  }
  // Custom method for drawing the object
  void mouseClick() {
    
   if (mouseX >= xO && mouseX <= xO+100 && 
      mouseY >= yO && mouseY <= yO+100) {
   if (mousePressed && (mouseButton == LEFT)) {
      modColor  =200;  
      } 
     }
   }
 void update() {
  fill(modColor);
  rect(xO, yO, unitSize, unitSize);  
  }
}

//  //  //  //  //  
void mousePressed() {
  if(overBox) { 
    locked = true; 
    fill(255, 255, 255);
  } else {
    locked = false;
  }
  xOffset = mouseX-bx; 
  yOffset = mouseY-by; 

}

void mouseDragged() {
  if(locked) {
    bx = mouseX-xOffset; 
    by = mouseY-yOffset; 
  }
}

void mouseReleased() {
  locked = false;
}
