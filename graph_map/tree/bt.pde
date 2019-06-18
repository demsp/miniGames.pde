// https://www.baeldung.com/java-binary-tree

BinaryTree bt;

void setup(){
BinaryTree bt = new BinaryTree();
 
    bt.add(6);
    bt.add(4);
    bt.add(8);
    bt.add(3);
    //bt.add(5);
    //bt.add(7);
    //bt.add(9);
 
//println(bt);
}

//void draw(){}

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
