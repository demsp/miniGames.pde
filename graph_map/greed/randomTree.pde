
//  https://gist.github.com/fernandozamoraj/71c2c25a6a1ba3243f03b77aca187ef6

/*
   Author: Fernando Zamora
   Description:
   In this program I will attempt to draw out a binary search tree from N random values
*/

int currentIndex = 0;
int frameCount = 0;
int MAX_NODES = 48;

class Tree{
 
  public Node root = null;
  
 
  public void add(int value){  
    
    int row = 1;
    int column = 1;
  
    if(root == null){
       root = new Node(value, row, column); 
    }
    else{
     
       row++;
       
       if(root.data.value >= value){
          goleft(root, value, row, column); 
       }
       else{
          column++;
          goright(root, value, row, column);
       }
    }    
  }
  
  private void goleft(Node node, int value, int row, int column){
    if(node.left == null)
    {
       node.left = new Node(value, row, column); 
    }
    else{
       row++;
       column = column * 2;
       
       if(node.left.data.value > value){
          column = column-1;
          goleft(node.left, value, row, column); 
       }
       else{
         goright(node.left, value, row, column);
       }
    }
  }
  
  private void goright(Node node, int value, int row, int column){
    if(node.right == null)
    {
       node.right = new Node(value, row, column); 
    }
    else{
       row++;
       column=column*2;;
         
       if(node.right.data.value > value){
          column -= 1;
          goleft(node.right, value, row, column); 
       }
       else{
         goright(node.right, value, row, column);
       }
    }
  }
}

class Node{
 
  Data data = null;
  Node left = null;
  Node right = null;
  
  Node(int value, int row, int column){
    this.data = new Data(value, new Position(row,column)); 
  }
}

class Data{
 
  public int value;
  public Position position;
  
  public Data(int value, Position position){
   
    this.value = value;
    this.position = position;
  }  
}

class Position{
   public int row;
   public int column;
   
   Position(int row, int column){
    
     this.row = row;
     this.column = column;
   }
}

int[] values;

  
Tree tree;

PFont font;


//Setup happens only once
void setup(){
 
  //Setup up the size to fit
  size(1200, 800);
  
  //draw a light colored screen
  background(220, 240, 230);
  
  //set the fill to white
  fill(255);
  font = createFont("Arial", 10, true);
  textFont(font, 10);
  rectMode(CENTER);
  
  init();
}

void init(){
  tree = new Tree();
  values = getValues();
  currentIndex = 0;
  frameCount = 0;
}

int[] getValues(){
 
  int[] values = new int[MAX_NODES];
  int MAX_VALUE = 500;
   //force the first node to be a value in the middle of the range
   values[0] =  MAX_VALUE / 2;
   
  for(int i= 1; i < MAX_NODES; i++){
     values[i] = (int)random(0, MAX_VALUE); 
     println("Got: " + values[i]);
  }
  
  return values;
}

//Draw happens in a constant loop... representing each frame
void draw(){

  //If user clicked the mouse button re-initialize the nodes
  if(mousePressed) init();
  
  background(220, 240, 230);
   frameCount++;
   int nextValue = -1;
   
   //Grab a node one at a time every n frames
   if(frameCount == 20 && currentIndex < MAX_NODES){
     nextValue = values[currentIndex++];
     println("CurrentIndex: " + currentIndex);
     frameCount = 0;
   }

   if(nextValue > -1){
     tree.add(nextValue);
   }

    fill(0);
      text("Click mouse to refresh.", 200, 20);
   
   drawNode(tree.root);
}

void drawNode(Node node){
   
    if(node != null){
      int row = node.data.position.row;
      int column = node.data.position.column;
      int xPosition = (int)(1100 / (pow(2, node.data.position.row)+1))*column;
      int yPosition = row * 50;
      
      //Different colors for left and right nodes
      if(column % 2 == 0)
        fill(255);  //right node is lighter
      else
        fill(200);  //left node is darker
      
      //draw node
      ellipse(xPosition, yPosition,  30, 30); 
      
      //Draw texxt
      fill(0);
      text(""+node.data.value + "", xPosition-5, row*50+5);
      
      println("drew at: " + xPosition + " " + (row * 100) + " ");
      
      drawConnector(node.left, xPosition, yPosition);
      drawConnector(node.right, xPosition, yPosition);
      drawNode(node.left);
      drawNode(node.right);
    }
}

//Draws connector between x, y and node... x, y are for parent node location
void drawConnector(Node node, int x, int y){
  
  //Nothing to do here if node is null
  if(node == null) return;
      
  // padding = (int)(1100 / (pow(2, node.left.data.position.row)+1));
  int column = node.data.position.column;
  int x2 = (int)(1100 / (pow(2, node.data.position.row)+1))*column;
  int y2 = node.data.position.row * 50;
  
  //The +10 is for putting the line down lower on the node
  line(x, y+15, x2, y2);  
}
