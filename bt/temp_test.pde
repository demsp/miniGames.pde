Node root;
   void setup(){
     background(100);
     size(400,70);
       root = new Node(5);      
       root.add( new Node(3) );
       root.add( new Node(4) );
       root.display();    
   }
   class Node{
   int value;
   int x = 150;
   Node next;
   //constructor
   Node(int value){
     this.value = value;     }
   void add(Node node){
     node.x = x + 50;     
     node.next = root;
     root = node;    }
   void display(){displayRoot(root);}  
   void displayRoot(Node root){
     textSize(40);
     //text(value, x, 50);
     while(root != null){
       text(root.value, root.x, 50); 
       root = root.next; 
       }
     }
   }
