int[] _mas ={0,0,0,0,0,0,0};
//int []mas_stor={0,0,0,0,0,0,0};
int ii_stor;
boolean flag;
boolean i_flag;

Module mod0,mod1,mod2,mod3,mod4,mod5,mod6;
void setup() {
  frameRate(1);
size(500, 400);
mod0=new Module(_mas[0],50);
mod1=new Module(_mas[1],70);
mod2=new Module(_mas[2],90);
mod3=new Module(_mas[3],110);
mod4=new Module(_mas[4],130);
mod5=new Module(_mas[5],150);
mod6=new Module(_mas[6],170);

}

void draw() {
background(50);
ii_stor=_mas[0];

mod0.update(); 
mod0.display();

//mod1.update(); 
mod1.display();
//mod2.update(); 
mod2.display();
//mod3.update(); 
mod3.display();
//mod4.update(); 
mod4.display();
//mod5.update(); 
mod5.display();
//mod6.update(); 
mod6.display();

println(_mas);
}

void keyPressed() {
     if (keyCode == UP) {
        _mas[0]++;
        //if(!flag){flag=true;}
        
   } else if (keyCode == DOWN) {
         _mas[0]--;
        //if(flag){flag=false;}
    } 
 }


class Module {
int i;
//int i_stor=i;
int x;
int y;
int[] data = new int[]{0,0,0,0,0,0,0};

// Contructor
  Module(int iTemp, int xTemp){
    i= iTemp;
    x = xTemp;
    y=100;
  }
  
void update() {
data[i]=ii_stor;
}    
void display() {
 text(data[i], x, y);
 }
}
