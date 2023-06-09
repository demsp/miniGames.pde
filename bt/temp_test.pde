Node root;
   void setup(){
     background(100);
     size(400,70);
       root = new Node(5);
       root.display();
       root = new Node(3);
       root.add();
       root.display();
       root = new Node(7);
       root.add();
       root.display();     
     }
   
   class Node{
   int value;
   int x = 150;
   //constructor
   Node(int value){
     this.value = value;
     }
   void add(){addNode(root);}  
    void addNode(Node node){
     node.x = x + 50;
          
   }  
   void display(){
     textSize(40);
     text(value, x, 50);
     }
   }
