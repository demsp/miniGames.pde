// list
IntList listOfCoordinateX;
IntList listOfCoordinateY;
//button
int buttonX=25, buttonY; 
int buttonSize = 50;    
boolean buttonOver = false;
//mouse
boolean bool_mouseReleased;
// jump to rect center on mouse release
float storX;
float storY;
// Knight cootdinates 
float knightX;
float knightY;
// size of canvas 
int edgeOfCanvas=500;
int knightSize = 100;
boolean overKnight = false;
boolean locked = false;
float xOffset = 0.0; 
float yOffset = 0.0;
int unit = 100; // -> width / unit;
int unitSize=100; 
int count;
         
Module[] mods;

void setup() {
size(500, 600);
  knightX = 0;
  knightY = 0;
   buttonY=edgeOfCanvas+25;
   rectMode(CORNER);
 listOfCoordinateX = new IntList();
 listOfCoordinateY = new IntList();
stroke(100); //color of the net of edges
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
  for (Module mod : mods) {
     mod.mouseClick();
     mod.update();
     mod.KnightReturn();
  }
 // Test if the cursor is over the box 
 if (mouseX > knightX && mouseX < knightX+knightSize && 
      mouseY > knightY && mouseY < knightY+knightSize) {
    overKnight = true;  
  } else {
     overKnight = false;  
     }      
  fill(200);
  rect(0,0,100,100);
 // draw Knight
  rect(knightX, knightY, knightSize, knightSize);
  fill(50);
  ellipse(knightX+50,knightY+50,20,20);
  // draw button
  rect(buttonX,buttonY,buttonSize,buttonSize);
  if(buttonOver && mousePressed) { 
     fill(200);
     rect(buttonX,buttonY,buttonSize,buttonSize);  
     }
 }

class Module {
  int x;
  int y;
 int modColor=30;
  // Contructor
  Module(int xT, int yT){
    x = xT;
    y = yT;
  }
  // Custom method for drawing the object
  void mouseClick() {
  if (mouseX >= x && mouseX <= x+100 && 
      mouseY >= y && mouseY <= y+100) {
   if (overKnight && mousePressed && (mouseButton == LEFT)) {
    storX=x;
    storY=y; 
    if(bool_mouseReleased ) {modColor=200;} 
            }
       }
  }
  void KnightReturn(){
    if(buttonOver&& mousePressed){
    if(listOfCoordinateX.size()!=0){
   if(int(x)==listOfCoordinateX.get(listOfCoordinateX.size()-1) &&  
    int(y)==listOfCoordinateY.get(listOfCoordinateY.size()-1) )   
      {modColor=30;} } }
  }
 void update() {
   fill(modColor);
    rect(x, y, unitSize, unitSize); 
   }
}

void mousePressed() {
  if(overKnight) { 
    locked = true; 
     listOfCoordinateX.append(int(knightX));
     listOfCoordinateY.append(int(knightY));        
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
  if(!buttonOver){
  knightX=storX;
  knightY=storY; }
 else if(buttonOver){
   //if list not emty
  if(listOfCoordinateX.size()!=0){
   knightX=listOfCoordinateX.get(listOfCoordinateX.size()-1);
   knightY=listOfCoordinateY.get(listOfCoordinateY.size()-1);   
   /// remove last element of list
       listOfCoordinateX.remove(listOfCoordinateX.size()-1);
       listOfCoordinateY.remove(listOfCoordinateY.size()-1);         
        }
     }    
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
