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

mods[0].d=_mas[0];
mods[1].d=_mas[1];
mods[2].d=_mas[2];

}
void draw() {
background(50);
frameRate(5);
textSize(40);

_mas[0]+=(random(0,1.1));
_mas[1]+=(random(0,1.1));
_mas[2]+=(random(0,1.1));
text(_mas[0],50,100);
text(_mas[1],100,100);
text(_mas[2],150,100);
text(mods[0].d,50,200);
text(mods[1].d,100,200);
text(mods[2].d,150,200);

mods[0].display();
mods[1].display();
mods[2].display();

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
int i;
int x;
int d;
//int[] data = new int[]{0,0,0};

Module(int x){
  this.x = x;
  }
void update() {
 //data[i]=_mas[global_i];
 d=_mas[global_i];
 }    
void display(){
   //text(data[i], x, 100);
   text(d, x, 300);
  }
  void shake() {
  translate(random(0,4),random(0,4));
  text(this.d, this.x, 300);
  }
}
