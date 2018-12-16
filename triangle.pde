int d = 70;
int p1 = d;
int p2 = p1+d;
int p3 = p2+d;
int p4 = p3+d;

void setup(){
size(640, 360);
//noSmooth();
background(50);
}

void draw(){
// Draw gray box
stroke(100);

  float r = random(150);
  //stroke(r*5);
  translate(0, 50+r);
  fill(250,0,0);
  line(50, 50, 50+r, 50);


// Draw white points

//stroke(255);
//point(p1+r, p1+r);
//point(p1+r, p3+r); 
//point(p2+r, p4+r);
}
