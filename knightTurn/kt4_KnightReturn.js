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
  KnightReturn(){    
    if(boolButton && mouseIsPressed){      
    if(listOfCoordinatesX.length!=0){       
   if(this.xO == listOfCoordinatesX.slice(-1) &&  
   this.yO == listOfCoordinatesY.slice(-1) )   
      {this.modColor=20;} 
      } 
     }
  }
  update() {
   fill(this.modColor);
    rect(this.xO, this.yO, unitSize, unitSize); 
  }
}
//  //  //  // 
// list
let listOfCoordinatesX=[];
let listOfCoordinatesY=[];
//button
let buttonX=25, buttonY=525; // Position of button
let buttonSize = 50;
let boolButton=false;
//mouse
let bool_mouseReleased=false;
let storX=0, storY=0;

let edgeOfCanvas=500;
let bx=0, by=0;
let boxSize = 100;
let overBox = false;
let locked = false;
let xOffset = 0.0, yOffset = 0.0; 
let unit = 100; // -> width / unit;
let unitSize=100; 
let count;
         
let mods = [];

function setup () {
   createCanvas(500, 600);
   rectMode(CORNER);
 stroke(100);
 
 let wideCount = edgeOfCanvas / unit;
  let highCount = edgeOfCanvas / unit;
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
   buttonUpdate();
 for (let i = 0; i < count; i++) {
    mods[i].mouseClick();
    mods[i].update();
    mods[i].KnightReturn();
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
 //draw the Knight
 rect(bx, by, boxSize, boxSize);
  fill(50);
  ellipse(bx+50,by+50,20,20);
// draw button
rect(buttonX,buttonY,buttonSize,buttonSize);  
  if(boolButton && mouseIsPressed) { 
    fill(200);
     rect(buttonX,buttonY,buttonSize,buttonSize); }
 //print(boolButton);
  //print(listOfCoordinatesX) ;
}
//  //  //  //  //  //  //  //
 function mousePressed() {
  if(overBox) { 
    locked = true; 
    listOfCoordinatesX.push(bx);
    listOfCoordinatesY.push(by); 
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
   if(boolButton==false){
   bx=storX;
   by=storY; 
  } else if (boolButton==true){
    //if list not emty
    if(listOfCoordinatesX.length!=0){
   bx=listOfCoordinatesX.pop();
  by=listOfCoordinatesY.pop();   
   }  
  }
} 
// button
 function buttonUpdate() {
   if (mouseX >= buttonX && mouseX <= buttonX+buttonSize && 
      mouseY >= buttonY && mouseY <= buttonY+buttonSize)    {
    boolButton = true;
  } else {
   boolButton = false;
  }
}
