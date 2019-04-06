// https://www.openprocessing.org/sketch/298324/

ArrayList<Snowflake> snowflakes;

void setup(){
  size(800,800);
  background(120);
  snowflakes = new ArrayList<Snowflake>();
  int count = 0;
  while (count < 100){
    Snowflake s = new Snowflake(random(width), 0, random(1,5), 7);
    snowflakes.add(s);
    count = count + 1;
  }  
}
void draw(){
  background(120);
  
  int count = 0;
  while (count < snowflakes.size()){
    Snowflake s = snowflakes.get(count);
    s.updatePosition();
    s.drawSnowflake();
    count = count + 1;
  }
    
  
}

class Snowflake{
  float xpos,ypos,speed,size;
  color c;
  
  Snowflake(float x, float y, float speed_t, float size_t){
    xpos = x;
    ypos = y;
    speed = speed_t;
    size = size_t;
    c = color(255);
  }
  
  void updatePosition(){
    ypos = ypos + speed;
    if (ypos > height){
      ypos = 0;
    }
  }
  
  void drawSnowflake(){
    fill(c);
    noStroke();
    ellipse(xpos, ypos, size, size);
  }
}
    
