//int[] my_map ={0,0,0,0,0,0,0};
boolean flag;
boolean i_flag;
int px=70, py=80;
float dy;
//classMap[] mods;


Module[] mods;
void setup() {
  frameRate(1);
size(500, 400);
  noStroke();
  
mods = new Module[7];

 for (int i = 0; i < 7; i++) {
    //mods[i] = new Module (my_map[i]);
    mods[i] = new Module();
  }

}
void draw() {
background(0);
  for (Module mod : mods) {
    mod.update();
    mod.display();
    println("flag= ",flag);
    println("i_flag= ",i_flag);
  }
}
void keyPressed() {
     if (keyCode == UP) {
       if(!flag)flag=true;} 
     if (keyCode == DOWN) {
        if(flag)flag=false;   }
        
    if (keyCode == RIGHT) {
       if(!i_flag) i_flag=true;} 
     if (keyCode == LEFT) {
        if(i_flag) i_flag=false;   }     
 }


class Module {
  int i;
//int x;
int[] data = new int[]{0,0,0,0,0,0,0};
// Contructor
 // Module(int xTemp){
 //   x = xTemp;
 //   }
void update() {
if(flag)data[i]++;
if(i_flag) i++;
}    
    
void display() {
  textSize(30);
 for (int j = 0; j < 7; j += 1){
      text(data[j],10+60*j,100);
  }
  text("data_mem index "+i, 10,200); 
 }
}
