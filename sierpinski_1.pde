PVector v=new PVector(10, 10, 0);
float x0=200;
float y0=200;

void setup() {
  size(400,400);
 // noLoop();
 // v = new PVector(40, 20, 0);
}

void draw() {
  ellipse(x0, y0, 10, 10);
   
  ellipse(v.x, v.y, 10, 10);
  
 // v.add(x0/2, y0/2, 0);
 // ellipse(v.x, v.y, 10, 10);
}
void keyReleased() { 
 
 v.add(x0, y0, 0);
 v.x=(v.x)/2;
 v.y=(v.y)/2;
 ellipse(v.x, v.y, 10, 10);
 
 println("v.x ",v.x);
 println("v.y ",v.y);
}   

/*
PVector v1, v2;
void setup() {
  size(400,400);
 // noLoop();
  v1 = new PVector(20, 20);
  v2 = new PVector(40, 40); 
}

void draw() {
  ellipse(v1.x, v1.y, 12, 12);
  ellipse(v2.x, v2.y, 12, 12);
  //v2.add(v1);
  //ellipse(v2.x, v2.y, 12, 12);
}

void keyReleased() { 
    v2.add(v1);
  ellipse(v2.x, v2.y, 12, 12);
   
}   
*/
