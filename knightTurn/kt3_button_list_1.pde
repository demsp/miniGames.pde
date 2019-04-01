// list
IntList listOfCoordinateX;
IntList listOfCoordinateY;
int getX;
int getY;
//button
int buttonX=25, buttonY=525;      // Position of square button
int buttonSize = 50;     // Diameter of square button
boolean buttonOver = false;
//mouse
boolean mouseIndikator;
// jump to rect center on release
float storX;
float storY;

float bx;
float by;
// size of canvas 
int edgeOfCanvas=500;
int boxSize = 100;
boolean overBox = false;
boolean locked = false;
float xOffset = 0.0; 
float yOffset = 0.0; 
//######################
int unit = 100; // -> width / unit;
int unitSize=100; 
int count;
         
Module[] mods;

void setup() {
//size(500, 500);
size(600, 600);
 bx = 0;
  by = 0;
  rectMode(CORNER);
//###############
 listOfCoordinateX = new IntList();
 listOfCoordinateY = new IntList();
// listOfCoordinateX.append(0);
// listOfCoordinateY.append(0);
//###############
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
buttonUpdate();
  //####################
  for (Module mod : mods) {
    mod.mouseClicke();
     mod.update();
  }
 //#################3
 // Test if the cursor is over the box 
 fill(200);
  if (mouseX > bx && mouseX < bx+boxSize && 
      mouseY > by && mouseY < by+boxSize) {
    overBox = true;  
  } else {
     overBox = false;  
        }
 fill(255);
  rect(0,0,100,100);
 
  rect(bx, by, boxSize, boxSize);
  fill(50);
  ellipse(bx+50,by+50,20,20);
  // draw button
  rect(buttonX,buttonY,buttonSize,buttonSize);
  //println(buttonOver);
 }
//@@@@@@@@@@@@@@@@@@@@@@@
//@       Class        @@
//@@@@@@@@@@@@@@@@@@@@@@@

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
   /* 
   if (mouseX >= xO && mouseX <= xO+100 && 
      mouseY >= yO && mouseY <= yO+100) {
   if (overBox && mousePressed && (mouseButton == LEFT)) {
     k=k+1; if(k>255) k=255;
    storX=xO;
    storY=yO;
            } 
       }
     */  
    if (mouseX >= xO && mouseX <= xO+100 && 
      mouseY >= yO && mouseY <= yO+100) {
   if (overBox && mousePressed && (mouseButton == LEFT)) {
    storX=xO;
    storY=yO; 
    if(mouseIndikator ) {k=255;} 
            } 
       }
  }
 void update() {
  fill(k);
  rect(xO, yO, unitSize, unitSize); 
   }
}
//########################
//########################
void mousePressed() {
  if(overBox) { 
    locked = true; 
     listOfCoordinateX.append(int(bx));
      listOfCoordinateY.append(int(by));
      println(listOfCoordinateX);
      println(listOfCoordinateY);
      println();
  } else {
    locked = false;
   }
  xOffset = mouseX-bx; 
  yOffset = mouseY-by; 
}
void mouseDragged() {
  if(locked) {
    mouseIndikator=false;
    bx = mouseX-xOffset; 
    by = mouseY-yOffset; 
  }
}
void mouseReleased() {
  mouseIndikator=true;
  locked = false;
  if(!buttonOver){
  bx=storX;
  by=storY; }
 else if(buttonOver){
  bx=listOfCoordinateX.get(0);
  by=listOfCoordinateY.get(0);   }
}
// button
 void buttonUpdate() {
  if ( overButton(buttonX, buttonY, buttonSize, buttonSize) ) {
    buttonOver = true;
  } else {
   buttonOver = false;
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
