ball b1, b2, b3;
void setup() {
size(400, 400);
smooth();
// create the balls
b1 = new ball();
b2 = new ball();
b3 = new ball();
} // setup()

void draw() {
background(255);
// display the balls
b1.move();
b1.display();
b2.move();
b2.display();
b3.move();
b3.display();
} // draw()


class ball { // Define the ball class
// Attributes
float x, y; // the x and y location
color ballColor; // its color
float radius; // its radius in pixels
float speed = 5.0; // The speed at which the ball is moving
float gravity = 0.1; // the rate of increase of speed
float dx = 1; // amount of lateral movement
float dampen = -0.9; // amount of dampening after each bounce
// Constructors
// Default Constructor
ball() {
this(random(width), random(height), 25.0, color(255, 0, 0));
} // Ball()
ball(float x, float y, float r, color c) {
// set up ball with position (x, y)
this.x = x;
this.y = y;
// size, r pixels
radius = r;
// color, c
ballColor = c;
} // ball()
ball(float r, color c) {
this(random(width), random(height), r, c);
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
void move() {
x = x + dx;
y = y + speed;
speed = speed + gravity;
// check to see if it bounces
bounce();
} //move()
void bounce() {
if (x > (width-radius)) { // bounce against the right edge
x = width-radius;
dx = -dx;
}
if (x < radius) { // bounce against the left edge
x = radius;
dx = -dx;
}
if (y > (height-radius)) { // bounce against the bottom edge
y = height-radius;
speed = speed * dampen ;
}
} // bounce()

} // class ball
