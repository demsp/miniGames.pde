float bx1;
float by1;
float bx2;
float by2;

int boxSize = 20;
boolean overBox1 = false;
boolean overBox2 = false;
boolean locked1 = false;
float xOffset1 = 0.0; 
float yOffset1 = 0.0; 

boolean locked2 = false;
float xOffset2 = 0.0; 
float yOffset2 = 0.0; 
////
////
void setup(){
size(500,500);
bx1=100;
by1=100;
bx2=200;
by2=200;
}

void draw(){
   background(255);
 if (mouseX > bx1-boxSize && mouseX < bx1+boxSize && 
      mouseY > by1-boxSize && mouseY < by1+boxSize) {
    overBox1 = true;   
    } 
   else {
     overBox1 = false;
  }
/////  
/////
if (mouseX > bx2-boxSize && mouseX < bx2+boxSize && 
      mouseY > by2-boxSize && mouseY < by2+boxSize) {
    overBox2 = true;   
    } 
   else {
     overBox2 = false;
  }

ellipse(bx1,by1,40,40);
ellipse(bx2,by2,40,40);
line(bx1,by1,bx2,by2);
println(overBox1);
}

void mousePressed() {
if(overBox1) { 
    locked1 = true;
  } else {
    locked1= false;
  }
 xOffset1 = mouseX-bx1; 
  yOffset1 = mouseY-by1; 
////
////
if(overBox2) { 
    locked2 = true;
  } else {
    locked2= false;
  }
 xOffset2 = mouseX-bx2; 
  yOffset2 = mouseY-by2; 

}

void mouseReleased() {
  locked1 = false;
  locked2 = false;
}

void mouseDragged() {
 if(locked1) {
    bx1 = mouseX-xOffset1; 
    by1 = mouseY-yOffset1; 
  }
////
////
if(locked2) {
    bx2 = mouseX-xOffset2; 
    by2 = mouseY-yOffset2; 
  }
}
