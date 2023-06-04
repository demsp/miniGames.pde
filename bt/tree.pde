Node root;
 
 void setup() {
  size(500, 500); 
  background(100,190,100);
  textAlign(CENTER);  
    root = new Node(3);         
     root.add(new Node(5));
     root.display(); 
     root.add(new Node(9)); 
     root.display();
     root.add(new Node(4));
     root.display();
     root.add(new Node(1));
     root.display();
     root.add(new Node(2));
     root.display();
     root.add(new Node(7));
     root.display();
     root.add(new Node(6));
     root.add(new Node(10));
     root.add(new Node(8));
                     
}
//void draw() {}
 
class Node {
  int value;
  float x=270, y=50, lvl=1;
  Node left, right;
 
   Node(int value) {
    this.value = value;
  }
  
   void add(Node node) {
    if (node.value >= this.value) {
      if (this.right == null) {
        this.right = node;
        node.lvl = this.lvl+1;
        node.x = this.x + 150/(lvl*1.5);
        node.y = this.y + 150/(lvl*1.5);
      } else {
        this.right.add(node);
      }
    } else {
      if (this.left == null) {
        this.left = node;
        node.lvl = this.lvl+1;
        node.x = this.x - 150/(lvl*1.5);
        node.y = this.y + 150/(lvl*1.5);
      } else {
        this.left.add(node);
      }
    }
  }
 
void display() {
    stroke(200);
    if (left != null) {
      line(this.x, this.y, left.x, left.y);
      left.display();
    }
    if (right != null) {
      line(this.x, this.y, right.x, right.y);
      right.display();
    }
    noFill();   
    ellipse(x, y, 30, 30);
    fill(50);   
     textSize(20);
    //text(this.value, x, y+textAscent()/2);
    text(this.value, x, y+5);
  }
}
