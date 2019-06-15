Cell[][] grid;

// Number of columns and rows in the grid
int cols = 3;
int rows = 3;

void setup() {
  size(400,400);
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
     fill(127);
    rect(x,y,w,h);
    fill(5);
    textSize(10);
    text(angle,x+1,y+10);
  }
}
