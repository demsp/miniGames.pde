// притягивание коня к центру клетки
// объявляем bool_mouseReleased; storX; storY;

boolean bool_mouseReleased;
float storX;
float storY;

float knightX;
float knightY;
// size of canvas 600*600
int edgeOfCanvas=600;
int knightSize = 100;
boolean overBox = false;
boolean locked = false;
float xOffset = 0.0; 
float yOffset = 0.0; 
int unit = 100; // -> width / unit;
int unitSize=100; 
int count;
         
Module[] mods;

void setup() {
size(600, 600);
 knightX = 0;
  knightY = 0;
  rectMode(CORNER);
 stroke(100);
 
 int wideCount = edgeOfCanvas / unit;
  int highCount = edgeOfCanvas / unit;
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
    mod.mouseClick();
     mod.update();
  }
 //      //       //       //
 // Test if the cursor is over the box 
 fill(200);
  if (mouseX > knightX && mouseX < knightX+knightSize && 
      mouseY > knightY && mouseY < knightY+knightSize) {
    overBox = true;  
  } else {
     overBox = false;  
        }
  fill(200);
  rect(0,0,100,100); 
  rect(knightX, knightY, knightSize, knightSize);
  fill(50);
  ellipse(knightX+50,knightY+50,20,20);
 }
 
 
class Module {
  int x;
  int y;
 int modColor=0;
  // Contructor
  Module(int xT, int yT){
    x = xT;
    y = yT;
  }
  // Custom method for drawing the object
  void mouseClick() {
   if ((mouseX >= x && mouseX <= x+100 && 
      mouseY >= y && mouseY <= y+100)&& 
    (overBox && mousePressed && (mouseButton == LEFT))) {
    storX=x;
    storY=y; 
    if(bool_mouseReleased ){ modColor=200; } 
            }        
  }
 void update() {
  fill(modColor);
  rect(x, y, unitSize, unitSize); 
   }
}

void mousePressed() {
  if(overBox) { 
    locked = true;   
  } else {
    locked = false;
  }
  xOffset = mouseX-knightX; 
  yOffset = mouseY-knightY; 
}
void mouseDragged() {
  if(locked) {
    bool_mouseReleased=false;
    knightX = mouseX-xOffset; 
    knightY = mouseY-yOffset; 
  }
}
void mouseReleased() {
  bool_mouseReleased=true;
  locked = false;
  knightX=storX;
  knightY=storY;
}
