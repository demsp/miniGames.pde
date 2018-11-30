int[] _mas ={3,3,3};
int rectX=50;
int rand;
int rand1;
int global_i;
int shoot;
void setup() {
size(400, 400);
}
void draw() {
background(50);
frameRate(4);
textSize(60);
rect(rectX,320,40,5);
if(global_i==0){rectX=50;}
if(global_i==1){rectX=150;}
if(global_i==2){rectX=250;}
rand=int(random(0,3));
rand1=int(random(0,2));
_mas[rand]+=rand1;
text(_mas[0],50,100);
text(_mas[1],150,100);
text(_mas[2],250,100);
if(_mas[0]<0) {_mas[0]=0;}
if(_mas[1]<0) {_mas[1]=0;}
if(_mas[2]<0) {_mas[2]=0;}
if(_mas[0]<=1 && _mas[1]<=1 &&_mas[2]<=1){
text("You win", 100, 40);
frameRate(1);
_mas[0]=0;
_mas[1]=0;
_mas[2]=0;
}
}
void keyReleased() { 
shoot=1;
}
 void keyPressed() { 
    if (key == 32) {
       _mas[global_i]-=shoot;
     shoot=0;
      }
    if (keyCode == LEFT) {
        global_i--; 
        if (global_i < 0)
            global_i = 0;
    } 
    if (keyCode == RIGHT) {
        global_i++;
        if (global_i > 2)
            global_i = 2;
    } 
    if (keyCode == UP) {
        _mas[0]=2;
        _mas[1]=2;
        _mas[2]=2;
    }
}
