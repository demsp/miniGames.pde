PrintWriter textFile;
//Color 30, 200 
// list
IntList listOfCoordinateX;
IntList listOfCoordinateY;
//IntList
IntList listX;
IntList listY;
//buttons
int buttonY;
int LbuttonX=25;       // Position of square button
int RbuttonX=125;       // Position of square button

int buttonSize = 50;     // Diameter of square button
boolean bool_Lbutton = false;
boolean bool_Rbutton = false;
//mouse
boolean boolMouseReleased;
// jump to rect center on mouse release
float storX;
float storY;
// Knight cootdinates 
float bx;
float by;
// size of canvas 
int edgeOfCanvas=700;
int boxSize = 100;
boolean overKnight = false;
boolean locked = false;
float xOffset = 0.0; 
float yOffset = 0.0; 
//######################
int unit = 100; // -> width / unit;
int unitSize=100; 
int count;
         
Module[] mods;

void setup() {
  textFile = createWriter("files/Coordinates.txt");
size(700, 800);
 bx = 0;
  by = 0;
   buttonY=edgeOfCanvas+25;
   rectMode(CORNER);
//  //  //  //  //  //  //
 listOfCoordinateX = new IntList();
 listOfCoordinateY = new IntList();
 listX = new IntList();
 listY = new IntList();
// listOfCoordinateX.append(0);
// color of square net 
 stroke(100);
 // Create square fields
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
  LbuttonUpdate();
  RbuttonUpdate();
  //For-loop of class members
  for (Module mod : mods) {
    mod.mouseClick();
     mod.update();
      mod.KnightReturn();
  }
 // Test if the cursor is over the box 
 if (mouseX > bx && mouseX < bx+boxSize && 
      mouseY > by && mouseY < by+boxSize) {
    overKnight = true;  
  } else {
     overKnight = false;  
     }        
 //  fill first Unit      
 fill(200);
  rect(0,0,100,100);
 // draw Knight
  rect(bx, by, boxSize, boxSize);
  fill(50);
  ellipse(bx+50,by+50,20,20);
  // draw Rbutton
  rect(RbuttonX,buttonY,buttonSize,buttonSize);
   if(bool_Rbutton && mousePressed){ 
   textFile.flush(); textFile.close(); exit();  
   } 
  // draw Lbutton
  rect(LbuttonX,buttonY,buttonSize,buttonSize);
  if(bool_Lbutton && mousePressed) { fill(200);
  rect(LbuttonX,buttonY,buttonSize,buttonSize); }
 //  println(bool_Rbutton);
 // println(mousePressed);
  }
//  //  //  //  //  //
//       Class      //
//  //  //  //  //  //

class Module {
  int xUnit;
  int yUnit;
 int colorOfUnit=30;
  // Contructor
  Module(int xUnitT, int yUnitT){
    xUnit = xUnitT;
    yUnit = yUnitT;
  }
  // Custom method for drawing the object
  void mouseClick() {
  if (mouseX >= xUnit && mouseX <= xUnit+100 && 
      mouseY >= yUnit && mouseY <= yUnit+100) {
   if (overKnight && mousePressed && (mouseButton == LEFT)) {
    storX=xUnit;
    storY=yUnit; 
    if(boolMouseReleased ) {colorOfUnit=200;} 
            }
       }
  }
  void KnightReturn(){
    if(bool_Lbutton&& mousePressed){
    if(listOfCoordinateX.size()!=0){
   if(int(xUnit)==listOfCoordinateX.get(listOfCoordinateX.size()-1) &&  
    int(yUnit)==listOfCoordinateY.get(listOfCoordinateY.size()-1) )   
      {colorOfUnit=30;} 
    } 
   }
  }
 void update() {
   fill(colorOfUnit);
    rect(xUnit, yUnit, unitSize, unitSize); 
   }
  }
//########################
//########################
void mousePressed() {
  if(overKnight) { 
    locked = true; 
     listOfCoordinateX.append(int(bx));
      listOfCoordinateY.append(int(by));  
       listX.append(int(bx/100+1));
        listY.append(int(by/100+1));
  } else {
    locked = false;
   }
  xOffset = mouseX-bx; 
  yOffset = mouseY-by; 
}
void mouseDragged() {
  if(locked) {
    boolMouseReleased=false;
    bx = mouseX-xOffset; 
    by = mouseY-yOffset; 
  }
}
void mouseReleased() {
  boolMouseReleased=true;
  locked = false;
  if(!bool_Lbutton){
  bx=storX;
  by=storY; }
 else if(bool_Lbutton){
   //if list not emty
  if(listOfCoordinateX.size()!=0){
   bx=listOfCoordinateX.get(listOfCoordinateX.size()-1);
   by=listOfCoordinateY.get(listOfCoordinateY.size()-1);
   
   /// remove last element of list
       listOfCoordinateX.remove(listOfCoordinateX.size()-1);
       listOfCoordinateY.remove(listOfCoordinateY.size()-1);
         listX.remove(listOfCoordinateX.size());
         listY.remove(listOfCoordinateY.size());
        }
     }
   //println(listOfCoordinateX);
   //println(listOfCoordinateY);
   println(listX);
   println(listY);
   println(); 
   textFile.println( listX );
   textFile.println( listY );
   textFile.println();
  
}
// Lbutton
 void LbuttonUpdate() {
  if ( overButton(LbuttonX, buttonY, buttonSize, buttonSize) ) {
    bool_Lbutton = true;
  } else {
   bool_Lbutton = false;
  }
}
 void RbuttonUpdate() {
  if ( overButton(RbuttonX, buttonY, buttonSize, buttonSize) ) {
    bool_Rbutton = true;
  } else {
   bool_Rbutton = false;
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
