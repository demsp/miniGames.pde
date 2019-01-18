ArrayList<Cube> cubes;
int cubeWidth = 40;

float xOffset = 0.0; 
float yOffset = 0.0; 
boolean locked = false;
boolean boo=false;
boolean booldrag=false;

void setup() {
  size(640, 360);
  cubes = new ArrayList<Cube>();
}

void draw() {
  background(255);
  frameRate(30);

//  if (mousePressed && (mouseButton == LEFT)) { 
//    cubes.add(new Cube(mouseX, mouseY, ballWidth));
//  }

  //for (int i = cubes.size()-1; i >= 0; i--) { 
    // ####// An ArrayList doesn't know what it is storing so we have to cast the object coming out
   // Cube cube = cubes.get(i);
   //cube.move();
   // cube.display();  
 //  }
   for (Cube cube : cubes) {
     cube.display();   
    cube.focusOn();
    //cube.x+=10;
   if(boo&&locked){ 
       if(booldrag){
   cube.x = mouseX;//+xOffset; 
   cube.y = mouseY;//+yOffset;
  // cube.x+=10;
  }
   }
 }
 //println("boo=",boo);
 //println("locked=",locked);
  println("xOffset=",xOffset);
  println("yOffset=",yOffset);
  println("booldrag=",booldrag);
}
//#############//
void mousePressed() {
  xOffset = mouseX; 
  yOffset = mouseY;
 //locked = true;
   if(!boo)
    cubes.add(new Cube(mouseX, mouseY, cubeWidth));
}

void mouseReleased() {
  boo=false;
   locked=false;
    booldrag=false;    
  }

void mouseDragged() {
 booldrag=true;    
}
class Cube {
  float x;
  float y;
  float w;
 
// float speed, gravity;
 
  int colorCounter=0;
  int[] whiteArr={255,255,255};
  int[] redArr={255,0,0};
  int[] greenArr={0,255,0};
  int[] blueArr={0,0,255};
  int[] colorArr=whiteArr;
    
  Cube(float tempX, float tempY, float tempW) {
    x = tempX;
    y = tempY;
    w = tempW; 
  }
 /* 
    void move() {
    // Add gravity to speed
    speed = speed + gravity;
    // Add speed to y location
    y = y + speed;
    // If square reaches the bottom
    // Reverse speed
    if (y > height) {
      // Dampening
      speed = speed * -0.8;
      y = height;
    }
  }
 */ 
void focusOn() {
   if (mouseX >= x && mouseX <= x+40 && 
      mouseY >= y && mouseY <= y+40) {
 boo=true;
 //
if(!locked){
 if (mousePressed && (mouseButton == LEFT)){
 colorCounter+=1;
 if (colorCounter==4) colorCounter=0;
 if (colorCounter==0) colorArr=whiteArr;
 if (colorCounter==1) colorArr=redArr;
 if (colorCounter==2) colorArr=greenArr;
 if (colorCounter==3) colorArr=blueArr;
 locked=true;
      }
   }
 
 } 
   
 }
/*
boolean overRect(){
 if (mouseX >= x && mouseX <= x+40 && 
      mouseY >= y && mouseY <= y+40) {return true;}
      else{return false;}
}
*/
void display() {
   fill(colorArr[0],colorArr[1],colorArr[2]);
   rect(x,y,w,w);
   }
}  

