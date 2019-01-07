// https://www.youtube.com/watch?v=QtSYG90D2-8
int x,y,r;
float alf;
int x1,y1,r1;
float alf1;
void setup() {
  size(400, 400);
  r=150;
  r1=100;
} 

void draw() {
background (100);
frameRate(5);
alf1+=10;
alf+=7;
x=round(200+r*cos(PI*alf/180));
y=round(200+r*sin(PI*alf/180));
ellipse(x,y,10,10);
x1=round(200+r1*cos(PI*alf1/180));
y1=round(200+r1*sin(PI*alf1/180));
ellipse(x1,y1,10,10);

ellipse(200,200,10,10);
line(200,200,round(200+r*cos(PI*alf/180)),round(200+r*sin(PI*alf/180)) ); 
}
