ArrayList<Cube> cubes;
int cubeWidth = 40;

boolean locked = false;
boolean boo=false;

void setup() {
  size(640, 360);
  cubes = new ArrayList<Cube>();
}
void draw() {
  background(200);
  frameRate(50);
  for (int i = cubes.size()-1; i >= 0; i--) { 
    // An ArrayList doesn't know what it is storing so we have to cast the object coming out
    Cube cube = cubes.get(i);
    cube.display();  
   }
   for (Cube cube : cubes) {
    cube.focusOn();
    }
}
void mousePressed() {
     if(!boo)
    cubes.add(new Cube(mouseX, mouseY, cubeWidth)); }
 
void mouseReleased() {
  boo=false;
   locked=false;  }    
    
class Cube {
  float x;
  float y;
  float w;
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
void focusOn() {
   if (mouseX >= x && mouseX <= x+40 && 
      mouseY >= y && mouseY <= y+40) {
 //
  boo=true;
 if ((!locked)&&mousePressed&&(mouseButton == LEFT)){
  colorCounter+=1;
 if (colorCounter==4) colorCounter=0;
 if (colorCounter==0) colorArr=whiteArr;
 if (colorCounter==1) colorArr=redArr;
 if (colorCounter==2) colorArr=greenArr;
 if (colorCounter==3) colorArr=blueArr;
 locked=true;
   }
 //if (mousePressed && (mouseButton == LEFT))
  } 
 }
void display() {
   fill(colorArr[0],colorArr[1],colorArr[2]);
   rect(x,y,w,w);
   }
}  
