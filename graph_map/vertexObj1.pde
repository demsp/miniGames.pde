//  https://processing.org/reference/Object.html

// Declare and construct two objects (h1, h2) from the class HLine 
HLine h1 = new HLine(10,20, 1.0); 
HLine h2 = new HLine(20,30, 1.5);
HLine h3 = new HLine(60,90, 2.0); 
HLine h4 = new HLine(70,100, 2.5); 
 
void setup() 
{
  size(200, 200);
  frameRate(30);
}

void draw() { 
  background(200);
 beginShape(LINES);
  h1.update(); 
  h2.update();  
 endShape(); 
  beginShape(LINES);
  h3.update(); 
  h4.update();  
 endShape();
} 
 
class HLine { 
  float xpos, ypos, speed; 
  HLine (float x, float y, float s) {
    xpos = x;
    ypos = y; 
    speed = s; 
  } 
  void update() { 
    xpos += speed; 
    ypos += speed;
    if (xpos > width) { 
      xpos = 50; 
    } 
    if (ypos > height) { 
      ypos = 0; 
    }
   // line(0, ypos, width, ypos); 
    vertex(xpos, ypos);
  } 
} 
