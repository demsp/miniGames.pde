int[] my_map ={0,0,0,0,0,0,0};
boolean flag;
int px=70, py=80;
float dy;
//classMap[] mods;

int count;
Module[] mods;
void setup() {
  frameRate(1);
size(500, 400);
  noStroke();
count=7;  
mods = new Module[count];
int index = 0;
 for (int i = 0; i < 7; i++) {
  mods[index++] = new Module (my_map[i]);
  }

}
void draw() {
background(0);
  for (Module mod : mods) {
    mod.update();
    mod.display();
    println(flag);
  }
}
void keyPressed() {
     if (keyCode == UP) {
        //px=px-5;
        if(!flag){flag=true;}
        
   } else if (keyCode == DOWN) {
         // px=px+5;
        if(flag){flag=false;}
    } 
 }


class Module {
int x;
// Contructor
  Module(int xTemp){
    x = xTemp;
    }
void update() {
if(flag)x++;
}    
    
void display() {
  textSize(30);
 for (int i = 0; i < 7; i += 1){
    text(x,10+60*i,100);
  }
 }
}
