boolean overField;
// list
IntList listOfCoordinatesX;
IntList listOfCoordinatesY;
//button
int buttonX=25, buttonY=525; 
int buttonSize = 50;     
boolean boolButton = false;
//  добавляем переменую для закрашивания 
boolean rightCell = false;
//mouse
boolean bool_mouseReleased;
// jump to rect center on button release
float storX;
float storY;

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
stroke(100);
  knightX = 0;
  knightY = 0;
rectMode(CORNER);  
 listOfCoordinatesX = new IntList();
 listOfCoordinatesY = new IntList(); 
 listOfCoordinatesX.append(0); 
 listOfCoordinatesY.append(0);
 
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
  }
 //      //      //      //      //      //     
 // Test if the cursor is over the box 
 fill(200);
  if (mouseX > knightX && mouseX < knightX+knightSize && 
      mouseY > knightY && mouseY < knightY+knightSize) {
    overKnight = true;  
  } else {
     overKnight = false;  
        }
 fill(200);
 rect(0,0,100,100); 
  rect(knightX, knightY, knightSize, knightSize);
  fill(50);
  ellipse(knightX+50,knightY+50,20,20);
  // draw button
  rect(buttonX,buttonY,buttonSize,buttonSize);
  if(boolButton && mousePressed) { fill(200);
   rect(buttonX,buttonY,buttonSize,buttonSize); }   
  //println();
  println(storX);
  println(storY);
  //println(boolButton);
  println(listOfCoordinatesX);
  println(listOfCoordinatesY);
  
  for (int i =0; i <listOfCoordinatesX.size()-1;i++)
    { 
     if ( storX==listOfCoordinatesX.get(i) && storY==listOfCoordinatesY.get(i) )
      { overField=true; }
    }
println("overField",overField); 
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
  void mouseClick() {
    if (mouseX >= x && mouseX <= x+100 && 
      mouseY >= y && mouseY <= y+100) {
   if (overKnight && mousePressed && (mouseButton == LEFT)) {
    storX=x;
    storY=y; 
 /* 
   if((x==200 && y== 100) || (y==200 && x== 100)){ // правильный ход
        storX=x;
        storY=y; }  */ 
     } 
    }
 if(bool_mouseReleased && rightCell && x==storX && y==storY){
     modColor=200;  }
}
void update() {
  fill(modColor);
  rect(x, y, unitSize, unitSize); 
   }
}

void mousePressed() {
  if(overKnight) { 
    locked = true;    
  } else {
    locked = false;
   }
  xOffset = mouseX-knightX; 
  yOffset = mouseY-knightY; 
}
void mouseDragged() {
  overField=false;
  rightCell=false;
  if(locked) {
    bool_mouseReleased=false;
    knightX = mouseX-xOffset; 
    knightY = mouseY-yOffset; 
  }
}
void mouseReleased() {
  bool_mouseReleased=true;
  locked = false;
  if(overKnight)
 {
 
   if(overField)
     {
      knightX=listOfCoordinatesX.get(listOfCoordinatesX.size()-1);
      knightY=listOfCoordinatesY.get(listOfCoordinatesY.size()-1);
      }
  else 
 if( (storX==listOfCoordinatesX.get(listOfCoordinatesX.size()-1)+200 && 
        (storY==listOfCoordinatesY.get(listOfCoordinatesY.size()-1) +100  
       || storY==listOfCoordinatesY.get(listOfCoordinatesY.size()-1) -100))
   ||
    (storX==listOfCoordinatesX.get(listOfCoordinatesX.size()-1)-200 && 
        (storY==listOfCoordinatesY.get(listOfCoordinatesY.size()-1)+100  
       || storY==listOfCoordinatesY.get(listOfCoordinatesY.size()-1)-100))
   || 
   (storY==listOfCoordinatesY.get(listOfCoordinatesX.size()-1)+200 && 
        (storX==listOfCoordinatesX.get(listOfCoordinatesY.size()-1)+100  
       || storX==listOfCoordinatesX.get(listOfCoordinatesY.size()-1)-100))
   ||
   (storY==listOfCoordinatesY.get(listOfCoordinatesX.size()-1)-200 && 
        (storX==listOfCoordinatesX.get(listOfCoordinatesY.size()-1)+100  
|| storX==listOfCoordinatesX.get(listOfCoordinatesY.size()-1)-100)) )
   {  
  rightCell=true;   
  knightX=storX;
  knightY=storY;
      listOfCoordinatesX.append(int(knightX));
      listOfCoordinatesY.append(int(knightY)); 
    } else
    {
    knightX=listOfCoordinatesX.get(listOfCoordinatesX.size()-1);
    knightY=listOfCoordinatesY.get(listOfCoordinatesY.size()-1);
    }
  }             
 }
// button
 void buttonUpdate() {
  if ( overButton(buttonX, buttonY, buttonSize, buttonSize) ) {
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
