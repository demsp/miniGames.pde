int[][] arr;
int rand=int(random(1,3));
int counter1 = 0;
int counter2 = 0;
int heap1 = int(random(1,30)); 
int heap2 = int(random(1,30));
int button1X=90; int buttonY=300;
int button2X=500;
int buttonSize=120;
int button3X=500;
int button3Y=500;
int button3Size=170;
int currentColor=90, baseColor=90;
boolean rect1Over=false, rect2Over=false, 
        rect3Over=false,bool3rdPress=false;
boolean my_bool;        

void setup(){
size(700,700);
arr = new int[10][10];
  arr[0][0]=1;arr[0][1]=2;
  arr[1][0]=3;arr[1][1]=5;
  arr[2][0]=4;arr[2][1]=7;
  arr[3][0]=6;arr[3][1]=10;
  arr[4][0]=8;arr[4][1]=13;
  arr[5][0]=9;arr[5][1]=15;
  arr[6][0]=11;arr[6][1]=18;
  arr[7][0]=12;arr[7][1]=20;
  arr[8][0]=14;arr[8][1]=23;
  arr[9][0]=16;arr[9][1]=26;
}

void draw(){
background(50);
fill(100);
textSize(100);
text(heap1,100,200);
text(heap2,500,200);
update();
rect(button1X,buttonY,buttonSize,buttonSize);
rect(button2X,buttonY,buttonSize,buttonSize);
rect(button3X,button3Y,button3Size,button3Size);
if(rect1Over && mousePressed){
fill(150);
rect(button1X,buttonY,buttonSize,buttonSize);}
if(rect2Over && mousePressed){
fill(150);
rect(button2X,buttonY,buttonSize,buttonSize);}

if(rect3Over && mousePressed){ //button3
fill(150);
rect(button3X,button3Y,button3Size,button3Size);

// 2 and 1
if(heap1==1 && heap2==2 && !my_bool) {heap1=1;heap2=1;my_bool=true;}
if(heap1==2 && heap2==1 && !my_bool) {heap1=1;heap2=1;my_bool=true;}
// 1zero
 if(heap1==0 && heap2!=0 && !my_bool) {heap2=0;my_bool=true;}
 if(heap2==0 && heap1!=0 && !my_bool) {heap1=0;my_bool=true;}
// heap1==heap2
 if(heap1==heap2 && !my_bool) {heap1=heap2=0;my_bool=true;}
//logic
for(int i=0;i<10;i++){
 //random
 if(heap1==arr[i][0] && heap2==arr[i][1] && !my_bool)
 { int x=int(random(1,heap1));
   if(rand==1){heap1-=x;} else{heap1-=x;heap2-=x;} my_bool=true;}
 if(heap2==arr[i][0] && heap1==arr[i][1] && !my_bool)
 {int y=int(random(1,heap2));
 if(rand==1){heap2-=y;} else{heap1-=y;heap2-=y;} my_bool=true;} 
 //
 if(arr[i][0]==heap1 && arr[i][1]<heap2 && !my_bool){heap2=arr[i][1];my_bool=true;}
 if(arr[i][0]==heap2 && arr[i][1]<heap1 && !my_bool){heap1=arr[i][1];my_bool=true;}
 if(arr[i][1]==heap1 && arr[i][0]<heap2 && !my_bool){heap2=arr[i][0];my_bool=true;}
 if(arr[i][1]==heap2 && arr[i][0]<heap1 && !my_bool){heap1=arr[i][0];my_bool=true;}
//
 if(heap2-heap1==arr[i][1]-arr[i][0] && !my_bool){heap2=arr[i][1]; heap1=arr[i][0];my_bool=true;}
 if(heap1-heap2==arr[i][1]-arr[i][0] && !my_bool){heap1=arr[i][1]; heap2=arr[i][0];my_bool=true;}
 
  }//for
 }//button3
}//draw

void update(){
 if(overRect(button1X,buttonY,buttonSize)){rect1Over=true;}
  else{rect1Over=false;}
 if(overRect(button2X,buttonY,buttonSize)){rect2Over=true;}
  else{rect2Over=false;}
 if(overRect(button3X,button3Y,button3Size)){rect3Over=true;}
  else{rect3Over=false;} 
}

boolean overRect(int x, int y, int z){
 if(mouseX>=x && mouseX<=x+z && mouseY>=y && mouseY<=y+z){return true;}
  else {return false;} 
}

void mousePressed(){my_bool=false;}

void mouseReleased(){
if(rect1Over){
 if(counter2==0 && !bool3rdPress){heap1-=1; counter1++;}
  else if(counter2!=0 && !bool3rdPress){
          bool3rdPress=true;
          heap1-=counter2;
          counter1=counter2=0;}
  }//rect1Over
if(rect2Over){ 
 if(counter1==0 && !bool3rdPress){heap2-=1; counter2++;}
 else if(counter1!=0 && !bool3rdPress){
          bool3rdPress=true;
          heap2-=counter1;
          counter1=counter2=0;}
  }//rect1Over
if(rect3Over){
    bool3rdPress=false;
    counter1=counter2=0;}
}// mouseReleased
