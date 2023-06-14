Node root, root_store;
void setup(){
size(500,400);
background(100);
root = new Node(5); 
root_store = root;
root.add(new Node(3)); 
root.add(new Node(8));
root.add(new Node(4));
root.add(new Node(7));
root.add(new Node(1));


root.display();
root.inorder(root_store);
}

class Node{
int value;
float x = 250, y = 50;
int counter = 1;
int space = 0;
Node left = null, right = null;
// constructor
 Node(int value){
  this.value = value; 
 }
 
 void add(Node node){
     if(node.value < this.value){
       if(left == null){
         node.counter = this.counter + 1;
         left = node;
         node.x = this.x - 120/counter;
         node.y = this.y + 120/counter;
       }else left.add(node); 
      }     
     if(node.value > this.value){     
       if(right == null){
         node.counter = this.counter + 1;
         right = node;
         node.x = this.x + 120/counter;
         node.y = this.y + 120/counter;
       } else right.add(node);
      } 
   }    
 
 void display(){  
   textSize(30);
   text(value, x, y);
   noFill();
   stroke(50);
   ellipse(x + 9, y - 11, 40, 40);
   if(left != null){
   line(this.x + 9 , (this.y - 11) + 20, left.x + 9, (left.y - 11) - 20);
   left.display(); }  
   if(right != null) {
   line(this.x + 9, (this.y - 11) + 20, right.x + 9, (right.y - 11) - 20);
   right.display();  } 
  }
 
 void inorder(Node node){
   if(node != null){
   inorder(node.left);
    textSize(35);
    text(node.value, 100 + space, 350);
    space = space + 35;
    inorder(node.right);
    }
  } 
}

