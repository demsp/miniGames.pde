int px=70, py = 70;
float dx;
float dy;

classMap[] mods;
int[][] my_map =
{{0,0,0,1,1},
{0,0,0,0,1},
{0,0,0,0,0},
{0,0,1,0,0},
{1,1,1,0,0}};

void setup() {
//  frameRate(10);
//pers = loadImage("blobb.png");
 size(400, 400);
  //noStroke();
  int index = 0;
     mods = new classMap[5*5]; // Create array
  for (int i = 0; i < 5; i++) 
   for (int j = 0; j < 5; j++)
    if(my_map[j][i]==1)
      mods[index++] = new classMap(i*50, j*50);
     else if(my_map[j][i]==0)
      mods[index++] = new classMap(i*0, j*0);
}
void draw() {
 dy=dy+1;
 int rdy=round(dy);
 py=py+rdy;


 background(50);
 ellipse(px,py,40,40);

  for (classMap mod : mods) {
    mod.display();
      if ( px>=mod.x && px<=mod.x+50 && py+20>=mod.y-1 && dy>0)
      dy=-15;
    
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
  classMap(float xTemp, float yTemp) {
     x = xTemp;
    y = yTemp;
      }
   // Custom method for drawing the object
  void display() {
  //  stroke(0);
  rect(x,y,50,50);
     }
}
