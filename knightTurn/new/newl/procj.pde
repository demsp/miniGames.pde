// https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray

// https://funprogramming.org/142-Processing-js-with-sound-audio-II.html
//  добавляем переменую для закрашивания 
boolean rightCell = false;
// list

int listOfCoordinatesX;
int listOfCoordinatesY;

//button
int buttonX=25, buttonY=525; 
int buttonSize = 50;     
boolean boolButton = false;

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

  listOfCoordinatesX = new Uint8Array([10]);
  listOfCoordinatesY = new Uint8Array([20]);
  //listOfCoordinatesX = 10 + listOfCoordinatesX;
  // listOfCoordinatesX = 20 + listOfCoordinatesX;

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
  
//  println(); 
  println(storX);
  println(storY);
//  println(boolButton);
  println(); 
  console.log(listOfCoordinatesX[listOfCoordinatesX.length-1]);
  print(listOfCoordinatesX[0]);print(listOfCoordinatesX[1]);
  //println(listOfCoordinatesX); 
  println(listOfCoordinatesY); 
  
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
 if((bool_mouseReleased ) && (x==storX && y==storY ) &&  rightCell){
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
    
// if( (storX==listOfCoordinatesX[listOfCoordinatesX.lenght-1]+100 && 
//  storY==listOfCoordinatesX[listOfCoordinatesY.lenght-1] +100 )  
//  || (storY==listOfCoordinatesY[listOfCoordinatesX.lenght-1]+100 && 
//  storX==listOfCoordinatesX[listOfCoordinatesY.lenght-1] +100) )
if( (storX==100 && storY==100)||(storX==200 && storY==200) )  
//  || (storY==listOfCoordinatesY[listOfCoordinatesX.lenght-1]+100 && 
//  storX==listOfCoordinatesX[listOfCoordinatesY.lenght-1] +100) )
   {
   
  rightCell=true;   
  knightX=storX;
  knightY=storY;
    listOfCoordinatesX=int(knightX) + listOfCoordinatesX;
    listOfCoordinatesY=int(knightY) + listOfCoordinatesY;
  // }
  
    } else
    {
    knightX=listOfCoordinatesX[listOfCoordinatesX.length];
    knightY=listOfCoordinatesY[listOfCoordinatesY.length];
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
