size(300,300);
noStroke();
colorMode(HSB, 200);

for (int i = 0; i < 200; i++) {
  for (int j = 0; j < 200; j++) {
    stroke(i, j, 200,100);
    point(i, j);
  }
}
