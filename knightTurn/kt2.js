class Module {
  constructor( xO,  yO, modColor){
    this.xO = xO;
    this.yO = yO;
    this.modColor=modColor;
  }
  // Custom method for drawing the object
   mouseClick() {    
   if (mouseX >= this.xO && mouseX <= this.xO+100 && 
      mouseY >= this.yO && mouseY <= this.yO+100) {
   if (overBox && mouseIsPressed && (mouseButton == LEFT)) {
     storX=this.xO;
      storY=this.yO; 
    if(bool_mouseReleased == true) {this.modColor=200;} 
         } 
      }
   }
  update() {
   fill(this.modColor);
    rect(this.xO, this.yO, unitSize, unitSize); 
  }
}
//  //  //  // 
let bool_mouseReleased=false;
let storX=0, storY=0;

let bx=0, by=0;
let boxSize = 100;
let overBox = false;
let locked = false;
let xOffset = 0.0,yOffset = 0.0; 
let unit = 100; // -> width / unit;
let unitSize=100; 
let count;
         
let mods = [];

function setup () {
   createCanvas(500, 500);
   rectMode(CORNER);
 stroke(100);
 
 let wideCount = width / unit;
  let highCount = height / unit;
  count = wideCount * highCount;
    let index = 0;
  for (let y = 0; y < highCount; y++) {
    for (let x = 0; x < wideCount; x++) {
      mods[index++] = new Module(x*unit, y*unit,20);
    }
  }
}
function draw() {
  background(0);
 for (let i = 0; i < count; i++) {
    mods[i].mouseClick();
    mods[i].update();    
   }
 // //  //  //  //
 // Test if the cursor is over the box 
  if (mouseX > bx && mouseX < bx+boxSize && 
      mouseY > by && mouseY < by+boxSize) {
    overBox = true;  
  } else {    overBox = false;  }
  //draw mod 1x1
  fill(200);
  rect(0,0,100,100);
 //draw the Knnifht
 rect(bx, by, boxSize, boxSize);
  fill(50);
   ellipse(bx+50,by+50,20,20);
}
//  //  //  //  //  //  //  //
 function mousePressed() {
  if(overBox) { 
    locked = true; 
    } else {
    locked = false;
  }
  xOffset = mouseX-bx; 
  yOffset = mouseY-by; 
}
 function mouseDragged() {
  bool_mouseReleased=false;
  if(locked) {
    bx = mouseX-xOffset; 
    by = mouseY-yOffset; 
  }
}
function mouseReleased() {
  bool_mouseReleased=true;
  locked = false;
  bx=storX;
  by=storY;
}
