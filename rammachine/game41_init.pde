int[] _mas ={1,2,3};
int i=3;
int global_i;
Module [] mods;

void setup() {
frameRate(10);
size(500, 400);
mods = new Module[3];

mods[0] = new Module(50);
mods[1] = new Module(100);
mods[2] = new Module(150);
//mods[3] = new Module(200);
//mods[4] = new Module(250);

mods[0].d=_mas[0];
mods[1].d=_mas[1];
mods[2].d=_mas[2];
}
void draw() {
background(50);
mods[0].display();
mods[1].display();
mods[2].display();
//mods[3].display();
//mods[4].display();
mods[global_i].update();
println(_mas);
println("global_i",global_i);
}
void keyPressed() {
    if (keyCode == UP) {
        _mas[global_i]++;
    } 
    if (keyCode == DOWN) {
        _mas[global_i]--;
    }
    if (keyCode == LEFT) {
        global_i--; 
        if (global_i < 0)
            global_i = 2;
    } 
    if (keyCode == RIGHT) {
        global_i++;
        if (global_i > 2)
            global_i = 0;
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
  text(d, x, 100);
 }
}
