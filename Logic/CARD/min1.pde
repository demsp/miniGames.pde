Spot sp1,sp2,sp3;;
IntList inventory1,inventory2;

int Grey = 155;
int White = 255;
boolean locked1,locked2 = false;

void setup() {
size(640, 360);
  
  //noLoop();
  inventory1 = new IntList();
  inventory2 = new IntList();
  inventory1.append(0);
  inventory2.append(0);
  
  sp1 = new Spot();
  sp2 = new Spot(200,100, 80);
  sp3 = new Spot(300,100, 80);
 // rectMode(RADIUS);
 rectMode(CORNER);
   }

void draw() { 
  background(10);
  sp1.display1();
  sp2.display2();
  sp3.display3();
  println(locked1);
  println(locked2);
  println(inventory1);
  println(inventory2);
  println();
}

 void mousePressed() {
   
if (mouseX > sp1.dx && mouseX < sp1.dx+sp1.boxSize && 
mouseY > sp1.dy && mouseY < sp1.dy+sp1.boxSize) {
locked1 = true;}

if (mouseX > sp2.dx && mouseX < sp2.dx+sp2.boxSize && 
mouseY > sp2.dy && mouseY < sp2.dy+sp2.boxSize) {
locked2 = true;
}
  }
  
 void mouseReleased() {
if (mouseX > sp1.dx && mouseX < sp1.dx+sp1.boxSize && 
mouseY > sp1.dy && mouseY < sp1.dy+sp1.boxSize) {
locked1=false;  
inventory1.increment(0);
if (inventory1.hasValue(10) == true){inventory1.set(0, 0);}
}

if (mouseX > sp2.dx && mouseX < sp2.dx+sp2.boxSize && 
mouseY > sp2.dy && mouseY < sp2.dy+sp2.boxSize) {
locked2=false;    
inventory2.increment(0);
if (inventory2.hasValue(10) == true){inventory2.set(0, 0);}
}
  }

class Spot {
  float dx, dy, boxSize;
       // First version of the Spot constructor;
   Spot() {
   boxSize = 80;
   dx = 100;
   dy = 100;
   }
   // Second version of the Spot constructor;
    Spot(float xpos, float ypos, float r ) {
    dx = xpos;
    dy = ypos;
    boxSize = r;
  }
 
 void display1() {
 stroke(Grey);
  if(locked1){
  stroke(White);
   }
   int nums1=inventory1.get(0);
   text(nums1, 120, 120);
   noFill();
      rect(dx, dy, boxSize, boxSize);
     }
 
  void display2() {
  stroke(Grey);
     if(locked2){
  stroke(White);
   }
   int nums2=inventory2.get(0);
   text(nums2, 220, 120);
   noFill();
      rect(dx, dy, boxSize, boxSize);
     }
     ///                ///
   
   void display3() {
  stroke(Grey);
   int n_pl= inventory1.get(0)+inventory2.get(0);; 
   
   text(n_pl, 320, 120);
   noFill();
      rect(dx, dy, boxSize, boxSize);
     }
   
}
