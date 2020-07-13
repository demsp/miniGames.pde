int[][] arr;

int rand1Val;
int rand2Val;
int rand3Val;
int heap1=int(random(1,30));
int heap2=int(random(1,30));
//int heap1=13;
//int heap2=7;
int rand123;
int counter1;
int counter2;
//button
int button1X=90, button1Y=225; 
int button2X=200, button2Y=225; 
int button3X=300, button3Y=225; 
int buttonSize = 50;     
boolean boolButton1 = false;
boolean boolButton2 = false;
boolean boolButton3 = false;

void setup() {
  size(420, 400);
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
void draw() { 
  background(50);
	 buttonUpdate(); 
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
	if(boolButton3 && mousePressed)  //button2
  { fill(200);
    rect(button3X,button3Y,buttonSize,buttonSize);
	 for (int y = 0; y <10; y += 1) {  // logic
		 if(arr[y][0]==heap1 && arr[y][1]<heap2) heap2=arr[y][1];
	   if(arr[y][1]==heap1 && arr[y][0]<heap2) heap2=arr[y][0];
		 if(arr[y][0]==heap2 && arr[y][1]<heap1) heap1=arr[y][1];
	   if(arr[y][1]==heap2 && arr[y][0]<heap1) heap1=arr[y][0];
	     } //logic
   } 
	
	 for (int y = 0; y <10; y += 1) {
    for (int x = 0; x < 10; x += 1) {
      //println(arr[x][y]);
			//if(arr[x][y]==heap1) println(heap1);
			//if(arr[x][y]==heap2) println(heap2);
      if(arr[x][y]==heap1) text(heap1,300,200);
			if(arr[x][y]==heap2) text(heap2,350,200);
    }
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
} //draw

// кнопка
// нажатие 
 void mousePressed() {
 rand123=int(random(1,4)); 
 if(boolButton1) {  
  if(heap1>=1) {heap1-=1; counter1++; }
	 else heap1=0;
 } //button1 
if(boolButton2) {  
 if(heap2>=1) {heap2-=1; counter2++; }
	 else heap2=0;	
  } //button2	 

if(boolButton3) { 	
rand1Val=int(random(1,heap1));
rand2Val=int(random(1,heap2));
rand3Val=int(random(1,min(heap1,heap2)));
 if(counter1==0 || counter2==0 || (counter1==counter2)) {
	 counter1=0;
	 counter2=0; 
  /*	
	 if(arr[0][0]==heap1 && arr[0][1]<heap2) heap2=arr[0][1];
	 if(arr[1][0]==heap1 && arr[1][1]<heap2) heap2=arr[1][1];
	 if(arr[2][0]==heap1 && arr[2][1]<heap2) heap2=arr[2][1];
	 if(arr[3][0]==heap1 && arr[3][1]<heap2) heap2=arr[3][1];
	 */
	 }
  } //button3 	 

 }
//отжатие 
// void mouseReleased() { }

void buttonUpdate() {
  if ( overButton(button1X, button1Y, buttonSize, buttonSize)  ) {
    boolButton1 = true;
  } else {
   boolButton1 = false;   }
//
	if ( overButton(button2X, button2Y, buttonSize, buttonSize)  ) {
    boolButton2 = true;
  } else {
   boolButton2 = false;   }
//	
	if ( overButton(button3X, button3Y, buttonSize, buttonSize)  ) {
    boolButton3 = true;
  } else {
   boolButton3 = false;   }
} //
boolean overButton(int x, int y, int width, int height)  {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
 } else {
  return false;
  }
} 

