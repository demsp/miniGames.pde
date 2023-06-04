// https://codechick.io/tutorials/dsa/dsa-binary-search-tree

class BST{
    class Node{
        int value;
        Node left, right;
        // constructor
        Node(int item){
                 value = item;
                 left = right = null;}
    } // _Node
   Node root;
   BST(){ root = null; }
   void add(int value){
       root = addValue(root, value);
         }
    Node addValue(Node root, int value){
     // return new node if tree is empty
     if (root == null){ root = new Node(value); return root; }
     // add node in required place
     if(value < root.value){ root.left = addValue(root.left, value);}
     else if(value > root.value){ root.right = addValue(root.right, value); }
      return root;
    } // _add 
    void inorder(){ inorderRec(root); }
    void inorderRec(Node root) {
        if(root != null){
            inorderRec(root.left);
            System.out.print(root.value + "->");
            inorderRec(root.right);
         }
        } // _inorderRec
} // _#

public class Main
{
    public static void main(String[] args) {
        System.out.println("BST output");  
    BST tree = new BST(); 
    tree.add(8);
    tree.add(3);
    tree.add(1);
    tree.add(6);
    tree.inorder();
    }
}
