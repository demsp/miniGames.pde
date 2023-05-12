Node root;
Node temp_store;
  void setup(){
  background(100);
  size(300,300);
  root = new Node(5);
  temp_store = root;
  root.add(new Node(7));
  root.add(new Node(8));
  root.printList(temp_store);
  }
  
  class Node{
  int data;
  int x = 50;
  Node next;
  Node(int data){this.data = data;}
  void add(Node next){ this.next = next; 
            root = this.next;}
  void printList(Node node){
     textSize(40);
     while(node != null){
     text(node.data,x, 50);
     node = node.next;
     this.x = x + 50;
     } // #while
    } // #printList
    
  } // #class
