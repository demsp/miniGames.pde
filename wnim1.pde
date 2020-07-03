int rand1Val;
int rand2Val;
int rand3Val;

int heap1=int(random(1,30));
int heap2=int(random(1,30));
int rand123;
int counter1;
int counter2;
//button1
int button1X=90, button1Y=225; 
int button2X=200, button2Y=225; 
int button3X=300, button3Y=225; 
int buttonSize = 50;     
boolean boolButton1 = false;
boolean boolButton2 = false;
boolean boolButton3 = false;

void setup() {
  size(420, 400);
  }

void draw() { 
  background(50);
     button1Update();  /////////
     button2Update();  /////////
	   button3Update();

  // draw button
  fill(150);
  rect(button1X,button1Y,buttonSize,buttonSize);
	rect(button2X,button2Y,buttonSize,buttonSize);
	rect(button3X,button3Y,buttonSize,buttonSize);
   if(boolButton1 && mousePressed) //button1 
  { fill(200);
    rect(button1X,button1Y,buttonSize,buttonSize);
   }	
	 if(boolButton2 && mousePressed)  //button2
  { fill(200);
    rect(button2X,button2Y,buttonSize,buttonSize);
   } 
	if(boolButton3 && mousePressed)  //button3
  { fill(200);
    rect(button3X,button3Y,buttonSize,buttonSize);
   } 
	fill(100);
  textSize(25);
  //text(counter1,37,360);
	//text(counter2,95,360);
	text("Take",85,100); 
	text(counter1,155,100);
	text("from 1st heap",195,100);
	text("and",85,130); 
	text(counter2,155,130);
	text("from 2st heap",195,130);
	textSize(20);
	text("Button1",80,300);
	text("Button2",190,300);
	text("Next Turn",290,300);
	text(rand123,350,350);
	
	//heaps
	textSize(50);
	text(heap1,100,200);
	text(heap2,200,200);
	textSize(15);
	text(rand1Val,10,300);
	text(rand2Val,10,320);
	text(rand3Val,10,340);
}

// кнопка
// нажатие 
 void mousePressed() {
 rand123=int(random(1,4)); 
 if(boolButton1) {  
  if(heap1>=1) {heap1-=1; counter1++; }
	 else heap1=0;
 } 
if(boolButton2) {  
 if(heap2>=1) {heap2-=1; counter2++; }
	 else heap2=0;	
  } 	 

if(boolButton3) { 
	
	rand1Val=int(random(1,heap1));
	rand2Val=int(random(1,heap2));
	rand3Val=int(random(1,min(heap1,heap2)));
	
 if(counter1==0 || counter2==0 || (counter1==counter2)) {
	 counter1=0;
	 counter2=0; 
	 if(rand123==1)heap1=heap1-rand1Val;
	 if(rand123==2)heap2=heap2-rand2Val;
	 if(rand123==3){heap1=heap1-rand3Val;heap2=heap2-rand3Val; }
    }
 
   } 	 

 }
//отжатие 
// void mouseReleased() { }

 void button1Update() {
  if ( overButton(button1X, button1Y, buttonSize, buttonSize)  ) {
    boolButton1 = true;
  } else {
   boolButton1 = false;
  }	
}

 void button2Update() {
  if ( overButton(button2X, button2Y, buttonSize, buttonSize)  ) {
    boolButton2 = true;
  } else {
   boolButton2 = false;
  }	
}

void button3Update() {
  if ( overButton(button3X, button3Y, buttonSize, buttonSize)  ) {
    boolButton3 = true;
  } else {
   boolButton3 = false;
  }	
}

boolean overButton(int x, int y, int width, int height)  {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
 } else {
  return false;
  }
} 
