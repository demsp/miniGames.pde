IntList xList;
boolean flag;
BinaryTree bt;

void setup(){
  size(500,500);
 BinaryTree bt = new BinaryTree();
  xList = new IntList(); 
   bt.add(2);
   bt.add(3);
   bt.add(8);
   bt.add(5);
   bt.add(1);
   bt.add(6);
   bt.add(7);
   bt.add(4);
}
// void draw(){  println(xList);  }

class Node {
    int value;
    Node left;
    Node right;
 
    Node(int value) {      
        this.value = value;
        right = null;
        left = null;   } 
 void show(int x, int y){  
   xList.append(x); 
  // code to draw this node at xy
  textSize(15);
  text(value,x,y);
  
  if(left != null){ 
    left.show(x - 40, y + 20); // left and down
   }
   if(right != null){    
    right.show(x + 40, y + 20);
  } 
 }
}

public class BinaryTree {
    Node root;
 
    private Node addRecursive(Node current, int value) {
    if (current == null) {    
      println("New Node",value);      
        return new Node(value);
    }
     if (value < current.value) {    
       // current.show(100,100);
        current.left = addRecursive(current.left, value);
        println("left",value);
    } else if (value > current.value) {     
       // current.show(100,100);
        current.right = addRecursive(current.right, value);
        println("right",value);
    } //else {
        // value already exists
      //  return current;
   // }
     return current;
}

public void add(int value) {
    root = addRecursive(root, value);
    root.show(100,100);
    println("root",value);
 }
}


