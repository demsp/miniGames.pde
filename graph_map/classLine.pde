ArrayList<Line> lines;

float lx;
float ly;
float rx;
float ry;

float bx1;
float by1;
float bx2;
float by2;
float bx3;
float by3;

int boxSize = 20;
boolean overBox1 = false;
boolean overBox2 = false;
boolean locked1 = false;
boolean locked2 = false;

float xOffset1 = 0.0; 
float yOffset1 = 0.0; 
float xOffset2 = 0.0; 
float yOffset2 = 0.0; 


void setup(){
size(500,500);
bx1=50;
by1=50;
bx2=100;
by2=200;
bx3=150;
by3=300;
lines=new ArrayList<Line>();
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

for(Line line:lines){
line.display();
line.mouseDragged();
} 

ellipse(bx1,by1,40,40);
ellipse(bx2,by2,40,40);
ellipse(bx3,by3,40,40);
//line(bx1,by1,bx2,by2);
println(overBox1);
println(overBox2);

}

void mousePressed() {
if(overBox1) {
  if(mouseButton == LEFT){lx=bx1; ly=by1;}
   if(mouseButton == RIGHT) 
    lines.add(new Line(rx,ry,bx1,by1)); 
     
    locked1 = true;
    
  } else {
    locked1= false;
  }
if(overBox2) {
  if(mouseButton == LEFT){rx=bx2; ry=by2;}
  if(mouseButton == RIGHT) 
    lines.add(new Line(lx,ly,bx2,by2));
    locked2 = true;
  } else {
    locked2= false;
  }
 xOffset1 = mouseX-bx1; 
  yOffset1 = mouseY-by1; 
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
    by1 = mouseY-yOffset1;    }
if(locked2) {
    bx2 = mouseX-xOffset2; 
    by2 = mouseY-yOffset2;   }
}
//##########
//##########
//##########
//##########
class Line {
  float x1;
  float y1;
  float x2;
  float y2;

 Line(float tempX1, float tempY1,float tempX2, float tempY2){
 x1 = tempX1;
 y1 = tempY1;
 x2 = tempX2;
 y2 = tempY2;
  }
  void mouseDragged() {  
    if(mouseButton == LEFT)  
   if (mouseX >= x2-20 && mouseX <= x2+20 && 
      mouseY >= y2-20 && mouseY <= y2+20) { 
    x2 = mouseX;  
    y2 = mouseY;
    }
      if(mouseButton == LEFT)  
   if (mouseX >= x1-20 && mouseX <= x1+20 && 
      mouseY >= y1-20 && mouseY <= y1+20) { 
    x1 = mouseX;  
    y1 = mouseY;
    
    }
  
}
  
    void display() {
   line(x1,y1,x2,y2); 
    }
}
