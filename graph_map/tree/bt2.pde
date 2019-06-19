boolean flag;
BinaryTree bt;
int[] values= { 6, 4, 8 };

int currentIndex = 0;
int frameCount = 0;

void setup(){
  size(600,600);
  frameRate(10);
// BinaryTree bt = new BinaryTree(); 
  // bt.add(1); 
init();
}

void draw(){  
 int nextValue = -1; 
  if(keyPressed) init();
   frameCount++; 
 //if(frameCount == 20 && currentIndex < MAX_NODES){ 
   if(frameCount == 20 && currentIndex < 3){
   // if(mousePressed) currentIndex++; 
    nextValue = values[currentIndex];
     println();
     println("CurrentIndex: " + currentIndex);
     println("nextValue:" + nextValue);
     println();
     frameCount = 0;
   }   
         if(nextValue > -1){ bt.add(nextValue);  }
//    fill(0);
      text("Click mouse to refresh.", 200, 20);
   // println(bt.root);

}
void init(){
 // BinaryTree bt = new BinaryTree();
  bt = new BinaryTree();
  currentIndex=0;
  frameCount = 0;
}
void mousePressed(){
currentIndex++;
}

class Node {
    int value;
    Node left;
    Node right;
 
    Node(int value) {
        this.value = value;
        right = null;
        left = null;   }
}

public class BinaryTree {
    Node root; 
    private Node addRecursive(Node current, int value) {
    if (current == null) {
      println("New Node",value);
        return new Node(value);
    } 
    if (value < current.value) {
        current.left = addRecursive(current.left, value);
        println("left",value);
    } else if (value > current.value) {
        current.right = addRecursive(current.right, value);
        println("right",value);
    } else {
        // value already exists
        return current;
    }
 
    return current;
}

public void add(int value) {
    root = addRecursive(root, value);
    println("root",value);
 }
}
