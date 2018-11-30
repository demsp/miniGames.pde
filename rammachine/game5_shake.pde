boolean playingGame = false;
int[] _mas ={3,3,3};
int rectX=50;
int rand;
int rand1;
int global_i;
//int random_i;
int shoot;
Module [] mods;
void setup() {
size(400, 400);
mods = new Module[3];
mods[0] = new Module(50);
mods[1] = new Module(150);
mods[2] = new Module(250);
mods[0].d1=_mas[0];
mods[1].d2=_mas[1];
mods[2].d3=_mas[2];
}
void draw() {
background(50);
frameRate(4);
textSize(60);
rect(rectX,320,40,5);
if(global_i==0){rectX=50;}
if(global_i==1){rectX=150;}
if(global_i==2){rectX=250;}
rand=int(random(0,3));
rand1=int(random(0,2));
_mas[rand]+=rand1;
//comment

text(_mas[0],50,100);
text(_mas[1],150,100);
text(_mas[2],250,100);
//text(mods[0].d1,50,200);
//text(mods[1].d2,100,200);
//text(mods[2].d3,150,200);

mods[0].display(0);
mods[1].display(1);
mods[2].display(2);

mods[0].shake();

//mods[global_i].update();
//println(_mas);
//println("global_i",global_i);
if(_mas[0]<0) {_mas[0]=0;}
if(_mas[1]<0) {_mas[1]=0;}
if(_mas[2]<0) {_mas[2]=0;}
if(_mas[0]<=2 && _mas[1]<=2 &&_mas[2]<=2){
text("You win", 100, 40);
frameRate(1);
_mas[0]=0;
_mas[1]=0;
_mas[2]=0;
}
}
void keyReleased() { 
shoot=1;
}
 void keyPressed() { 
 
  // if (keyCode == UP) {
  //      _mas[global_i]++;
  //  } 
    if (key == 32) {
       _mas[global_i]-=shoot;
     shoot=0;
      }
    if (keyCode == LEFT) {
        global_i--; 
        if (global_i < 0)
            global_i = 0;
    } 
    if (keyCode == RIGHT) {
        global_i++;
        if (global_i > 2)
            global_i = 2;
    } 
    if (keyCode == UP) {
        _mas[0]=2;
        _mas[1]=2;
        _mas[2]=2;
    }
}
class Module {
//int i;
int x;
int d;
int d1;
int d2;
int d3;
int var;
int var1;
//int[] data = new int[]{0,0,0};
Module(int x){
  this.x = x;
  }
void update() {
  d=_mas[global_i];
  d1=_mas[0];
  d2=_mas[0];
  d3=_mas[0];
 }    
void display(int tempVar){
    var=tempVar;
   //text(d, x, 300);
   text(_mas[var], x, 300);
  }
 
 void shake() {
  translate(random(-4,4),random(-4,4));
  text(_mas[0], this.x, 300);
  } 
}
