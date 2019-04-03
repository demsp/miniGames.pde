int x = 0;
void setup(){
size(100,100);
}
void draw() {
 background(204);
 rect(20,20,20,20);
   // Saves each frame as line-000001.png, line-000002.png, etc.
  //saveFrame("####.png");
}
void keyReleased(){
  saveFrame("####.png");
}
