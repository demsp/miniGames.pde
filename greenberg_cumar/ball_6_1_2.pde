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
} // draw()
class ball { // Define the ball class
// Attributes
float x, y; // the x and y location
color ballColor; // its color
float radius; // its radius in pixels
// Constructor
ball() {
// The ball has an random location in the sketch window
x = random(width);
y = random(height);
// All balls are red
ballColor = color(255, 0, 0);
// All balls are of radius 25 pixels
radius = 25;
} // ball()
// Behaviors
void display() {
// display the ball
// set color attributes
noStroke();
fill(ballColor);
// draw the ball
ellipse(x, y, 2*radius, 2*radius);
} // display()
} // class ball
