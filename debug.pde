// https://vimeo.com/140134398

float x =200;
float y = 50;
float speed = 1;
float gravity = 0.3;

void setup(){
size(400,400);
}

void draw(){
background(255);

y=y+speed;
speed=speed+gravity;

if(y>height){
speed=speed*-0.9;
}

stroke(0);
fill(175);
ellipse(x,y,32,32);
}
