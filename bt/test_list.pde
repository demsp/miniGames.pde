Node root;

void setup(){
size(500,500);
background(100);
root = new Node(2);
root.display();
root.add(5);
root.temp.display();
root.add(7);
root.temp.display();
}

class Node{
int value;
int lvl=1;
Node temp = null;
  
  // constructor
  Node(int value){this.value = value;}
  
  Node add(int data_value){
  temp = new Node(data_value);
  temp.lvl = this.lvl + 1;
  lvl = lvl + 1;
  return temp;
  }
  
  void display(){
  textSize(50);
  text(value, 250, 100*lvl);
  }  
}
