ArrayList<PVector> vecs;

void setup(){
  size(500,500);
vecs = new ArrayList<PVector>();
vecs.add(new PVector(20,20));
 
}
void draw(){
  for(int i=0;i<vecs.size();i++){
  PVector veci = vecs.get(i);
  println(vecs);
  println(veci.x,veci.y);
  
  int j=i-1;
  if(i==0) j=0;
  PVector vecj = vecs.get(j);
  line(veci.x,veci.y,vecj.x,vecj.y);
  }
}
void mousePressed(){
vecs.add(new PVector(mouseX,mouseY));
}
