int currentIndex = 0;
int frameCount = 0;
// int MAX_NODES = 48;
int MAX_NODES = 20;

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


//################
//################
int[] values;
Tree tree;


//Setup happens only once
void setup(){
 tree = new Tree();
init();
}

void init(){
  tree = new Tree();
 // values = getValues();
  currentIndex = 0;
  frameCount = 0;
}


class Node{
 
  Data data = null;
  Node left = null;
  Node right = null;
  
  Node(int value, int row, int column){
   // this.data = new Data(value, new Position(row,column)); 
     this.data = new Data(value );
  }
}

class Data{
 
  public int value;
 // public Position position;
  
 // public Data(int value, Position position){
   public Data(int value ){
   
    this.value = value;
  //  this.position = position;
  }  
}

