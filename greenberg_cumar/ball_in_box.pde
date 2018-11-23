box b;
void setup() {
size(400, 400);
smooth();
// Create a 200*200 box with 50 balls
b = new box(100, 100, 200, 200, 50);
} // setup()
void draw() {
background(255);
// display the balls
b.update();
b.display();
} // draw()

class ball { // Define the ball class
// Attributes
PVector location; // ball's location
color ballColor; // its color
float radius; // its radius in pixels
PVector speed; // dx and dy
box b; // ball is inside Box, b
ball(box b) { // Default Constructor
this(random(width), random(height), 25, color(255, 0, 0), b);
} // ball()
ball(float x, float y, float r, color c, box _b) {
location = new PVector(x, y); // set up ball with position (x, y), radius r, color c
radius = r; // radius, r pixels
ballColor = c; // color, c
// speed at which the ball travels
speed = new PVector(random(1, 3), random(1, 3));
// Its enclosing box
b = _b;
} // ball()
// Behaviors...
void display() {
// display the ball
// set color attributes
noStroke();
fill(ballColor);
// draw the ball
ellipse(location.x, location.y, 2*radius, 2*radius);
} // display()
void move() {
location.add(speed);
bounce();
} // move()
void bounce() {
if (location.x > (b.w-radius)) { // bounce against the right edge of box
location.x = b.w-radius;
speed.x = -speed.x;
}
if (location.x < radius) { // bounce against the left edge of box
location.x = radius;
speed.x = -speed.x;
}
if (location.y > (b.h-radius)) { // bounce against the bottom edge of box
location.y = b.h-radius;
speed.y = -speed.y;
}
if (location.y < radius) { // bounce against the top edge of box
location.y = radius;
speed.y = -speed.y;
}
} // bounce()
} // class ball

class box {
float x, y, w, h; // top left corner (x, y), width (w), height (h)
int nBalls; // # of balls in the box
int ballRadius = 2;
ball [] balls; // place to store all the balls in this box
// Constructor
box(float x, float y, float w, float h, int n) {
this.x = x;
this.y = y;
this.w = w;
this.h = h;
this.nBalls = n;
// Create balls...
balls = new ball[nBalls];
for (int i=0; i < balls.length; i++) {
balls[i] = new ball(w/2, h/2, ballRadius, color(0), this);
}
} // box()
void display() {
// draw box
pushMatrix();
translate(x, y);
stroke(0);
fill(255);
rect(0, 0, w, h);
// draw balls
for (int i=0; i < balls.length; i++) {
balls[i].display();
}
popMatrix();
} // display()
void update() {
// move each ball...
for (int i=0; i < balls.length; i++) {
balls[i].move();
}
} // update
} // class box
