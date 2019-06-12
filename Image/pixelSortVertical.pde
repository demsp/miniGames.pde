color c;
int i=0;
int j=0;
int cTemp;
void setup(){
size(200,200);
noStroke();
PImage myImage = loadImage("l1.png");
image(myImage, 0, 0);
}

void draw(){
  while (j <= width) { //println(j);
  c=get(i,j);
  cTemp=c;
  j++;
  c=get(i,j);
 if(cTemp>c)  
  {
   fill(c);
   rect(i,j-1,1,1);  
   fill(cTemp);
  rect(i,j,1,1);
  } 
 }
  
  if(mousePressed){ if(i>=width)i=0; }
 if(j >= width){i++;j=0;}
}
