Tree tree;

void setup(){
tree=new Tree();
tree.add(5);

}

//void draw(){}

class Node {
    int value;
    Node left;
    Node right;

    Node(int x) {
        value = x;
    }
}


class Tree{
 public Node root = null;

 public void add(int value) {  
   println(value); //output 5
   if(root == null){  root = new Node(value);}
   }
/*
public void display(Node node, int level){
        if(node!=null){
            display(node.right, level+1);
            System.out.println("");
            if(node==root)
                System.out.print("Root-> ");
            for(int i=0;i<level&&node!=root;i++)
                System.out.print("             ");
            System.out.print(node.data+"< ");
            display(node.left, level+1);
        }
    }
*/
 
}
