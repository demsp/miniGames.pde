Tree tree;

void setup(){
//Node n = new Node(5);
//var n = new Node(5);
tree=new Tree();
tree.add(5);

println(tree);
}

//void draw(){}

class Node{
  Data data = null;
  Node left = null;
  Node right = null;
   Node(int value ){    
     this.data = new Data(value);
  }
}

class Data{ 
  public int value; 
   public Data(int value ){
     this.value = value;
   }  
}

class Tree{
 public Node root = null;
 public void add(int value) {  
   if(root == null){  root = new Node(value); }
   }
 }
