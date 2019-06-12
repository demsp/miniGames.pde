int i;
int j;
void setup(){
//size(400,400);
size(540,540);
//int halfImage = width*height/2;
//int vTemp;
//PImage myImage = loadImage("0003.png");
PImage myImage = loadImage("mnt2.jpg");

image(myImage, 0, 0);
//color c;
}

//void keyPressed(){
void draw(){

  if(keyPressed){
  
for ( i = 0; i < width; i++) {
 // for (int j = 0;  j< height; j=j+50) {  
//   for ( j = 0;  j< height; j=j+50) { 
 color c=get(i,j);
 //color c1=get(i,j-1);
 
  println(c);
// if(c1>=c){ }
stroke(c);
  //point(i,j);
 rect(j,i,1,1);
// stroke(c1);
 // point(i,j-1);
//  rect(i,j-1,10,10);
// }
} 

}
}

void keyPressed(){
//j=j+5;
if(j>=width) j=0;
j++;
}
