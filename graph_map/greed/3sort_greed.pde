Cell[][] grid;
int[] numbers = new int[3];
int vTemp;

// Number of columns and rows in the grid
int cols = 3;
int rows = 3;

void setup() {
  size(400,400);
  
numbers[0] = 1;  // Assign value to first element in the array
numbers[1] = 3; // Assign value to second element in the array
numbers[2] = 2;  // Assign value to third element in the array

grid = new Cell[cols][rows];
grid[0][0] = new Cell(0*40,0*40,40,40,0);
grid[0][1] = new Cell(0*40,1*40,40,40,1);
grid[0][2] = new Cell(0*40,2*40,40,40,1);

grid[1][0] = new Cell(1*40,0*40,40,40,1);
grid[1][1] = new Cell(1*40,1*40,40,40,0);
grid[1][2] = new Cell(1*40,2*40,40,40,0);

grid[2][0] = new Cell(2*40,0*40,40,40,1);
grid[2][1] = new Cell(2*40,1*40,40,40,0);
grid[2][2] = new Cell(2*40,2*40,40,40,0);
}

void draw() {
  background(0);
  // The counter variables i and j are also the column and row numbers and 
  // are used as arguments to the constructor for each object in the grid.  
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {    
      grid[i][j].display();
  
    }
  }
}

// A Cell object
class Cell {
  // A cell object knows about its location in the grid 
  // as well as its size with the variables x,y,w,h
  float x,y;   // x,y location
  float w,h;   // width and height
  float angle; // angle for oscillating brightness

  // Cell Constructor
  Cell(float tempX, float tempY, float tempW, float tempH, float tempAngle) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    angle = tempAngle;
  } 
  
  // Oscillation means increase angle
 // void oscillate() {
   // angle += 0.02; 
//  }

  void display() {
    stroke(2);
    // Color calculated using sine wave
   // fill(127+127*sin(angle));
   fill(127);
    rect(x,y,w,h);
    fill(5);
    textSize(10);
    text(angle,x+1,y+10);
  }
}
void mousePressed(){
  println("numbers[0]=",numbers[0]);
  println("numbers[1]=",numbers[1]);
  println("numbers[2]=",numbers[2]);
  println();
for (int i = 0; i < cols; i++) {
 for (int j = 0; j < rows; j++) {
    
   if(grid[i][j].angle==1)     
    {
      if(numbers[j]<numbers[i])
      {
      vTemp = numbers[j];
      numbers[j]=numbers[i];
      numbers[i]=vTemp;
      }
    }
  }
 }

}

void mouseReleased(){
 println("num[0]=",numbers[0]);
 println("num[1]=",numbers[1]);
 println("num[2]=",numbers[2]);
 println();
}
