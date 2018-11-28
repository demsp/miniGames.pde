int[] _mas ={3,3,3};
int i=3;
int global_i;
int random_i;
Module [] mods;

void setup() {
frameRate(10);
size(500, 400);
mods = new Module[3];

mods[0] = new Module(50);
mods[1] = new Module(100);
mods[2] = new Module(150);

mods[0].d1=_mas[0];
mods[1].d2=_mas[1];
mods[2].d3=_mas[2];

}
void draw() {
background(50);
frameRate(7);
textSize(40);

_mas[0]+=(random(0,1.1));
_mas[1]+=(random(0,1.1));
_mas[2]+=(random(0,1.1));
//comment

text(_mas[0],50,100);
text(_mas[1],100,100);
text(_mas[2],150,100);
text(mods[0].d1,50,200);
text(mods[1].d2,100,200);
text(mods[2].d3,150,200);

mods[0].display(0);
mods[1].display(1);
mods[2].display(2);

mods[global_i].shake();
mods[global_i].update();
println(_mas);
println("global_i",global_i);

if(_mas[0]==0 && _mas[1]==0 &&_mas[2]==0){
text("You win", 100, 40);
frameRate(0.1);
_mas[0]=0;
_mas[1]=0;
_mas[2]=0;
}
println("_mas[global_i]",_mas[global_i]);
}
 void keyReleased() { 
    if (keyCode == UP) {
        _mas[global_i]++;
    } 
    if (keyCode == DOWN) {
        _mas[global_i]--;
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
}
class Module {
//int i;
int x;
int d;
int d1;
int d2;
int d3;
int var;
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
  text(this.d, this.x, 300);
  }
}
