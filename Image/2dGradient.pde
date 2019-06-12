//  https://processing.org/tutorials/2darray/

size(400,400);
int cols = width;
int rows = height;

// Declare 2D array
int[][] myArray = new int[cols][rows];

// Initialize 2D array values
for (int i = 0; i < cols; i++) {
  for (int j = 0; j < rows; j++) {
    myArray[i][j] = i/4+j/4;
  }
}

// Draw points
for (int i = 0; i < cols; i++) {
  for (int j = 0; j < rows; j++) {
    stroke(myArray[i][j]);
    point(i,j);
  }
}
