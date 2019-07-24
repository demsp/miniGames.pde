// https://stackoverflow.com/questions/12532228/how-to-use-arraylist-in-processing

ArrayList <Drawing> drawings = new ArrayList <Drawing>();

void setup() {
  size(400, 400);
  smooth();
  noStroke();
  colorMode(HSB);
}

void draw() {
  background(0,0,255);
  for (int i=0;i<drawings.size();i++){
    drawings.get(i).display();
  }
}

void mouseDragged() {

  for (int i = drawings.size()-1;i>0;i--) {
    drawings.get(i).copy(drawings.get(i-1));
  }
  drawings.add(0,new Drawing(mouseX, mouseY));

}


class Drawing {
  float x, y, r;
  color c;

  void copy(Drawing copyFrom){
    x = copyFrom.x;
    y = copyFrom.y;
    r = copyFrom.r;
    c = copyFrom.c;
  }

  Drawing(float ax, float ay) {
    x=ax;
    y=ay;
    r=random(2, 20);
    c=color(random(100, 200), 255, 255);
  }  

  void display() {
    fill(c, 100);
    ellipse(x,y,r,r);
  }
}
