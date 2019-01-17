int unit = 15;
int count;
PFont f;              
Module[] mods;
PImage img;
void setup() {
    size(1000, 1500);
   stroke(10);
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
  for (Module mod : mods) {
    mod.mouseClicke();
  mod.update();
  }
}
class Module {
  int xO;
  int yO;
 int k=0;
  // Contructor
  Module(int xOT, int yOT){
    xO = xOT;
    yO = yOT;
  }
  // Custom method for drawing the object
  void mouseClicke() {
    
   if (mouseX >= xO && mouseX <= xO+25 && 
      mouseY >= yO && mouseY <= yO+25) {
   if (mousePressed && (mouseButton == LEFT)) {
    k=k+10; if(k>255) k=255;  } 
          }
   
}
 void update() {
  fill(k);
  rect(xO, yO, 25, 25); 
  
  }
}
   
