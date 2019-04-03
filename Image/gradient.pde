void setup() {
  size(640, 360);
  background(0);
  colorMode(HSB, 360, 100, 100);//HSB
  noStroke();
}
void draw() {
  background(0);
  int radius = 200;//dim/2;
  float h = 100;//random(0, 360);
  for (int r = radius; r > 0; --r) {
    fill(h, 90, 90);
    ellipse(200, 200, r, r);
    h = (h + 1) % 360;
  }
}
