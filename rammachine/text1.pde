String text1="";
int x = 90;
void setup(){size(300,300);}
void draw() {
 noStroke();
 rect(x, 10, 3, 80);
 text(text1,100,100);
}
void keyPressed() {
  //if (keyCode == LEFT) {
    if (key == 'a') {
    x = x - 5;
    text1+=key;
    println(text1);
  }
}
