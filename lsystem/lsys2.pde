// https://forum.processing.org/beta/num_1159135507.html

LSystem lsystem;
int iterations = 1;
float step;
void setup(){
  size(400, 400);
  lsystem = new LSystem("F", "F[+F]F[-F]F");
  lsystem.iterate(iterations);
  fitStep();
  println(lsystem.tree);
  smooth();
}
void draw(){
  background(255);
  lsystem.draw(0, height / 2, step, HALF_PI);
}
void fitStep(){
  int pushed = 0;
  int scaling = 0;
  for(int i = 0; i < lsystem.tree.length(); i++){
    switch(lsystem.tree.charAt(i)){
	case 'F':
	if(pushed == 0)
	scaling++;
	break;
	case '[':
	pushed++;	break;
	case ']':
	pushed--;
	break;
    }
  }
  step = (float)width / scaling;
}
void keyPressed(){
  lsystem.iterate(++iterations);
  fitStep();
}
class LSystem {
  char [] alphabet = {
    'F', '+', '-', '[', ']'};
  String axiom;
  String [] rule = {
    "", "+", "-", "[", "]"};
  String tree;
  LSystem(String axiom, String ruleset){
    rule[0] = ruleset;
    this.axiom = axiom;
    tree = "";
  }
  void draw(float x, float y, float step, float angle){
    pushMatrix();
    translate(x,y);
    for(int i = 0; i < tree.length(); i++){
	switch(tree.charAt(i)){
	  case 'F':
	    line(0, 0, step, 0);
	    translate(step, 0);
	  break;
	  case '+':
	    rotate(angle);
	  break;
	  case '-':
	    rotate(-angle);
	  break;
	  case '[':
	    pushMatrix();	  break;
	  case ']':
	    popMatrix();
	  break;
	}
    }
    popMatrix();
  }
  void iterate(int maxLength){
    println(tree);
    tree = new String(axiom);
    int [] ruleLength = new int[alphabet.length];
    for (int i = 0; i < alphabet.length; i++){
	ruleLength[i] = rule[i].length();
    }
    for (int i = 0; i < maxLength; i++){
	int newLength = 0;
	for (int j = 0; j < tree.length(); j++){
	  char c = tree.charAt(j);
	  for (int k = 0; k < alphabet.length; k++){
	    if (c == alphabet[k]){
		newLength += ruleLength[k];
		break;
	    }
	  }
	}
	StringBuffer newTree = new StringBuffer(newLength);
	for (int j = 0; j < tree.length(); j++){
	  char c = tree.charAt(j);
	  for (int k = 0; k < alphabet.length; k++){
	    if (c == alphabet[k]){
		newTree.append(rule[k]);
		break;
	    }
	  }
	}
	tree = newTree.toString();
    }
  }
}
 
