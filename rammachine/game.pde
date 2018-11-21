
int px=70, py = 80;
float dy;
classMap[] mods;
int[] my_map =
{1,0,1,0,1,0,1};

void setup() {
  frameRate(10);

 size(400, 400);
  noStroke();
  int index = 0;
     mods = new classMap[7]; // Create array
  for (int i = 0; i < 7; i++) 
 //  for (int j = 0; j < 7; j++)
    if(my_map[i]==1)
      mods[index++] = new classMap(i*50 );
     else if(my_map[i]==0)
      mods[index++] = new classMap(i*0);
}
void draw() {
 dy=dy+1;
 int rdy=round(dy);
 py=py+rdy;
if (px<50) px=px+10;
if (px+60>300) px=px-10;
 background(0);
  ellipse(px,py,20,20);
  for (classMap mod : mods) {
    mod.display();
  //  if (px+60>mod.x && px+14<mod.x+50 && py+80>mod.y && py+80<mod.y+50 && dy>0)
   //   dy=-15;
     }
}
void keyPressed() {
     if (keyCode == LEFT) {
        px=px-5;
   } else if (keyCode == RIGHT) {
          px=px+5;
    } 
 }
class classMap {
   float x, y;
     // Contructor
  classMap(float xTemp ) {
     x = xTemp;
   // y = yTemp;
      }
   // Custom method for drawing the object
  void display() {
    stroke(0);
  //rect(x,10,50,50);
  text('8', x,10);
  //for (int i = 0; i < 7; i += 1){
   //     text(x,10+30*i,200);     }
    }
}    
