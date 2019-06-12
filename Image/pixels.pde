size(400,400);
int halfImage = width*height/2;

PImage myImage = loadImage("0003.png");

image(myImage, 0, 0);
//color c;

loadPixels();
for (int i = 0; i < halfImage; i++) {
 color c=get(100,100);
  println(c);
  pixels[i] = c;
}
updatePixels();
