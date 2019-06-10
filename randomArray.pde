int cols = width;
int rows = height;

// Declare 2D array
//int[][] myArray = new int[cols][rows];
int[][] myArray = new int[800][800];

// Initialize 2D array values
void setup(){
size(400,400);

for (int i = 0; i < 800; i++) {
  for (int j = 0; j < 800; j++) {
  //  myArray[i][j] = int(i/random(0,20)+j);
    myArray[i][j] = int(i/5+j/5);
  }
}

}
void draw(){
// Draw points
for (int i = 0; i < 800; i++) {
  for (int j = 0; j < 800; j++) {
   // stroke(myArray[int(random(0,2))*i][j]);
   // point(int(random(0,2))*i,j);
   stroke(myArray[i][j]);
    point(i,j);
    
  }
}

}
