// https://www.youtube.com/watch?v=QtSYG90D2-8
boolean xflag= true;
int x,y,r;
float alf;
int x1=100;
int y1=0;

float alf1;
void setup() {
  size(400, 400);
  r=150;
} 

void draw() {
background (100);
alf+=1;
x=round(200+r*cos(PI*alf/180));
y=round(200+r*sin(PI*alf/180));
//ellipse(x,y,10,10);


if(x1>100 && xflag) xflag=false;
if(x1<0 && !xflag) xflag=true;
if(xflag) 
x1+=1;
if(!xflag) x1-=1;
if(xflag) y1-=1;
if(!xflag) y1+=1;
translate(100,100);
ellipse(x1,0,10,10);
ellipse(0,y1,10,10);
pushMatrix();
fill(255,0,0);
ellipse(x1,y1,10,10);
popMatrix();
fill(255,255,255);
//println(x1);
println(xflag);
ellipse(0,0,10,10);
}
