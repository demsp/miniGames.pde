class BinList{
    class Node{
        int value;
        Node node;
        // constructor
        Node(int item){
                 value = item;
                 node = null;}
    } // #Node
   Node root;
   BinList(){ root = null; }
   void add(int value){
       root = addValue(root, value);
         }
    Node addValue(Node root, int value){
     // return new node if tree is empty
     if (root == null){ root = new Node(value); return root; }
     // add node in required place
     if(value < root.value){ root.node = addValue(root.node, value);}
     return root;
    } // #add 
    
    void display(Node this_node){
        if (this_node != null){
            System.out.print("_" + this_node.value);
            display(this_node.node);
        }
    }
    void inorder(){ inorderRec(root); }
    void inorderRec(Node root) {
        if(root != null){
            inorderRec(root.node);
            System.out.print("->" + root.value);
         }
        } // #inorderRec
} // #

public class Main
{
    public static void main(String[] args) {
         
    BinList list = new BinList(); 
    list.add(8);
    System.out.println("BinList output"); 
    list.display(list.root);
    list.add(3);
    list.display(list.root);
    list.add(1);
    list.display(list.root);
    //list.add(6);
    System.out.println();
    System.out.println("BinList in order output"); 
    list.inorder();
    }
}
