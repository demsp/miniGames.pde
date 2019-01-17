int count=0;
int[] whiteArr={255,255,255};
int[] redArr={255,0,0};
int[] greenArr={0,255,0};
int[] blueArr={0,0,255};
int[] colorArr=whiteArr;

float bx;
float by;
int boxSize = 75;
boolean overBox = false;
boolean locked = false;
float xOffset = 0.0; 
float yOffset = 0.0; 

void setup() {
  size(640, 360);
  bx = width/2.0;
  by = height/2.0;
  rectMode(RADIUS);  
}

void draw() { 
  background(0);
  
  // Test if the cursor is over the box 
  if (mouseX > bx-boxSize && mouseX < bx+boxSize && 
      mouseY > by-boxSize && mouseY < by+boxSize) {
    overBox = true;  
    if(!locked) { 
     // stroke(255); 
    //  fill(153);
    /*
 fill(colorArr[0],colorArr[1],colorArr[2]);
 if (count==0) colorArr=whiteArr;
 if (count==1) colorArr=redArr;
 if (count==2) colorArr=greenArr;
 if (count==3) colorArr=blueArr;
 */
    } 
  } else {
   // stroke(153);
    //fill(153);
    
 /*   
 fill(colorArr[0],colorArr[1],colorArr[2]);
 if (count==0) colorArr=whiteArr;
 if (count==1) colorArr=redArr;
 if (count==2) colorArr=greenArr;
 if (count==3) colorArr=blueArr;
 */
     overBox = false;
  }
  
  // Draw the box
  rect(bx, by, boxSize, boxSize);
}

void mousePressed() {
  if(overBox) { 
    locked = true;
    count+=1;
    if (count==4) count=0;
     fill(colorArr[0],colorArr[1],colorArr[2]);
 if (count==0) colorArr=whiteArr;
 if (count==1) colorArr=redArr;
 if (count==2) colorArr=greenArr;
 if (count==3) colorArr=blueArr;
 println(count);
  //////////////  fill(255, 255, 255);
  } else {
    locked = false;
  }
  xOffset = mouseX-bx; 
  yOffset = mouseY-by; 

}

void mouseDragged() {
  if(locked) {
    bx = mouseX-xOffset; 
    by = mouseY-yOffset; 
  }
}

void mouseReleased() {
  locked = false;
}
