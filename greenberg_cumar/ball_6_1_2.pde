ball b1, b2, b3;
void setup() {
size(400, 400);
smooth();
// create the balls
//b1 = new ball();
//b2 = new ball();
//b3 = new ball();
b1 = new ball();
b2 = new ball(width/2, height/2, 50, color(0));
b3 = new ball(25, color(125, 125, 125));
} // setup()
void draw() {
background(255);
// display the balls
b1.display();
b2.display();
b3.display();
} 

class ball {
// Attributes
float x, y;
color ballColor; // its color
float radius; // its radius in pixels

// Constructor
ball() {
x = random(width);
y = random(height);
ballColor = color(255, 0, 0);
radius = 25;
} 
ball(float px, float py, float r, color c) {
// set up Ball with position (x, y)
x = px;
y = py;
// size, r pixels
radius = r;
// color, c
ballColor = c;
} // ball()
ball(float r, color c) {
x = random(width);
y = random(height);
// radius, r pixels
radius = r;
// color, c
ballColor = c;
} 
////\\\\////\\\\
void display() {
noStroke();
fill(ballColor);
ellipse(x, y, 2*radius, 2*radius);
} 
} 
